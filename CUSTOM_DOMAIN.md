# Custom Domain Setup Guide

## Step 1: Buy a Domain (if you don't have one)

Recommended registrars:
- **Namecheap** (cheap + free privacy)
- **Cloudflare** (wholesale pricing)
- **Google Domains** (simple, clean)
- **GoDaddy** (well-known)

Domain ideas for this site:
- `claimrewardsnow.com`
- `getmygiftcard.com`
- `rewardclaim[year].com`
- `freegiftcardoffer.com`
- `rewards-hub.com`

---

## Step 2: Add Domain to GitHub

### Option A: Using GitHub Web Interface (Easy)

1. Go to your repo: https://github.com/Soggy760/rewards-landing
2. Click **Settings** tab
3. Scroll down to **Pages** section (left sidebar)
4. Under "Custom domain", enter your domain (e.g., `claimrewardsnow.com`)
5. Click **Save**
6. Check "Enforce HTTPS" (recommended)

### Option B: Using CNAME File (What we'll do)

Create a file called `CNAME` in your repo root with just your domain:

```
claimrewardsnow.com
```

Then push it to GitHub.

---

## Step 3: Configure DNS Records

Go to your domain registrar's DNS settings and add these records:

### For Root Domain (example.com):

| Type | Host/Name | Value/Points to | TTL |
|------|-----------|-----------------|-----|
| A | @ | 185.199.108.153 | Auto |
| A | @ | 185.199.109.153 | Auto |
| A | @ | 185.199.110.153 | Auto |
| A | @ | 185.199.111.153 | Auto |

### For WWW Subdomain (www.example.com):

| Type | Host/Name | Value/Points to | TTL |
|------|-----------|-----------------|-----|
| CNAME | www | soggy760.github.io | Auto |

Or if your DNS supports CNAME flattening/ALIAS:

| Type | Host/Name | Value/Points to | TTL |
|------|-----------|-----------------|-----|
| ALIAS | @ | soggy760.github.io | Auto |

---

## Step 4: Wait for SSL (HTTPS)

After DNS propagates (can take 5 minutes to 48 hours):

1. Go back to GitHub repo → Settings → Pages
2. Check the "Enforce HTTPS" checkbox
3. GitHub will automatically generate an SSL certificate

---

## Quick Setup Script

Once you have your domain, run this and I'll configure everything:

```bash
# Replace with your actual domain
DOMAIN="your-domain.com"

# Create CNAME file
echo "$DOMAIN" > CNAME

# Commit and push
git add CNAME
git commit -m "Add custom domain: $DOMAIN"
git push origin main

echo "✅ CNAME file pushed to GitHub"
echo ""
echo "Now add these DNS records at your registrar:"
echo ""
echo "A Records:"
echo "  185.199.108.153"
echo "  185.199.109.153"
echo "  185.199.110.153"
echo "  185.199.111.153"
echo ""
echo "CNAME Record:"
echo "  www → soggy760.github.io"
```

---

## Verify It's Working

1. Visit `https://your-domain.com`
2. Should show your site with a green lock (SSL)
3. Check GitHub repo → Settings → Pages for green checkmark

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Domain not found" | Wait longer for DNS (up to 48 hours) |
| "HTTPS not available" | Wait for GitHub to issue certificate (can take 24h) |
| Shows old GitHub URL | Clear browser cache / use incognito |
| DNS not propagating | Check with https://whatsmydns.net |

---

## Pro Tips

1. **Use Cloudflare** as your DNS for faster propagation + free CDN
2. **Always enforce HTTPS** - users trust secure sites more
3. **Redirect www to non-www** (or vice versa) for consistency
4. **Test the domain** at https://www.ssllabs.com/ssltest/
