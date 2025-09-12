const fs = require('fs');

// Read the HTML file
const content = fs.readFileSync('goat_sports_Projektarbeit_website.html', 'utf8');

// Extract the top50PlayersData array using a more precise regex
const match = content.match(/const top50PlayersData = \[([\s\S]*?)\];/);
if (!match) {
  console.log('Could not find top50PlayersData array');
  process.exit(1);
}

// Parse the players data
const arrayStr = '[' + match[1] + ']';
let players;

try {
  // Use Function constructor instead of eval for safer evaluation
  players = new Function('return ' + arrayStr)();
} catch (e) {
  console.log('Error parsing array:', e.message);
  process.exit(1);
}

console.log('=== DUPLICATE RANK CHECK ===');
console.log('Total players:', players.length);

// Check for duplicate ranks
const ranks = players.map(p => p.rank);
const uniqueRanks = [...new Set(ranks)];

console.log('Unique ranks count:', uniqueRanks.length);

if (ranks.length !== uniqueRanks.length) {
  console.log('❌ DUPLICATES FOUND!');
  
  // Find duplicates
  const duplicates = ranks.filter((rank, index) => ranks.indexOf(rank) !== index);
  console.log('Duplicate ranks:', [...new Set(duplicates)]);
  
  // Show which players have duplicate ranks
  [...new Set(duplicates)].forEach(dupRank => {
    const playersWithRank = players.filter(p => p.rank === dupRank);
    console.log(`Rank ${dupRank}:`, playersWithRank.map(p => p.name));
  });
} else {
  console.log('✅ NO DUPLICATES - All ranks are unique!');
}

// Verify ranks are sequential 1-50
const expectedRanks = Array.from({length: 50}, (_, i) => i + 1);
const missingRanks = expectedRanks.filter(rank => !ranks.includes(rank));
const extraRanks = ranks.filter(rank => !expectedRanks.includes(rank));

if (missingRanks.length > 0) {
  console.log('❌ Missing ranks:', missingRanks);
}
if (extraRanks.length > 0) {
  console.log('❌ Extra/invalid ranks:', extraRanks);
}

if (missingRanks.length === 0 && extraRanks.length === 0) {
  console.log('✅ SEQUENTIAL CHECK PASSED - Ranks 1-50 all present');
}

// Verify score order
console.log('\n=== SCORE ORDER CHECK ===');
let scoreOrderCorrect = true;
for (let i = 0; i < players.length - 1; i++) {
  if (players[i].score < players[i + 1].score) {
    console.log(`❌ Score order violation: Rank ${players[i].rank} (${players[i].name}, ${players[i].score}) < Rank ${players[i + 1].rank} (${players[i + 1].name}, ${players[i + 1].score})`);
    scoreOrderCorrect = false;
  }
}

if (scoreOrderCorrect) {
  console.log('✅ SCORE ORDER CORRECT - Players properly sorted by score descending');
}

// Verify rank consistency
console.log('\n=== RANK CONSISTENCY CHECK ===');
let rankConsistencyCorrect = true;
for (let i = 0; i < players.length; i++) {
  const expectedRank = i + 1;
  if (players[i].rank !== expectedRank) {
    console.log(`❌ Rank inconsistency: Position ${i + 1} has rank ${players[i].rank}, expected ${expectedRank} (${players[i].name})`);
    rankConsistencyCorrect = false;
  }
}

if (rankConsistencyCorrect) {
  console.log('✅ RANK CONSISTENCY CORRECT - All ranks match their positions');
}

console.log('\n=== SPECIFIC PLAYERS CHECK ===');
const joeMonatana = players.find(p => p.name === 'Joe Montana');
const peytonManning = players.find(p => p.name === 'Peyton Manning');

if (joeMonatana) {
  console.log(`Joe Montana: Rank ${joeMonatana.rank}, Score ${joeMonatana.score}`);
} else {
  console.log('❌ Joe Montana not found!');
}

if (peytonManning) {
  console.log(`Peyton Manning: Rank ${peytonManning.rank}, Score ${peytonManning.score}`);
} else {
  console.log('❌ Peyton Manning not found!');
}

console.log('\n=== SUMMARY ===');
console.log('Players count:', players.length);
console.log('Rank range:', Math.min(...ranks), 'to', Math.max(...ranks));
console.log('Score range:', Math.max(...players.map(p => p.score)), 'to', Math.min(...players.map(p => p.score)));

// Final verdict
const allChecksPass = 
  ranks.length === uniqueRanks.length && 
  missingRanks.length === 0 && 
  extraRanks.length === 0 && 
  scoreOrderCorrect && 
  rankConsistencyCorrect;

console.log('\n=== FINAL VERDICT ===');
if (allChecksPass) {
  console.log('🎉 ALL CHECKS PASSED! Rankings are perfect.');
} else {
  console.log('⚠️  Some issues found - see details above.');
}