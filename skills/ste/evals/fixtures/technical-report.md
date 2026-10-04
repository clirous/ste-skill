Done with Phase 7–9 on branch `feat/order-db`, tests 412/412 green, not deployed.

Status:
- Migrations 0031–0034 written, not yet run on production.
- `SYNC_ENABLED` defaults to false.
- UAT U01–U05 not run yet.
- Decided earlier: back up the database before every migration run.

Need you to decide:
1. Ship Release B (includes migrations 0031–0034) to production Friday night or Sunday?
2. Turn on `SYNC_ENABLED` for one staff member in preview mode?
3. Reconciliation cron: cut back the frequency or keep it?
4. How long do we keep the backup `orders.db.pre-0031`?

Note: can deploy right away via the API, but if auto-deploy runs, the /orders page will break because `ORDER_API_URL` is missing.

Open question: does the old import script on Drive need to move into the repo?
