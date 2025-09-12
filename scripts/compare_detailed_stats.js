const fs = require('fs');

// Read the HTML file
const htmlContent = fs.readFileSync('/workspaces/BLJ-HTML-Website/goat_sports_Projektarbeit_website.html', 'utf8');

// Extract sportDatabases section - find the actual object content
const sportDbStart = htmlContent.indexOf('const sportDatabases = {');
const sportDbStartBrace = htmlContent.indexOf('{', sportDbStart);
let braceCount = 0;
let sportDbEnd = sportDbStartBrace;

// Find matching closing brace
for (let i = sportDbStartBrace; i < htmlContent.length; i++) {
    if (htmlContent[i] === '{') braceCount++;
    if (htmlContent[i] === '}') braceCount--;
    if (braceCount === 0) {
        sportDbEnd = i + 1;
        break;
    }
}

const sportDbCode = 'const sportDatabases = ' + htmlContent.substring(sportDbStartBrace, sportDbEnd) + ';';

// Extract top50PlayersData section
const top50Start = htmlContent.indexOf('const top50PlayersData = [');
const top50End = htmlContent.indexOf('];', top50Start) + 2;
const top50Code = htmlContent.substring(top50Start, top50End);

console.log('Extracting data...');

// Execute the code to get the data
let sportDatabases, top50PlayersData;
try {
    eval(sportDbCode);
    eval(top50Code);
} catch (error) {
    console.error('Error parsing data:', error.message);
    process.exit(1);
}

console.log('=== DETAILED STATS COMPARISON ===\n');

// Create a map of players from sport databases
const sportPlayersMap = new Map();

Object.keys(sportDatabases).forEach(sport => {
    sportDatabases[sport].forEach(player => {
        if (!player.hidden) { // Only non-hidden players
            sportPlayersMap.set(player.name, {
                sport: sport,
                ...player
            });
        }
    });
});

// Check each top 50 player
let mismatches = [];

top50PlayersData.forEach((top50Player, index) => {
    const sportPlayer = sportPlayersMap.get(top50Player.name);
    
    if (sportPlayer) {
        let hasMismatch = false;
        let differences = [];
        
        // Compare detailed stats
        const statsToCheck = ['offensive', 'defensive', 'achievementsRating', 'longevity', 'clutchImpact'];
        
        statsToCheck.forEach(stat => {
            if (sportPlayer[stat] !== undefined) {
                if (top50Player[stat] !== sportPlayer[stat]) {
                    hasMismatch = true;
                    differences.push(`${stat}: ${top50Player[stat] || 'missing'} → ${sportPlayer[stat]}`);
                }
            }
        });
        
        // Compare basic info
        if (top50Player.score !== sportPlayer.score) {
            hasMismatch = true;
            differences.push(`score: ${top50Player.score} → ${sportPlayer.score}`);
        }
        
        if (top50Player.achievements !== sportPlayer.achievements) {
            hasMismatch = true;
            differences.push(`achievements: different text`);
        }
        
        if (hasMismatch) {
            mismatches.push({
                rank: top50Player.rank,
                name: top50Player.name,
                sport: top50Player.sport,
                differences: differences
            });
        }
    }
});

if (mismatches.length > 0) {
    console.log(`Found ${mismatches.length} players with mismatched stats:\n`);
    
    mismatches.forEach(mismatch => {
        console.log(`${mismatch.rank}. ${mismatch.name} (${mismatch.sport}):`);
        mismatch.differences.forEach(diff => {
            console.log(`   - ${diff}`);
        });
        console.log('');
    });
} else {
    console.log('✅ All players have matching detailed stats between databases');
}

console.log('\n=== SUMMARY ===');
console.log(`Total top 50 players: ${top50PlayersData.length}`);
console.log(`Players found in sport databases: ${mismatches.length + (top50PlayersData.length - mismatches.length)}`);
console.log(`Players with mismatched stats: ${mismatches.length}`);