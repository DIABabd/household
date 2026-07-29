-- Run this once in Supabase: Dashboard -> SQL Editor -> New query -> paste -> Run

create table items (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  done boolean not null default false,
  created_at timestamptz not null default now()
);

-- Allow anyone with the site link to read/write the list
alter table items enable row level security;

create policy "anyone can read" on items for select using (true);
create policy "anyone can insert" on items for insert with check (true);
create policy "anyone can update" on items for update using (true);
create policy "anyone can delete" on items for delete using (true);

-- Enable live sync so changes show up instantly on the other person's phone
alter publication supabase_realtime add table items;
