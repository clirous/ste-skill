# Ghép STE vào workflow khác

Workflow đang dùng quyết định các bước cần làm và đầu ra bắt buộc. Đó có thể là bộ skill như AgentKit/ClaudeKit (brainstorm, plan, cook, test, code-review, fix) hoặc quy trình riêng của dự án. STE giúp diễn đạt và rà chỗ thiếu nghĩa ngay trong bước đó; STE không thêm cổng duyệt bắt buộc.

| Bước | Áp dụng STE ở đâu | Giữ nguyên |
|---|---|---|
| Brainstorm | Mục tiêu, phương án, đánh đổi, giả định và khuyến nghị | Quyết định đã chốt, phạm vi, điều kiện nghiệm thu; ý tưởng còn mở vẫn là ý tưởng |
| Plan | File plan và các phase trong phạm vi task; rà trước khi bàn giao | Frontmatter, mục bắt buộc, liên kết, checklist, tên file/API/bảng, điều kiện lỗi và cách kiểm chứng |
| Code | Giải thích thay đổi và các điểm cần quyết | Code, lệnh, định danh; viết dễ hiểu không thay cho build và test |
| Test | Kết quả, ảnh hưởng của lỗi và phần chưa kiểm tra | Lệnh đã chạy, kết quả thật, lỗi và phần chưa có test |
| Code review | Tình huống gây lỗi, ảnh hưởng, bằng chứng, đề xuất | Mức độ lỗi, quyết định của người quyết, phát hiện đúng thực tế |
| Fix | Nguyên nhân, hành vi được sửa và bằng chứng | Phạm vi sửa và kết quả kiểm thử; không đổi "chưa kiểm tra" thành "đã đúng" |

Khi workflow có template đầu ra riêng, đọc template đó và giữ nguyên nó; bảng trên không thay thế template. Nếu workflow chưa được cài, STE vẫn chạy độc lập.

Khi một yêu cầu gọi cả workflow viết tài liệu (ví dụ `/plan`) và `ste`, áp dụng STE trong lúc viết. Không viết xong rồi tạo thêm một bản "dễ hiểu" thứ hai. Agent phụ nhận cùng chỉ dẫn và phạm vi. Agent chính rà kết quả, đối chiếu với quyết định và nguồn.

Khi chỉ yêu cầu `--check`, trả về phát hiện; không tự sửa plan, checkbox, trạng thái phase hay file báo cáo. Không chạy workflow có ghi file để phục vụ một yêu cầu chỉ đọc.

Khi review đề nghị thay một thư viện hay ngưỡng mà người quyết đã chọn, giữ quyết định gốc và trình bày đề nghị mới như một câu hỏi cần chốt. Viết cho dễ đọc không phải lý do để đổi nghiệp vụ.
