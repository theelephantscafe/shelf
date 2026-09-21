# Shelf — a personal reading tracker

**Live site: https://theelephantscafe.github.io/shelf/**

Track books, reading dates, formats, ratings and notes. The calendar fills a
book's cover across every day between its start and end date, so only those
two dates need logging.

## Using it

Open the live site in any browser. Add it to your phone's home screen and it
opens like an app.

Book search and cover art come from [Open Library](https://openlibrary.org),
a free book database — no account needed.

## Where your books are stored

Your books live in a Supabase database and are tied to your account, so they
follow you between your phone, laptop and anywhere else you sign in.

Signing in is passwordless: enter your email, and Supabase emails you a link
that signs you in.

The Supabase URL and anon key in `index.html` are safe to be public. They grant
nothing on their own. Every row in the `books` table is stamped with its owner,
and a Row Level Security rule makes the database refuse to return rows that
belong to anyone else. See `schema.sql`.

**Never put the `service_role` key or the database password in this repo** —
those bypass those rules.

## Database setup

Run `schema.sql` in Supabase → SQL Editor. Safe to run more than once.

## Opening it up to other people later

The schema is already multi-user. Letting friends and family in is a settings
change (Supabase → Authentication → allow signups), not a rewrite.

## Updating the site

The live site is served from `index.html` on the `main` branch. Push a change
and GitHub Pages republishes it within about a minute.

## Running it locally

```
node serve.js
```

Then open http://localhost:4173 — useful for trying changes before pushing.
