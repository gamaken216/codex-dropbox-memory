# Project Memory

Project: Example Website Renewal
Last updated: 2026-01-01

## Purpose

- Keep context for a website renewal project across multiple Codex sessions and PCs.

## Current State

- Design prototype is under `prototype/`.
- Product data is stored in `data/products.js`.
- The next task is to finalize the homepage information architecture.

## Important Paths

- `prototype/index.html`: homepage prototype.
- `prototype/assets/styles.css`: shared styles.
- `prototype/data/products.js`: product master.

## Decisions

- Keep the current live site untouched while prototyping.
- Use one responsive layout instead of separate PC/mobile pages.
- Keep copy practical and avoid unsupported health or legal claims.

## Commands

```powershell
node tools/validate-products.mjs
```

## Open Follow-Ups

- Decide redirect policy for old URLs.
- Move FAQ content into reusable components.

## Notes For Future Codex Sessions

- Read this file before editing the prototype.
- Validate product data before and after changes.
