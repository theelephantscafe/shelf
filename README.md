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

Your books are saved **in the browser you're using**, not on GitHub and not on
any server. That means:

- Nobody else can see your books, notes or ratings — they never leave your device.
- Each browser and device keeps its **own separate library**. Your phone and
  laptop will not share books.
- Clearing your browser data erases them.

Use **⋮ → Back up my books** to save a file, and **Restore from backup** to
load it into another browser.

## Updating the site

The live site is served from `index.html` on the `main` branch. Push a change
and GitHub Pages republishes it within about a minute.

## Running it locally

```
node serve.js
```

Then open http://localhost:4173 — useful for trying changes before pushing.
