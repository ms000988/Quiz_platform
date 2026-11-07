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
    const text = req.body.text;

    try {
        const response = await fetch(
            "https://api-inference.huggingface.co/models/cointegrated/roberta-base-cefr-classification",
            {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer hf_xxxxxxxxxxxxxxxxx" // optional if you have a free key
                },
                body: JSON.stringify({ text })
            }
        );

        const result = await response.json();

        if (!Array.isArray(result)) {
            return res.json({ cefr: "Unknown" });
        }

        // Pick the highest scoring CEFR label
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
