-- Paige — breaks and "did not finish"
-- Adds two columns. Nothing existing is changed or removed.
-- Safe to run more than once.

-- true when a book was put down for good
alter table public.books add column if not exists dnf boolean not null default false;

-- the stretches a book was set aside, e.g. [{"from":"2026-03-20","to":"2026-09-09"}]
alter table public.books add column if not exists breaks jsonb not null default '[]'::jsonb;
