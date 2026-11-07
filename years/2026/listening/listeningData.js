export const listeningParts = [
    {
        id: 1,
        title: "Del 1 – På busshållplatsen",
        audio: "audio1.mp3",   // add later
        questions: [
            {
                q: "Vad väntar personen på?",
                options: ["Bussen", "Tåget", "Taxi"],
                answer: 0
            },
            {
                q: "Vad är problemet?",
                options: ["Bussen är sen", "Det regnar", "Han tappade sin mobil"],
                answer: 0
            }
        ]
    },
    {
        id: 2,
        title: "Del 2 – I affären",
        audio: "audio2.mp3",
        questions: [
            {
                q: "Vad vill kunden köpa?",
                options: ["Bröd", "Mjölk", "Kaffe"],
                answer: 2
            }
        ]
    }
];
