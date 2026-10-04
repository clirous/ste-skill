---
status: draft
---
# Booking plan

- [ ] Only managers can edit recent appointments.
- API: `PATCH /appointments/:id`; field `start_at`.
- The project owner decided to use SQLite.

```sql
SELECT start_at FROM appointments WHERE id = :id;
```
