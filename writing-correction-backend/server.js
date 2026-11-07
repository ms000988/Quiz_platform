import express from "express";
import fetch from "node-fetch";

const app = express();
app.use(express.json());

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

app.get("/", (req, res) => {
    res.send("Writing correction API is running.");
});

app.listen(10000, () => console.log("Server running on port 10000"));
