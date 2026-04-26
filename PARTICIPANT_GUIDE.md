# 🚀 DevRel AI Lab — Participant Guide

## What We're Doing

You're going to build your own **Event Engagement Tracker** web app — a real, live web app with a URL you can share — by talking to an AI bot. No coding required.

By the end of this 30-minute session, you'll have:
- A personal dashboard tracking your events, attendees, and feedback
- A live URL anyone can visit
- The knowledge to build more apps the same way

---

## Before the Session (5 min setup)

### Step 1: Open your Telegram bot
Your bot has already been set up for you. Open Telegram and find **your assigned bot** (Shashi will share the bot name).

### Step 2: Say hello
Send your bot a message:
```
Hello! Are you there?
```
It should reply. If it doesn't, let Shashi know.

### Step 3: You're ready!
That's it. No accounts to create, no software to install.

---

## During the Session

### 🏗️ Step 1: Build Your App (copy-paste this into your bot)

Copy the prompt below, **replace the 3 fields in [BRACKETS]**, and paste it to your bot:

```
Build me a single-file web app called "[YOUR NAME]'s Event Tracker".

Requirements:
- One HTML file, all CSS and JS inline, no external dependencies
- NVIDIA dark theme: background #1A1A1A, primary green #76B900, accent [YOUR COLOR e.g. #00AEEF]
- Responsive, clean, professional design

Pages (use hash routing):

1. DASHBOARD (#dashboard) — default page
   - 4 metric cards: Total Events, Total Attendees, Avg Rating, Upcoming Count
   - Bar chart of events per month (use <canvas>)
   - List of 5 most recent events

2. EVENTS (#events)
   - Searchable, filterable list of all events
   - Each event: name, type, date, location, attendee count, status badge
   - Add/edit event form (name, type, date, location, description)
   - Types: conference, workshop, meetup, webinar, office hours

3. EVENT DETAIL (#event/:id)
   - Event info header with status
   - Attendee table (name, email, company, RSVP, checked-in toggle)
   - Add attendee form
   - Feedback section: avg rating display + add feedback (1-5 stars, comment)

4. SETTINGS (#settings)
   - Display name: [YOUR NAME]
   - Team: [YOUR TEAM e.g. "Developer Relations"]
   - Export/import data as JSON
   - Clear all data (with confirmation)

Data: localStorage. Make it look polished — I'll actually use this.

Save the file as index.html in my workspace.
```

**Fill in:**
- `[YOUR NAME]` — your first name
- `[YOUR COLOR]` — pick an accent color (blue `#00AEEF`, orange `#FF6F00`, purple `#9B59B6`, red `#E74C3C`, teal `#1ABC9C`)
- `[YOUR TEAM]` — your team name

### ⏳ Step 2: Wait for it (~1-2 minutes)
Your bot will generate the app. You'll see it working. When it's done, it will tell you.

### 🌐 Step 3: Deploy It
Once the app is built, tell your bot:
```
Push my app to GitHub. Deploy it to: apps/[yourname]/index.html in the repo sbhushan-nvidia/devrel-ai-lab on the main branch. Use the GitHub token that's already configured.
```

Your app will be live at: `https://sbhushan-nvidia.github.io/devrel-ai-lab/yourname/`

### 🎨 Step 4: Customize! (the fun part)
Talk to your bot to change anything. Just describe what you want:

---

## 💡 Customization Ideas (pick any!)

**Easy (one message each):**
- "Add a notes field to events"
- "Change event types to: conference, hackathon, demo day, webinar, meetup"
- "Add a budget field to events"
- "Make the status badges more colorful"
- "Add a countdown timer to the next upcoming event on the dashboard"

**Medium:**
- "Add a pie chart showing events by type on the dashboard"
- "Add CSV export for the attendee list"
- "Add a search bar that searches across all events and attendees"
- "Add a dark/light mode toggle"
- "Show a monthly calendar view of events"

**Advanced:**
- "Add an email draft button that opens mailto: with all attendee emails"
- "Add tags to events and let me filter by tag"
- "Add a 'duplicate event' button that copies an event as a template"
- "Add a timeline view showing events on a horizontal timeline"
- "Add print-friendly styling for the event detail page"

After each change, tell the bot to push the updated file to GitHub.

---

## 🆘 If Something Goes Wrong

**Bot generated broken code?**
```
The app has an error. Please fix it and make sure it loads correctly.
```

**App looks weird?**
```
The styling is off. Make sure it uses dark background #1A1A1A, green #76B900 headers, and clean modern styling. Fix the layout.
```

**Want to start over?**
```
Start fresh. Rebuild the entire app from scratch using the same requirements but make sure everything works.
```

**Bot is confused?**
```
Ignore the previous errors. Here's what I need: a single HTML file with [describe what you want]. Generate the complete file from scratch.
```

---

## After the Session

Your app lives at `https://sbhushan-nvidia.github.io/devrel-ai-lab/yourname/`

Want to keep building? Just talk to your bot anytime and push updates.

**Ideas for what else you could build:**
- A personal CRM for your developer contacts
- A talk proposal tracker
- A content calendar
- A demo inventory / asset manager
- A trip planner for event travel
