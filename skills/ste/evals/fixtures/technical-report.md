Đã xong Phase 7–9 trên branch `feat/order-db`, test 412/412 xanh, chưa deploy.

Trạng thái:
- Migration 0031–0034 đã viết, chưa chạy trên production.
- `SYNC_ENABLED` mặc định false.
- UAT U01–U05 chưa chạy.
- Đã chốt từ trước: sao lưu database trước mỗi lần chạy migration.

Cần anh quyết:
1. Phát hành Lần B (gồm migration 0031–0034) tối thứ Sáu hay Chủ nhật?
2. Bật `SYNC_ENABLED` cho một nhân viên thử ở chế độ preview?
3. Cron đối soát: cắt bớt nhịp hay giữ?
4. Giữ bản backup `orders.db.pre-0031` bao lâu?

Lưu ý: deploy được ngay qua API, nhưng nếu để auto-deploy chạy thì trang /orders sẽ lỗi vì thiếu biến `ORDER_API_URL`.

Câu hỏi còn mở: script import cũ trên Drive có cần chuyển vào repo không?
