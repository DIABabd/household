-- Update 1: quantity + purchase history ("Buy again" feature)
-- Run this in Supabase: Dashboard -> SQL Editor -> New query -> paste -> Run
-- (Only run this once. Your existing list is kept.)

-- Quantity for each item (defaults to 1 for everything already in the list)
alter table items add column amount int not null default 1;

-- Every time an item is marked as bought, it gets recorded here.
-- The site uses this to show your most frequently bought items.
create table purchases (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  bought_at timestamptz not null default now()
);

alter table purchases enable row level security;

create policy "anyone can read" on purchases for select using (true);
create policy "anyone can insert" on purchases for insert with check (true);
create policy "anyone can delete" on purchases for delete using (true);
