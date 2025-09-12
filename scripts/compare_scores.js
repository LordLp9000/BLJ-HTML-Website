const fs = require('fs');

// Read the HTML file
const htmlContent = fs.readFileSync('/workspaces/BLJ-HTML-Website/goat_sports_Projektarbeit_website.html', 'utf8');

console.log("=== SCORE COMPARISON: Individual Sports DB vs Top 50 ===\n");

// Simple approach: extract player data using regex patterns
const players = {
    top50: new Map(),
    sportDb: new Map()
};

// Extract top 50 players with regex
const top50Matches = htmlContent.matchAll(/{ rank: \d+, name: "([^"]+)"[^}]+score: ([\d.]+)[^}]+sport: "([^"]+)"/g);
for (const match of top50Matches) {
    const [, name, score, sport] = match;
    players.top50.set(name, { score: parseFloat(score), sport });
}

// Extract sport database players with regex
const sportMatches = htmlContent.matchAll(/{ name: "([^"]+)"[^}]+score: ([\d.]+)[^}]+(?!.*hidden: true)/g);
for (const match of sportMatches) {
    const [, name, score] = match;
    // Skip if this player has "hidden: true" after the score
    const fullMatch = match[0];
    if (!fullMatch.includes('hidden: true')) {
        players.sportDb.set(name, { score: parseFloat(score) });
    }
}

console.log(`Found ${players.top50.size} players in top 50`);
console.log(`Found ${players.sportDb.size} players in sport databases\n`);

// Find score discrepancies
const scoreDiscrepancies = [];
for (const [name, top50Data] of players.top50) {
    const sportData = players.sportDb.get(name);
    if (sportData && Math.abs(sportData.score - top50Data.score) > 0.01) {
        scoreDiscrepancies.push({
            name,
            sport: top50Data.sport,
            top50Score: top50Data.score,
            sportDbScore: sportData.score,
            difference: sportData.score - top50Data.score
        });
    }
}

if (scoreDiscrepancies.length === 0) {
    console.log("✅ All scores match between individual sport databases and top 50!");
} else {
    console.log("❌ SCORE MISMATCHES FOUND:\n");
    scoreDiscrepancies.forEach(discrepancy => {
        console.log(`${discrepancy.name} (${discrepancy.sport}):`);
        console.log(`  Top 50 Score: ${discrepancy.top50Score}`);
        console.log(`  Sport DB Score: ${discrepancy.sportDbScore}`);
        console.log(`  Difference: ${discrepancy.difference > 0 ? '+' : ''}${discrepancy.difference.toFixed(1)}`);
        console.log("");
    });
    
    console.log("=== CORRECTION NEEDED ===");
    console.log("The top 50 rankings should use the scores from individual sport databases.");
    console.log("Players with score discrepancies:", scoreDiscrepancies.length);
}