# Scripts Directory

This directory contains various scripts used for data analysis, ranking verification, and formula calculations for the GOAT Sports website.

## Ranking Verification Scripts (JavaScript)

### `verify_rankings.js`
- **Purpose**: Verifies the main top 50 rankings for consistency
- **Checks**: 
  - Duplicate rank detection
  - Score order validation (descending)
  - Rank consistency (position matches rank)
  - Specific player verification (Joe Montana, Peyton Manning)
- **Usage**: `node scripts/verify_rankings.js`

### `verify_sport_rankings.js`
- **Purpose**: Verifies individual sport top 10 rankings for score-based ordering
- **Checks**: 
  - All 11 individual sport databases
  - Score order validation for each sport
  - Identifies misplaced players
- **Usage**: `node scripts/verify_sport_rankings.js`

### `analyze_rankings.js`
- **Purpose**: Analyzes and identifies ranking inconsistencies
- **Features**: 
  - Detailed analysis of ranking problems
  - Player position analysis
  - Score distribution analysis
- **Usage**: `node scripts/analyze_rankings.js`

### `generate_corrected_rankings.js`
- **Purpose**: Generates corrected ranking orders based on scores
- **Features**: 
  - Creates properly ordered player lists
  - Outputs corrected ranking data
  - Used for fixing ranking inconsistencies
- **Usage**: `node scripts/generate_corrected_rankings.js`

## PowerShell Scripts (.ps1)

### Sport-Specific Formula Scripts
- `basketball_formulas.ps1` - Basketball player rating calculations
- `soccer_formulas.ps1` - Soccer/Football player rating calculations
- `nfl_formulas.ps1` - NFL player rating calculations
- `f1_corrections.ps1` - Formula 1 driver rating corrections

### Correction and Adjustment Scripts
- `basketball_corrections.ps1` - Basketball rating adjustments
- `nfl_qb_corrections.ps1` - NFL quarterback specific corrections
- `adjusted_soccer_formulas.ps1` - Adjusted soccer formulas
- `soccer_forwards_adjusted.ps1` - Soccer forward position adjustments

### Utility and Testing Scripts
- `score_calculator.ps1` - General score calculation utility
- `refined_calculator.ps1` - Refined calculation methods
- `basic_check.ps1` - Basic data validation
- `manual_check.ps1` - Manual verification helper
- `test_f1_formula.ps1` - Formula 1 formula testing
- `test_hidden.ps1` - Hidden data testing

### Batch Processing Scripts
- `soccer_batch.ps1` - Batch processing for soccer data
- `corrections_preview.ps1` - Preview corrections before applying
- `remaining_f1.ps1` - Process remaining F1 data

### Data Extraction Scripts
- `extract_hidden.ps1` - Extract hidden player data
- `check_all_hidden.ps1` - Check all hidden data entries

## Usage Notes

- JavaScript scripts require Node.js to run
- PowerShell scripts require PowerShell to execute
- Run verification scripts after making changes to player data
- Use correction scripts to fix identified issues
- Batch scripts are for processing large datasets

## File Organization

This directory consolidates all ranking and calculation scripts that were previously in the root directory, providing better project organization and easier maintenance.
</content>
</invoke>