#!/bin/bash
# ============================================================
# DevRel AI Lab — Pre-Work Verification Script
# Run on your pod: curl -fsSL https://sbhushan-nvidia.github.io/devrel-ai-lab/verify.sh | bash
# ============================================================

set -uo pipefail

PASS="✅"
FAIL="❌"
WARN="⚠️"
CHECKS=0
PASSED=0
FAILED=0

check() {
  CHECKS=$((CHECKS + 1))
  local label="$1"
  shift
  if "$@" > /dev/null 2>&1; then
    echo "  $PASS $label"
    PASSED=$((PASSED + 1))
    return 0
  else
    echo "  $FAIL $label"
    FAILED=$((FAILED + 1))
    return 1
  fi
}

echo ""
echo "🔍 DevRel AI Lab — Pre-Work Verification"
echo "=========================================="
echo ""

# --- 1. OpenClaw ---
echo "1. OpenClaw"
check "openclaw is installed" which openclaw
check "gateway is running" openclaw gateway status

echo ""

# --- 2. Telegram ---
echo "2. Telegram"
# Check if telegram is configured by looking for it in openclaw config or status
if openclaw status 2>&1 | grep -qi "telegram"; then
  echo "  $PASS Telegram configured"
  CHECKS=$((CHECKS + 1)); PASSED=$((PASSED + 1))
else
  echo "  $WARN Telegram — could not detect (check manually: send 'hello' to your bot)"
  CHECKS=$((CHECKS + 1))
fi

echo ""

# --- 3. GitHub CLI ---
echo "3. GitHub"
check "gh CLI installed" which gh

if gh auth status > /dev/null 2>&1; then
  echo "  $PASS gh authenticated"
  CHECKS=$((CHECKS + 1)); PASSED=$((PASSED + 1))
  
  GH_USER=$(gh api user --jq '.login' 2>/dev/null)
  if [ -n "$GH_USER" ]; then
    echo "  $PASS Logged in as: $GH_USER"
    CHECKS=$((CHECKS + 1)); PASSED=$((PASSED + 1))
  else
    echo "  $FAIL Could not determine GitHub username"
    CHECKS=$((CHECKS + 1)); FAILED=$((FAILED + 1))
  fi
else
  echo "  $FAIL gh not authenticated — run: gh auth login"
  CHECKS=$((CHECKS + 1)); FAILED=$((FAILED + 1))
fi

echo ""

# --- 4. Git identity ---
echo "4. Git Config"
GIT_NAME=$(git config --global user.name 2>/dev/null)
GIT_EMAIL=$(git config --global user.email 2>/dev/null)

if [ -n "$GIT_NAME" ]; then
  echo "  $PASS git user.name: $GIT_NAME"
  CHECKS=$((CHECKS + 1)); PASSED=$((PASSED + 1))
else
  echo "  $FAIL git user.name not set — run: git config --global user.name \"Your Name\""
  CHECKS=$((CHECKS + 1)); FAILED=$((FAILED + 1))
fi

if [ -n "$GIT_EMAIL" ]; then
  echo "  $PASS git user.email: $GIT_EMAIL"
  CHECKS=$((CHECKS + 1)); PASSED=$((PASSED + 1))
else
  echo "  $FAIL git user.email not set — run: git config --global user.email \"you@nvidia.com\""
  CHECKS=$((CHECKS + 1)); FAILED=$((FAILED + 1))
fi

echo ""

# --- 5. GitHub repo + permissions ---
echo "5. GitHub Repo & Permissions"

if [ -n "$GH_USER" ]; then
  # Check if they can create repos (tests admin permission)
  REPOS=$(gh repo list --limit 5 --json name --jq '.[].name' 2>/dev/null)
  if [ $? -eq 0 ]; then
    echo "  $PASS Can list repositories"
    CHECKS=$((CHECKS + 1)); PASSED=$((PASSED + 1))
    
    if echo "$REPOS" | grep -q .; then
      echo "  $PASS Repos found:"
      echo "$REPOS" | head -5 | while read -r repo; do
        echo "        - $repo"
      done
    else
      echo "  $WARN No repos found — create one at github.com/new"
    fi
  else
    echo "  $FAIL Cannot list repos — check token permissions"
    CHECKS=$((CHECKS + 1)); FAILED=$((FAILED + 1))
  fi
  
  # Test push capability by checking token scopes
  CAN_PUSH=$(gh api repos/$GH_USER/$(echo "$REPOS" | head -1) --jq '.permissions.push' 2>/dev/null)
  if [ "$CAN_PUSH" = "true" ]; then
    echo "  $PASS Push access confirmed"
    CHECKS=$((CHECKS + 1)); PASSED=$((PASSED + 1))
  elif [ -z "$REPOS" ]; then
    echo "  $WARN Cannot verify push — no repos to test against"
    CHECKS=$((CHECKS + 1))
  else
    echo "  $FAIL No push access — check token permissions (Contents: read+write)"
    CHECKS=$((CHECKS + 1)); FAILED=$((FAILED + 1))
  fi
else
  echo "  $FAIL Skipped — GitHub not authenticated"
  CHECKS=$((CHECKS + 2)); FAILED=$((FAILED + 2))
fi

echo ""

# --- Summary ---
echo "=========================================="
if [ $FAILED -eq 0 ]; then
  echo "🎉 All checks passed! ($PASSED/$CHECKS)"
  echo ""
  echo "You're ready for the lab! 🚀"
else
  echo "⚠️  $PASSED/$CHECKS passed, $FAILED failed"
  echo ""
  echo "Fix the failed items above and re-run this script."
  echo "Need help? Reach out to Shashi."
fi
echo ""
