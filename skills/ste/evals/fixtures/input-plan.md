---
status: draft
---
# Plan đặt lịch

- [ ] Chỉ quản lý được sửa lịch hẹn gần đây.
- API: `PATCH /appointments/:id`; trường `start_at`.
- Chủ dự án đã chốt dùng SQLite.

```sql
SELECT start_at FROM appointments WHERE id = :id;
```
