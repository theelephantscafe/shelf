-- Paige — allow half-star ratings (3.5, 4.5, ...)
-- Paste into Supabase → SQL Editor → New query → Run.
--
-- Changes the rating column from whole numbers to one decimal place.
-- Existing ratings are kept exactly as they are (a 4 stays 4).
-- Safe to run more than once.

-- Remove the old rule ("a whole number from 0 to 5")...
alter table public.books drop constraint if exists books_rating_check;

-- ...let the column hold one decimal place...
alter table public.books
  alter column rating type numeric(2,1) using rating::numeric(2,1);

-- ...and add the new rule: 0 to 5, in steps of 0.5.
alter table public.books
  add constraint books_rating_check
  check (rating >= 0 and rating <= 5 and rating * 2 = round(rating * 2));
