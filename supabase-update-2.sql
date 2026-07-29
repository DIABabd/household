-- Update 2: quantities, categories and purchase history
-- Run this once in Supabase: Dashboard -> SQL Editor -> New query -> paste -> Run
-- Safe to run even if you already ran update 1. Your existing list is kept.

alter table items add column if not exists amount int not null default 1;
alter table items add column if not exists category text not null default 'other';

create table if not exists purchases (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  bought_at timestamptz not null default now()
);

alter table purchases add column if not exists category text not null default 'other';

alter table purchases enable row level security;

drop policy if exists "anyone can read" on purchases;
create policy "anyone can read" on purchases for select using (true);

drop policy if exists "anyone can insert" on purchases;
create policy "anyone can insert" on purchases for insert with check (true);

drop policy if exists "anyone can delete" on purchases;
create policy "anyone can delete" on purchases for delete using (true);
