# Household Shopping List

A tiny shared shopping list for me and my brother. Add items, tap to mark as bought, changes sync live between phones.

Features: items grouped by store aisle (auto-categorized, tap the emoji to change), quantities (− removes at 0), tap an item to put it "in the cart", suggestion chips from purchase history above the add bar, shopping progress bar, "added 2h ago" timestamps, dark mode, live sync between phones.

Database updates live in numbered `supabase-update-*.sql` files — run the latest one once in the Supabase SQL Editor (latest: `supabase-update-2.sql`, which also covers update 1).

## Setup (one time)

### 1. Supabase
1. Go to [supabase.com](https://supabase.com), create a free project.
2. Open **SQL Editor**, paste the contents of `supabase-setup.sql`, and click **Run**.
3. Go to **Project Settings → API** and copy:
   - the **Project URL**
   - the **anon / public key**

### 2. Connect the site
Open `index.html` and replace these two lines near the bottom with your values:

```js
const SUPABASE_URL = "YOUR_SUPABASE_URL";
const SUPABASE_ANON_KEY = "YOUR_SUPABASE_ANON_KEY";
```

### 3. Deploy to Vercel
Easiest way — no git needed:
1. Go to [vercel.com](https://vercel.com) and log in.
2. Drag and drop this folder onto the dashboard (or run `npx vercel` in this folder).
3. Done. Share the URL with your brother.

## Note
Anyone who has the link can edit the list (that's the point — it's just for the two of us). Don't post the URL publicly.
