-- Paige — database setup
-- Paste this whole file into Supabase → SQL Editor → New query → Run.
-- Safe to run more than once.

-- One row per book. user_id records who it belongs to.
create table if not exists public.books (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null default auth.uid() references auth.users(id) on delete cascade,
  title       text        not null default '',
  author      text        not null default '',
  cover       text        not null default '',
  format      text        not null default 'physical'
                check (format in ('physical','ebook','audio')),
  started_on  date,
  finished_on date,
  rating      numeric(2,1) not null default 0
                check (rating >= 0 and rating <= 5 and rating * 2 = round(rating * 2)),
  notes       text        not null default '',
  created_at  timestamptz not null default now()
);

-- Row Level Security: without this, any visitor could read every row.
-- With it, the database itself refuses to return rows that aren't yours.
alter table public.books enable row level security;

drop policy if exists "read own books"   on public.books;
drop policy if exists "add own books"    on public.books;
drop policy if exists "edit own books"   on public.books;
drop policy if exists "delete own books" on public.books;

create policy "read own books"   on public.books for select
  using (auth.uid() = user_id);
create policy "add own books"    on public.books for insert
  with check (auth.uid() = user_id);
create policy "edit own books"   on public.books for update
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete own books" on public.books for delete
  using (auth.uid() = user_id);

create index if not exists books_user_started_idx
  on public.books (user_id, started_on desc);
