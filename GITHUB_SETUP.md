# GitHub Repository Setup Guide

## Quick Setup

### 1. Create GitHub Repository

1. Go to [GitHub](https://github.com) and sign in
2. Click the "+" icon in the top right → "New repository"
3. Repository name: `pir-motion-sensor` (or your preferred name)
4. Description: `🏠 PIR Motion Sensor with Stadium Wave LED Effect - Arduino project for home automation with sequential LED lighting`
5. Set to **Public** (or Private if you prefer)
6. **DO NOT** initialize with README, .gitignore, or license (we already have these)
7. Click "Create repository"

### 2. Connect Local Repository to GitHub

```bash
cd /Users/mrstark/Desktop/Files/Code\ PlayGround/PIR

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/pir-motion-sensor.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### 3. Repository About Section

Add this to your GitHub repository's "About" section (click the gear icon next to "About"):

**Description:**
```
🏠 PIR Motion Sensor with Stadium Wave LED Effect - Arduino project for home automation with sequential LED lighting
```

**Topics (add these tags):**
```
arduino
arduino-uno
pir-sensor
motion-sensor
led
home-automation
iot
electronics
embedded-systems
hc-sr501
stadium-wave
```

**Website (optional):**
```
Leave blank or add your portfolio/demo site
```

### 4. Add Repository Badges (Optional)

The README already includes badges, but you can add more in the repository settings:
- Go to Settings → General → Social preview
- Upload a custom image (1280x640px recommended)

### 5. Enable GitHub Actions

The repository includes a GitHub Actions workflow for Arduino linting. It will automatically:
- Compile your Arduino sketch on every push
- Check for compilation errors
- Run on pull requests

To enable:
1. Go to Settings → Actions → General
2. Ensure "Allow all actions and reusable workflows" is selected
3. The workflow will run automatically on the next push

## Repository Features

### 📋 What's Included

- ✅ Comprehensive README with visuals
- ✅ Arduino sketch with state machine
- ✅ Upload and monitor scripts
- ✅ GitHub Actions workflow
- ✅ MIT License
- ✅ Proper .gitignore

### 🎯 Repository Settings Recommendations

1. **General Settings:**
   - Enable Issues
   - Enable Discussions (optional)
   - Enable Wikis (optional)
   - Set default branch to `main`

2. **Features:**
   - ✅ Issues
   - ✅ Projects (optional)
   - ✅ Wiki (optional)
   - ✅ Discussions (optional)

3. **Pages (optional):**
   - If you want to host documentation, enable GitHub Pages

## Next Steps

After pushing to GitHub:

1. **Add a screenshot/demo video:**
   - Take a photo of your setup
   - Record a short video of the wave effect
   - Add to README or repository

2. **Create releases:**
   ```bash
   git tag -a v1.0.0 -m "Initial release"
   git push origin v1.0.0
   ```

3. **Add contributors:**
   - If others contribute, they'll appear automatically

4. **Star your own repo:**
   - Helps with discoverability

## Troubleshooting

### Push Rejected
If push is rejected:
```bash
git pull origin main --rebase
git push -u origin main
```

### Wrong Remote URL
If you need to change the remote:
```bash
git remote set-url origin https://github.com/YOUR_USERNAME/pir-motion-sensor.git
```

### Add GitHub CLI (Alternative)
If you have GitHub CLI installed:
```bash
gh repo create pir-motion-sensor --public --source=. --remote=origin --push
```

## Repository Description for GitHub

Use this in the repository description field:

```
🏠 Arduino project that detects motion using a PIR sensor and creates a stadium wave effect with LEDs. Perfect for home automation, security, or visual displays. Includes Arduino CLI support and comprehensive documentation.
```

