# Rewards Landing Page

A modern, responsive landing page with a 4-step reward claim flow.

## Features

- ✨ Beautiful gradient design with smooth animations
- 📱 Fully responsive (mobile-friendly)
- 🎯 4-step interactive process:
  1. **Start** - Welcome screen with CTA button
  2. **Info** - Email and basic info collection
  3. **Deals** - Select recommended deals to complete
  4. **Claim** - Final reward screen with "Access Rewards" button
- 🔒 Security badges for trust
- ✅ Progress indicator showing current step

## Live Demo

Once deployed, your site will be available at:
`https://[your-username].github.io/[repo-name]/`

## Setup Instructions

### Option 1: Using the Deploy Script

```bash
# Navigate to the project folder
cd github-pages-rewards-site

# Make the script executable
chmod +x deploy.sh

# Run the deploy script (replace with your GitHub username and desired repo name)
./deploy.sh yourusername rewards-landing
```

Then enable GitHub Pages in your repository settings.

### Option 2: Manual Setup

1. Create a new repository on GitHub
2. Clone it locally:
   ```bash
   git clone https://github.com/yourusername/rewards-landing.git
   cd rewards-landing
   ```
3. Copy the `index.html` file into the repo
4. Commit and push:
   ```bash
   git add index.html
   git commit -m "Initial commit"
   git push origin main
   ```
5. Go to **Settings > Pages** in your GitHub repo
6. Enable GitHub Pages (source: main branch, root folder)
7. Your site will be live at `https://yourusername.github.io/rewards-landing/`

## Customization

### Change the Reward Value
Edit the HTML and find this line:
```html
<div class="reward-value">$50</div>
```
Change `$50` to your desired reward.

### Change Deals
Find the `.deals-grid` section in the HTML and modify the deal cards.

### Change Colors
The gradient colors are defined in the CSS:
```css
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
```

## File Structure

```
github-pages-rewards-site/
├── index.html      # Main landing page (single file, all CSS and JS inline)
├── deploy.sh       # Automated deployment script
└── README.md       # This file
```

## Notes

- The site is a static single-page application
- Form data is logged to console (you'll need to add your own backend integration)
- The "Access Rewards" button shows an alert - customize the `claimReward()` function for your needs
