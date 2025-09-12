// Extract and analyze the top 50 rankings
const fs = require('fs');

// Read the HTML file
const content = fs.readFileSync('goat_sports_Projektarbeit_website.html', 'utf8');

// Extract the top50PlayersData array
const startMarker = 'const top50PlayersData = [';
const endMarker = '];';

const startIndex = content.indexOf(startMarker);
const endIndex = content.indexOf(endMarker, startIndex) + endMarker.length;

const arrayCode = content.slice(startIndex, endIndex);

// Parse the data (simple extraction)
const playerMatches = arrayCode.match(/\{ rank: (\d+), name: "([^"]+)"[^}]+score: ([\d.]+)[^}]+\}/g);

const players = [];
if (playerMatches) {
    playerMatches.forEach(match => {
        const rankMatch = match.match(/rank: (\d+)/);
        const nameMatch = match.match(/name: "([^"]+)"/);
        const scoreMatch = match.match(/score: ([\d.]+)/);
        
        if (rankMatch && nameMatch && scoreMatch) {
            players.push({
                rank: parseInt(rankMatch[1]),
                name: nameMatch[1],
                score: parseFloat(scoreMatch[1])
            });
        }
    });
}

console.log('Current rankings:');
players.sort((a, b) => a.rank - b.rank).forEach(p => {
    console.log(`Rank ${p.rank}: ${p.name} - Score: ${p.score}`);
});

console.log('\n\nCorrect order by score:');
players.sort((a, b) => b.score - a.score).forEach((p, index) => {
    const correctRank = index + 1;
    const isCorrect = p.rank === correctRank;
    console.log(`${isCorrect ? '✓' : '✗'} Should be Rank ${correctRank}: ${p.name} - Score: ${p.score} (Currently rank ${p.rank})`);
});

console.log('\n\nPlayers with incorrect rankings:');
players.sort((a, b) => b.score - a.score).forEach((p, index) => {
    const correctRank = index + 1;
    if (p.rank !== correctRank) {
        console.log(`${p.name}: Should be rank ${correctRank} but is currently rank ${p.rank} (Score: ${p.score})`);
    }
});

// Check for duplicates
console.log('\n\nChecking for duplicates:');
const nameCount = {};
players.forEach(p => {
    nameCount[p.name] = (nameCount[p.name] || 0) + 1;
});

Object.entries(nameCount).forEach(([name, count]) => {
    if (count > 1) {
        console.log(`Duplicate found: ${name} appears ${count} times`);
    }
});