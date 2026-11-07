import express from "express";
import cors from "cors";
import fetch from "node-fetch";

const app = express();

// CORS FIX
app.use(cors({
    origin: "*",
    methods: ["GET", "POST", "OPTIONS"],
    allowedHeaders: ["Content-Type"]
}));

app.use(express.json());

// Correction endpoint
app.post("/correct", async (req, res) => {
    const text = req.body.text;

    const params = new URLSearchParams();
    params.append("text", text);
    params.append("language", "sv");

    const response = await fetch("https://api.languagetool.org/v2/check", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: params
    });

    const data = await response.json();

    res.json({ matches: data.matches });
});

app.post("/cefr", async (req, res) => {
    const text = req.body.text.trim();
    const words = text.split(/\s+/).length;

    // 1. Too short
    if (words < 40) {
        return res.json({ cefr: "TooShort" });
    }

    // 2. Repeated lines (meaningless)
    const lines = text.split("\n").map(l => l.trim());
    const uniqueLines = new Set(lines);
    if (uniqueLines.size <= 2 && lines.length > 3) {
        return res.json({ cefr: "Meaningless" });
    }

    // 3. No verbs → not a real text
    const hasVerb = /(är|har|ska|kan|vill|tycker|bor|finns|kommer|går)/i.test(text);
    if (!hasVerb) {
        return res.json({ cefr: "NoVerbs" });
    }

    // 4. Not enough sentences
    const sentenceCount = text.split(/[.!?]/).filter(s => s.trim().length > 0).length;
    if (sentenceCount < 2) {
        return res.json({ cefr: "TooFewSentences" });
    }

    // 5. CEFR model
    try {
        const response = await fetch(
            "https://api-inference.huggingface.co/models/cointegrated/roberta-base-cefr-classification",
            {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer hf_xxxxxxxxxxxxx"
                },
                body: JSON.stringify({ text })
            }
        );

        const result = await response.json();

        if (!Array.isArray(result)) {
            return res.json({ cefr: "Error" });
        }

        const best = result.sort((a, b) => b.score - a.score)[0];
        res.json({ cefr: best.label });

    } catch (err) {
        res.json({ cefr: "Error" });
    }
});



// Root route
app.get("/", (req, res) => {
    res.send("Writing correction API is running.");
});

// Render requires PORT from environment
const PORT = process.env.PORT || 10000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
