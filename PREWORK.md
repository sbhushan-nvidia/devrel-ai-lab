# 🔧 Pre-Work Guide — DevRel AI Lab

Complete these steps **before** the lab session. Budget ~30 minutes. Use the checklist at the bottom to track your progress.

---

## Step 1: DGX Horde Pod 🖥️

Your bot needs a compute environment to run. We'll use a DGX Horde pod.

### 1.1 Request a pod
1. Go to the DGX Horde portal: `[URL — Shashi to fill]`
2. Request a new pod with:
   - **Image:** `[Image name — Shashi to fill]`
   - **GPU:** None needed (CPU-only is fine for this lab)
   - **Storage:** Default is fine
3. Wait for the pod to be `Running`

### 1.2 SSH into your pod
```bash
ssh [your-pod-hostname]
```
Confirm you have a terminal prompt.

### 1.3 Install OpenClaw
```bash
curl -fsSL https://get.openclaw.ai | bash
```
Follow the on-screen instructions. When asked for a model/API key, use:
- **Provider:** `[Provider — Shashi to fill]`
- **API Key:** `[Shared key or instructions — Shashi to fill]`

### 1.4 Start the gateway
```bash
openclaw gateway start
```
Confirm it says "ready" with no errors.

✅ **Checkpoint:** `openclaw status` shows the gateway running.

---

## Step 2: Telegram Bot 🤖

You'll talk to your bot via Telegram on your phone or desktop.

### 2.1 Create a Telegram account
If you don't have Telegram, install it from [telegram.org](https://telegram.org) and create an account.

### 2.2 Create your bot via BotFather
1. Open Telegram and search for **@BotFather**
2. Send: `/newbot`
3. BotFather will ask for a name — use something like: `YourName DevRel Lab Bot`
4. BotFather will ask for a username — use something like: `yourname_devrel_lab_bot` (must end in `bot`)
5. BotFather will give you a **bot token** — it looks like: `7123456789:AAH...` — **copy this, you'll need it**

### 2.3 Connect Telegram to OpenClaw
SSH into your pod and run:
```bash
openclaw configure --section telegram
```
When prompted:
- **Bot token:** paste the token from BotFather
- Follow any remaining prompts

### 2.4 Restart the gateway
```bash
openclaw gateway restart
```

### 2.5 Test your bot
1. In Telegram, search for your bot by its username
2. Press **Start** or send `/start`
3. Send: `Hello! Are you there?`
4. Your bot should reply

✅ **Checkpoint:** Your bot responds to messages in Telegram.

---

## Step 3: GitHub Setup 🐙

Your app will be hosted on GitHub Pages under **your own** GitHub account.

### 3.1 Create a GitHub account (if you don't have one)
Go to [github.com](https://github.com) and sign up. A free account is fine.

### 3.2 Create a personal access token
1. Go to: [github.com/settings/tokens?type=beta](https://github.com/settings/tokens?type=beta) (Fine-grained tokens)
2. Click **Generate new token**
3. Settings:
   - **Token name:** `devrel-lab`
   - **Expiration:** 30 days (or your preference)
   - **Repository access:** "All repositories"
   - **Permissions → Repository permissions:**
     - **Contents:** Read and write
     - **Pages:** Read and write
     - **Administration:** Read and write
4. Click **Generate token** and **copy the token** (you won't see it again)

### 3.3 Create a repo for your app
1. Go to [github.com/new](https://github.com/new)
2. Settings:
   - **Name:** `my-event-tracker` (or whatever you like)
   - **Public** (required for free GitHub Pages)
   - ✅ Check "Add a README file"
3. Click **Create repository**

### 3.4 Enable GitHub Pages
1. Go to your new repo → **Settings** → **Pages**
2. Under **Build and deployment → Source**, select **GitHub Actions**
3. That's it — we'll push a workflow file during the lab

### 3.5 Configure GitHub on your pod
SSH into your pod and run:
```bash
gh auth login
```
When prompted:
- **Where do you use GitHub?** → GitHub.com
- **Protocol?** → HTTPS
- **Authenticate?** → Paste a token → paste your token from step 3.2

Verify:
```bash
gh auth status
```
Should show your GitHub username.

### 3.6 Configure git identity
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@nvidia.com"
```

✅ **Checkpoint:** `gh repo list` shows your repos, including `my-event-tracker`.

---

## Step 4: Verify Everything ✅

Run the verification command on your pod:

```bash
curl -fsSL https://sbhushan-nvidia.github.io/devrel-ai-lab/verify.sh | bash
```

This will check:
- ✅ OpenClaw gateway running
- ✅ Telegram bot responding
- ✅ GitHub CLI authenticated
- ✅ Git identity configured
- ✅ Can push to your repo

**All green? You're ready for the lab! 🎉**

If anything fails, see the troubleshooting section below or reach out to Shashi.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| OpenClaw won't start | Check: `openclaw gateway status`. Try: `openclaw gateway restart` |
| Telegram bot doesn't respond | Verify token: `openclaw configure --section telegram`. Restart: `openclaw gateway restart` |
| `gh auth` fails | Make sure your token has the right permissions (Contents, Pages, Admin — all Read+Write) |
| GitHub Pages not working | Make sure repo is **public** and Pages source is set to **GitHub Actions** |
| Pod SSH fails | Check pod status in DGX Horde portal. Try restarting the pod. |

---

## ✏️ Pre-Work Checklist

Copy this checklist and track your progress:

```
[ ] Pod running and SSH works
[ ] OpenClaw installed and gateway started
[ ] Telegram bot created via BotFather
[ ] Telegram connected to OpenClaw
[ ] Bot responds to "Hello" in Telegram
[ ] GitHub account exists
[ ] Personal access token created (Contents + Pages + Admin)
[ ] Repo created (public, with README)
[ ] GitHub Pages enabled (source: GitHub Actions)
[ ] gh CLI authenticated on pod
[ ] git identity configured
[ ] Verification script passes
```
