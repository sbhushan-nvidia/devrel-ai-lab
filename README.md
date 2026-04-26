# DevRel AI Lab

Build your own **Event Engagement Tracker** web app — no coding required.

Each team member talks to an AI bot (OpenClaw + Telegram) and gets a personalized, live web app hosted right here on GitHub Pages.

## 🌐 Live Apps

**[View all apps →](https://sbhushan-nvidia.github.io/devrel-ai-lab/)**

## 📁 Structure

```
apps/
├── index.html          # App directory (landing page)
├── shashi/             # Shashi's app
│   └── index.html
├── alice/              # Alice's app
│   └── index.html
└── ...                 # One folder per participant
```

## 🛠 How It Works

1. You get access to an AI bot (OpenClaw + Telegram)
2. You paste a builder prompt and tell it what you want
3. The bot generates a single-file web app
4. The app gets pushed here and deployed via GitHub Pages
5. You get a live URL: `https://sbhushan-nvidia.github.io/devrel-ai-lab/yourname/`

## 🚀 Deployment

Apps deploy automatically via GitHub Actions on every push to `main`.
