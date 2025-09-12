const fs = require('fs');

// Read the HTML file
const content = fs.readFileSync('goat_sports_Projektarbeit_website.html', 'utf8');

// Extract the sportDatabases object
const match = content.match(/const sportDatabases = \{([\s\S]*?)\};/);
if (!match) {
  console.log('Could not find sportDatabases object');
  process.exit(1);
}

// Parse the sportDatabases object
const sportDbStr = '{' + match[1] + '}';
let sportDatabases;

try {
  sportDatabases = new Function('return ' + sportDbStr)();
} catch (e) {
  console.log('Error parsing sportDatabases:', e.message);
  process.exit(1);
}

console.log('=== INDIVIDUAL SPORT TOP 10 RANKING ISSUES ===\n');

// Check each sport's top 10 (non-hidden players only)
Object.keys(sportDatabases).forEach(sport => {
  const players = sportDatabases[sport].filter(p => !p.hidden);
  
  console.log(`\n=== ${sport.toUpperCase()} TOP 10 ===`);
  console.log('Current order vs Correct order by score:');
  
  // Show current order
  console.log('\nCURRENT ORDER:');
  players.forEach((player, index) => {
    console.log(`${index + 1}. ${player.name} - Score: ${player.score}`);
  });
  
  // Sort by score to show correct order
  const sortedPlayers = [...players].sort((a, b) => b.score - a.score);
  
  console.log('\nCORRECT ORDER (by score):');
  sortedPlayers.forEach((player, index) => {
    console.log(`${index + 1}. ${player.name} - Score: ${player.score}`);
  });
  
  // Identify misplaced players
  console.log('\nMISPLACED PLAYERS:');
  let foundIssues = false;
  
  players.forEach((player, currentIndex) => {
    const correctIndex = sortedPlayers.findIndex(p => p.name === player.name);
    if (currentIndex !== correctIndex) {
      console.log(`❌ ${player.name}: Currently position ${currentIndex + 1}, should be position ${correctIndex + 1} (score: ${player.score})`);
      foundIssues = true;
    }
  });
  
  if (!foundIssues) {
    console.log('✅ No issues found - all players correctly ordered');
  }
  
  console.log('---'.repeat(20));
});

console.log('\n=== SUMMARY ===');
console.log('Individual sport databases need to be reordered by score to match the main top 50 ranking logic.');
console.log('This ensures consistency between the main rankings and sport-specific rankings.');