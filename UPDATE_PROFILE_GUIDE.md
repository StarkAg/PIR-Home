# 📋 Guide: Updating GitHub Profile with New Projects

## 🎯 Automatic Update Script

I've created a script that automatically adds new projects to your GitHub profile. Here's how to use it:

### Basic Usage

```bash
cd /Users/mrstark/Desktop/Files/Code\ PlayGround/PIR
./update_profile.sh <repo_name> <project_title> <description> <category> <tech_stack>
```

### Parameters

- **repo_name**: GitHub repository name (e.g., `PIR_Home`)
- **project_title**: Project title (e.g., `PIR Motion Sensor with Stadium Wave LED Effect`)
- **description**: Project description (one line)
- **category**: Category section (e.g., `IoT & Hardware`, `Full-Stack Applications`, etc.)
- **tech_stack**: Comma-separated tech stack (optional, e.g., `Arduino,C++`)

### Example

```bash
./update_profile.sh PIR_Home "PIR Motion Sensor with Stadium Wave LED Effect" "Home automation project that detects motion using a PIR sensor and creates a mesmerizing stadium wave effect with LEDs" "IoT & Hardware" "Arduino,C++"
```

### Available Categories

- `IoT & Hardware` or `IoT`
- `Full-Stack Applications` or `Full-Stack`
- `Machine Learning & AI` or `ML` or `AI`
- `Blockchain & Web3` or `Blockchain` or `Web3`
- `Web Development & UI/UX` or `Web Development` or `Web`
- `Hackathon Projects` or `Hackathon`

### Supported Tech Stack Badges

The script automatically generates badges for:
- Arduino
- C++
- Python
- JavaScript
- TypeScript
- React
- Next.js
- Node.js
- Solidity
- And more...

## 📝 Manual Update (Alternative)

If you prefer to update manually:

1. **Navigate to profile repo:**
   ```bash
   cd ~/Desktop/Files/Code\ PlayGround/StarkAg
   ```

2. **Pull latest changes:**
   ```bash
   git pull origin main
   ```

3. **Edit README.md:**
   - Find the appropriate section (e.g., `### 📡 IoT & Hardware`)
   - Add your project entry following the format:
     ```markdown
     #### [RepoName](https://github.com/StarkAg/RepoName) - Project Title
     ![Tech](badge-url)
     
     Project description here.
     
     **Key Features:** Feature 1, feature 2, feature 3
     
     ---
     ```

4. **Commit and push:**
   ```bash
   git add README.md
   git commit -m "Add RepoName project to Category section"
   git push origin main
   ```

## 🎨 Project Entry Format

Here's the standard format for project entries:

```markdown
#### [Repository Name](https://github.com/StarkAg/repo-name) - Project Title
![Tech Badge](badge-url)
![Another Tech](badge-url)

Project description. One or two sentences describing what the project does.

**Key Features:** Feature 1, feature 2, feature 3, feature 4

---
```

## 🚀 Quick Reference

### For PIR_Home (Already Added)

The PIR_Home project has already been added to your profile in the **IoT & Hardware** section.

### For Future Projects

1. **Create your project repository on GitHub**
2. **Run the update script:**
   ```bash
   ./update_profile.sh <repo_name> "<title>" "<description>" "<category>" "<tech_stack>"
   ```
3. **Verify on your profile:** https://github.com/StarkAg

## 📌 Notes

- The script automatically pulls the latest changes from your profile repo
- It finds the correct section and inserts the project entry
- It commits and pushes the changes automatically
- Make sure you have GitHub CLI (`gh`) authenticated
- The profile repo is located at: `~/Desktop/Files/Code PlayGround/StarkAg`

## 🔧 Troubleshooting

### Script not found
```bash
chmod +x update_profile.sh
```

### Profile repo not found
The script will automatically clone it if it doesn't exist locally.

### Git authentication issues
```bash
gh auth login
```

### Section not found
Make sure the category name matches one of the available categories.

---

**That's it! Your profile will be automatically updated whenever you add a new project.** 🎉

