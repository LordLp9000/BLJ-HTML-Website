const fs = require('fs');

console.log('🔍 Finding players that need detailed stats copied from sport databases to top 50...\n');

// Read the HTML file
const htmlContent = fs.readFileSync('/workspaces/BLJ-HTML-Website/goat_sports_Projektarbeit_website.html', 'utf8');

// Manually extract player data using regex patterns
const sportPlayersData = [];
const top50PlayersData = [];

// Extract sport database players with detailed stats
const sportDbPattern = /{ name: "([^"]+)"[^}]*offensive: ([0-9.]+)[^}]*defensive: ([0-9.]+)[^}]*achievementsRating: ([0-9.]+)[^}]*longevity: ([0-9.]+)[^}]*clutchImpact: ([0-9.]+)[^}]*(?:, hidden: true)?[^}]*}/g;
let sportMatch;
while ((sportMatch = sportDbPattern.exec(htmlContent)) !== null) {
    if (!sportMatch[0].includes('hidden: true')) { // Only non-hidden players
        sportPlayersData.push({
            name: sportMatch[1],
            fullData: sportMatch[0]
        });
    }
}

// Extract top 50 players
const top50Pattern = /{ rank: (\d+), name: "([^"]+)"[^}]*}/g;
let top50Match;
while ((top50Match = top50Pattern.exec(htmlContent)) !== null) {
    top50PlayersData.push({
        rank: parseInt(top50Match[1]),
        name: top50Match[2],
        fullData: top50Match[0]
    });
}

console.log(`Found ${sportPlayersData.length} players in sport databases with detailed stats`);
console.log(`Found ${top50PlayersData.length} players in top 50 list`);

// Find matches and create replacements
const replacements = [];

top50PlayersData.forEach(top50Player => {
    const sportPlayer = sportPlayersData.find(sp => sp.name === top50Player.name);
    
    if (sportPlayer) {
        // Extract detailed stats from sport player
        const statPattern = /(offensive: [0-9.]+, defensive: [0-9.]+, achievementsRating: [0-9.]+, longevity: [0-9.]+, clutchImpact: [0-9.]+)/;
        const statMatch = sportPlayer.fullData.match(statPattern);
        
        if (statMatch) {
            const detailedStats = statMatch[1];
            
            // Create new top 50 entry with detailed stats
            const newTop50Data = top50Player.fullData.replace(
                /, country: "([^"]+)" }/,
                `, country: "$1", ${detailedStats} }`
            );
            
            replacements.push({
                rank: top50Player.rank,
                name: top50Player.name,
                oldData: top50Player.fullData,
                newData: newTop50Data
            });
        }
    }
});

console.log(`\n✅ Found ${replacements.length} players that need detailed stats copied:\n`);

replacements.forEach(replacement => {
    console.log(`${replacement.rank}. ${replacement.name}`);
    console.log(`   OLD: ${replacement.oldData.substring(0, 100)}...`);
    console.log(`   NEW: ${replacement.newData.substring(0, 100)}...`);
    console.log('');
});

// Generate update commands
console.log('\n📝 Ready to apply fixes to all players missing detailed stats!');