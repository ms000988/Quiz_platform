// Load a section and return a Promise so we can wait for it
function loadSection(id, file) {
    return fetch(file)
        .then(res => res.text())
        .then(html => {
            document.getElementById(id).innerHTML = html;
        });
}

// Load all sections
loadSection("sectionA", "sectionA.html");
loadSection("sectionB", "sectionB.html");
loadSection("sectionC", "sectionC.html");
loadSection("sectionD", "sectionD.html");
loadSection("sectionE", "sectionE.html");
loadSection("sectionF", "sectionF.html");
loadSection("sectionG", "sectionG.html");

// Load Section H LAST, then initialize Chart.js
loadSection("sectionH", "sectionH.html").then(() => {
    if (typeof initChart === "function") {
        initChart();
    }
});
