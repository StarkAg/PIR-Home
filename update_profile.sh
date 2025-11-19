#!/bin/bash

# Script to automatically update GitHub profile with new projects
# Usage: ./update_profile.sh <repo_name> <project_title> <description> <category> <tech_stack>
# Example: ./update_profile.sh PIR_Home "PIR Motion Sensor" "Home automation with LED wave effect" "IoT & Hardware" "Arduino,C++"

set -e

REPO_NAME=$1
PROJECT_TITLE=$2
DESCRIPTION=$3
CATEGORY=$4
TECH_STACK=$5

if [ -z "$REPO_NAME" ] || [ -z "$PROJECT_TITLE" ] || [ -z "$DESCRIPTION" ] || [ -z "$CATEGORY" ]; then
    echo "❌ Error: Missing required parameters"
    echo ""
    echo "Usage: $0 <repo_name> <project_title> <description> <category> [tech_stack]"
    echo ""
    echo "Parameters:"
    echo "  repo_name     - GitHub repository name (e.g., PIR_Home)"
    echo "  project_title - Project title (e.g., 'PIR Motion Sensor with Stadium Wave LED Effect')"
    echo "  description   - Project description"
    echo "  category      - Category (e.g., 'IoT & Hardware', 'Full-Stack Applications', etc.)"
    echo "  tech_stack    - Comma-separated tech stack (optional, e.g., 'Arduino,C++')"
    echo ""
    echo "Example:"
    echo "  $0 PIR_Home 'PIR Motion Sensor' 'Home automation project' 'IoT & Hardware' 'Arduino,C++'"
    exit 1
fi

PROFILE_REPO_PATH="$HOME/Desktop/Files/Code PlayGround/StarkAg"
REPO_URL="https://github.com/StarkAg/${REPO_NAME}"

# Check if profile repo exists
if [ ! -d "$PROFILE_REPO_PATH" ]; then
    echo "📦 Cloning profile repository..."
    cd "$HOME/Desktop/Files/Code PlayGround"
    gh repo clone StarkAg/StarkAg
fi

cd "$PROFILE_REPO_PATH"

# Pull latest changes
echo "🔄 Pulling latest changes..."
git pull origin main

# Map category to section header
case "$CATEGORY" in
    "IoT & Hardware"|"IoT")
        SECTION_HEADER="### 📡 IoT & Hardware"
        ;;
    "Full-Stack"|"Full-Stack Applications")
        SECTION_HEADER="### 🏆 Full-Stack Applications"
        ;;
    "Machine Learning"|"ML"|"AI")
        SECTION_HEADER="### 🤖 Machine Learning & AI"
        ;;
    "Blockchain"|"Web3")
        SECTION_HEADER="### ⛓️ Blockchain & Web3"
        ;;
    "Web Development"|"Web")
        SECTION_HEADER="### 🎨 Web Development & UI/UX"
        ;;
    "Hackathon")
        SECTION_HEADER="### 🏅 Hackathon Projects"
        ;;
    *)
        SECTION_HEADER="### 📡 IoT & Hardware"  # Default
        ;;
esac

# Generate tech badges
TECH_BADGES=""
if [ ! -z "$TECH_STACK" ]; then
    IFS=',' read -ra TECH_ARRAY <<< "$TECH_STACK"
    for tech in "${TECH_ARRAY[@]}"; do
        tech=$(echo "$tech" | xargs)  # Trim whitespace
        case "$tech" in
            "Arduino")
                TECH_BADGES="${TECH_BADGES}![Arduino](https://img.shields.io/badge/Arduino-00979D?style=flat&logo=arduino&logoColor=white)\n"
                ;;
            "C++")
                TECH_BADGES="${TECH_BADGES}![C++](https://img.shields.io/badge/C++-00599C?style=flat&logo=c%2B%2B&logoColor=white)\n"
                ;;
            "Python")
                TECH_BADGES="${TECH_BADGES}![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)\n"
                ;;
            "JavaScript")
                TECH_BADGES="${TECH_BADGES}![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)\n"
                ;;
            "TypeScript")
                TECH_BADGES="${TECH_BADGES}![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=flat&logo=typescript&logoColor=white)\n"
                ;;
            "React")
                TECH_BADGES="${TECH_BADGES}![React](https://img.shields.io/badge/React-20232A?style=flat&logo=react&logoColor=61DAFB)\n"
                ;;
            "Next.js")
                TECH_BADGES="${TECH_BADGES}![Next.js](https://img.shields.io/badge/Next.js-000000?style=flat&logo=next.js&logoColor=white)\n"
                ;;
            "Node.js")
                TECH_BADGES="${TECH_BADGES}![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat&logo=node.js&logoColor=white)\n"
                ;;
            "Solidity")
                TECH_BADGES="${TECH_BADGES}![Solidity](https://img.shields.io/badge/Solidity-363636?style=flat&logo=solidity&logoColor=white)\n"
                ;;
            *)
                # Generic badge
                TECH_BADGES="${TECH_BADGES}![${tech}](https://img.shields.io/badge/${tech}-blue?style=flat)\n"
                ;;
        esac
    done
fi

# Create project entry
PROJECT_ENTRY="#### [${REPO_NAME}](${REPO_URL}) - ${PROJECT_TITLE}
${TECH_BADGES}
${DESCRIPTION}

**Key Features:** [Add key features here]

---
"

# Find the section in README
SECTION_LINE=$(grep -n "$SECTION_HEADER" README.md | cut -d: -f1)

if [ -z "$SECTION_LINE" ]; then
    echo "❌ Error: Section '$SECTION_HEADER' not found in README.md"
    exit 1
fi

# Find the next section (or end of file)
NEXT_SECTION_LINE=$(awk -v line="$SECTION_LINE" 'NR > line && /^### / {print NR; exit}' README.md)

if [ -z "$NEXT_SECTION_LINE" ]; then
    # No next section, insert before the last section (before Contribution Graph)
    INSERT_LINE=$(grep -n "## 📈 Contribution Graph" README.md | cut -d: -f1)
else
    # Insert before next section
    INSERT_LINE=$NEXT_SECTION_LINE
fi

# Insert the project entry
echo "📝 Adding project to README.md..."
awk -v line="$((INSERT_LINE-1))" -v entry="$PROJECT_ENTRY" 'NR==line {print; print entry; next} 1' README.md > README.md.tmp
mv README.md.tmp README.md

# Commit and push
echo "🚀 Committing changes..."
git add README.md
git commit -m "Add ${REPO_NAME} project to ${CATEGORY} section" || echo "⚠️  No changes to commit"
git push origin main

echo "✅ Profile updated successfully!"
echo "🔗 View your profile: https://github.com/StarkAg"

