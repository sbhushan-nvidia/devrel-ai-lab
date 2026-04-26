# 🎤 Facilitator Script — DevRel AI Lab

## Pre-Session Checklist

- [ ] All pods running, Telegram bots responding
- [ ] GitHub token configured on all pods  
- [ ] Tested builder prompt on at least 3 pods (apps generate correctly)
- [ ] Reference app built and deployed (your demo version)
- [ ] Participant guide ready to share (link or paste in meeting chat)
- [ ] Fallback ZIP ready (pre-built app they can customize if bot fails)
- [ ] Screen share ready with: reference app, GitHub Pages URL, Storybook (if applicable)

---

## Slide Deck (3 slides)

### Slide 1: The Problem
**Title:** "How do you track event engagement today?"
- Spreadsheets? Notion? Email threads? Memory?
- Show a messy spreadsheet screenshot (relatable)
- "What if you could build your own tool in 30 minutes?"

### Slide 2: The Demo
**Title:** "This is what you're about to build"
- Live demo of your reference app (60 seconds)
- Click through: dashboard → events → event detail → add attendee
- "This was built entirely by talking to an AI. Zero code."

### Slide 3: Let's Go
**Title:** "Your turn. 3 steps."
1. Paste the prompt into your bot
2. Watch it build
3. Make it yours
- Share the participant guide link

---

## Minute-by-Minute Script

### Min 0:00 — Hook (you talk, slides up)
> "Quick show of hands — who tracks event engagement in a spreadsheet or Notion doc?"
> 
> [Wait for hands]
> 
> "Yeah, me too. It's fine until you need to actually see patterns — how many events this quarter, what's our average NPS, which events drive the most engagement."
> 
> "Today we're going to fix that. Each of you is going to build your own Event Engagement Tracker — a real web app, live on the internet, in about 25 minutes."
> 
> "No code. You're going to talk to an AI bot and tell it what to build."

### Min 1:30 — Demo (screen share your reference app)
> "Here's what mine looks like."
> 
> [Show dashboard — metrics, chart, recent events]
> [Click into an event — attendees, feedback]
> [Show it's responsive — resize window or show on phone]
> 
> "This entire app is one HTML file. It was built by me describing what I wanted to my bot. Now you're going to build yours."

### Min 3:00 — Setup (share participant guide)
> "I'm dropping the guide in the chat now. Open it up."
> 
> [Paste PARTICIPANT_GUIDE.md link or content into meeting chat]
> 
> "Step 1: open your Telegram bot. Step 2: copy the builder prompt from the guide. Step 3: fill in your name, pick a color, and paste it."
> 
> "Do that now. I'll give you 2 minutes."

### Min 5:00 — Building (everyone pastes prompt)
> "Everyone should have pasted their prompt by now. Your bot is working on it."
> 
> [Walk around or monitor chat for anyone stuck]
> 
> "It takes about 1-2 minutes to generate. While you wait — think about what you'd customize. The guide has a menu of ideas."

### Min 7:00 — First apps landing
> "Who has an app? Open the file and check it out."
> 
> [Help anyone whose app has issues]
> 
> "Now let's get it live. Tell your bot to push it to GitHub. The command is in the guide, Step 3."

### Min 10:00 — Apps going live
> "Check your URL: sbhushan-nvidia.github.io/devrel-ai-lab/yourname/"
> 
> [Celebrate first live apps — "Alice is live! Bob is live!"]
> 
> "Now the fun part. Look at the customization menu in the guide. Pick something and ask your bot for it."

### Min 10:00-25:00 — Free customize
> [Float around, help people, suggest customizations]
> 
> Prompts to suggest if someone is stuck:
> - "Try asking for a pie chart on the dashboard"
> - "Ask it to add a budget field to events"
> - "Ask for a dark/light mode toggle"
> 
> [Every 5 minutes, update the group]:
> - "Reminder: after each change, tell the bot to push again"
> - "Anyone tried adding the calendar view? It's cool"

### Min 25:00 — Show & Tell
> "Alright, let's see what you built! Who wants to share?"
> 
> [2-3 volunteers share their screen or URL]
> [Highlight differences — "Look, Alice added a pie chart, Bob has a calendar view"]
> 
> "Every app is different because each of you had a different conversation with your bot. That's the point."

### Min 28:00 — Wrap Up
> "In 30 minutes, you went from nothing to a live web app. No code. No frameworks. Just a conversation."
> 
> "The apps live at your URL. You can keep customizing anytime — just talk to your bot and push."
> 
> "Think about what else you could build this way. A personal CRM? A content calendar? A demo tracker? The pattern is the same: describe it, iterate, deploy."
> 
> "Questions?"

---

## Troubleshooting During the Session

| Problem | Quick Fix |
|---------|-----------|
| Bot not responding | Check pod is running; restart bot if needed |
| App has JS errors | Tell bot: "The app has errors, please fix and regenerate" |
| App looks broken | Tell bot: "Fix the styling, use dark theme #1A1A1A with green #76B900" |
| GitHub push fails | Check token; manual fallback: open HTML file locally |
| Someone falls behind | Give them the fallback pre-built app to customize |
| Bot generates wrong thing | Tell bot: "Ignore that. Start fresh with..." |
| "I don't know what to customize" | Point them to the customization menu in the guide |

## Fallback Plan

If everything goes wrong:
1. Share a pre-built reference app ZIP
2. Everyone opens it locally
3. They tell their bot: "I have this app, customize it to [their preferences]"
4. Still demonstrates AI-assisted iteration, just not generation from scratch
