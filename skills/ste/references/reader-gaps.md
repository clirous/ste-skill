# Khoảng cách giữa đầu ra kỹ thuật và người đọc không chuyên

Các nhóm dưới đây rút ra từ dữ liệu thật: khoảng 1.740 tin nhắn của một chủ dự án không chuyên làm việc với Claude Code và Codex trong hai tháng. Trong đó có khoảng 50 lần họ phải hỏi lại "chưa hiểu", "là sao". Các ví dụ đã được viết lại thành tình huống chung, không chứa dữ liệu gốc.

| Nhóm | Số lần trong 50 lần hỏi lại | Dấu hiệu |
|---|---|---|
| Mã, nhãn nội bộ, viết tắt | 17 | "U01–U14 là gì?", "phase 4/5 là cái gì?" |
| Câu hỏi cần chốt thiếu bối cảnh | 14 | "chưa hiểu câu hỏi", "khuyến nghị của bạn là gì?" |
| Cơ chế, đánh đổi chưa tới nơi, hoặc tự mâu thuẫn | 8 | "tức là sao?", "vẫn làm được mà sao bảo hỏng?" |
| Từ thường hoặc từ dịch mang nghĩa riêng | 6 | "phát hành là phát hành cái gì, hóa đơn à?" |
| Báo cáo quá kỹ thuật, không nói người đọc cần làm gì | 5 | "đọc không hiểu gì cả", "giờ tôi cần làm gì?" |

Một quy tắc văn phong luôn bật ("viết dễ hiểu") làm phàn nàn "quá kỹ thuật" giảm từ 4 lần xuống 1 lần, nhưng không làm giảm hai nhóm đầu: sau khi có quy tắc, nhóm câu hỏi cần chốt còn tăng từ 3 lên 11 lần. Vì vậy hai nhóm này được viết thành quy tắc cụ thể trong skill.

## 1. Câu hỏi cần chốt

Bản gốc:

> Cần anh quyết:
> 1. Chạy migration 0075–0078 trong release Lần B tối nay?
> 2. Bật `NOTIFY_ENABLED`?

Viết lại:

> 1. **Có cho cập nhật cấu trúc dữ liệu (migration 0075–0078) khi đưa bản mới lên server tối nay (release Lần B) không?**
>    - Lựa chọn: làm tối nay, hoặc dời sang đợt sau.
>    - Vì sao cần chốt và khuyến nghị: bản gốc chưa nêu. Cần agent bổ sung trước khi bạn trả lời.
> 2. **Có bật tính năng gửi thông báo tự động (`NOTIFY_ENABLED`) không?**
>    - Bật thì hệ thống tự gửi thông báo; tắt thì không gửi gì. Bản gốc không nói gửi cho ai, nên cần hỏi lại agent.

Giữ đủ 2 câu, giữ số migration, tên cờ và chữ "tối nay". Phần bản gốc không có thì nói là không có, không tự bịa lý do.

## 2. Mã và nhãn nội bộ

- Sai: "Anh chạy UAT U01–U14."
- Đúng, khi nguồn có giải thích: "Anh tự bấm thử 14 bước kiểm tra trên app (U01–U14, danh sách trong `owner-uat.md`)."
- Đúng, khi nguồn không có giải thích: "Anh chạy U01–U14. Bản gốc chưa giải thích U01–U14 là gì."

## 3. Từ mang nghĩa riêng

Trong một cửa hàng có xuất hóa đơn điện tử, câu "Phát hành Lần B tối nay" dễ bị hiểu là phát hành hóa đơn. Nên viết: "Đưa bản mới của app lên server tối nay (release Lần B; việc này không liên quan đến hóa đơn)."

Những từ khác cũng hay gây nhầm: "xuất" (xuất file hay xuất kho), "nháp" (bản nháp trong app hay tab Nháp trong sheet), "đồng bộ" (chạy một lần hay chạy liên tục), "gửi lỗi" (gửi đi bị lỗi hay gửi báo cáo lỗi).

## 4. Kết quả và việc cần làm lên đầu

- Bản gốc: "Vitest 183/183, Playwright 7/7, typecheck sạch, còn 4 warning cũ. Commit `a1b2c3d`."
- Viết lại: "Bản sửa qua hết các bài kiểm tra tự động (183/183 và 7/7). Bạn chưa cần làm gì; bước tiếp theo đang chờ bạn quyết ở mục 2. Còn 4 cảnh báo cũ, có từ trước lần sửa này. Mã commit: `a1b2c3d`."

## 5. Cơ chế và đánh đổi

- Bản gốc: "Audit feed là trang 1, limit 200 events toàn bộ hoạt động admin."
- Viết lại: "Hệ thống chỉ đọc 200 sự kiện gần nhất của trang quản trị, gồm cả những sự kiện không phải đơn. Vào ngày đông đơn, nếu hệ thống tạm dừng lâu thì có thể sót một số đơn. Dữ liệu không mất, chỉ là chưa được đọc tới (audit feed, limit 200)."

Khi bản gốc có hai ý trông ngược nhau, ví dụ "deploy được ngay" và "tự deploy sẽ ra trang hỏng", hãy chỉ ra và giải thích theo nguồn. Ở ví dụ này: tự deploy chỉ cập nhật code, còn release này cần thêm ba thao tác cấu hình làm bằng tay. Nếu nguồn không giải thích được thì ghi là bản gốc mâu thuẫn.

## 6. Lượng mơ hồ

- Sai: "Đề xuất cắt bớt nhịp cron."
- Đúng: "Đề xuất giảm số lần chạy tự động từ 12 xuống 6 lần mỗi giờ (cron gửi thông báo)."

## Lỗi giữ nghĩa đã gặp khi viết lại

- Soạn lại danh sách theo trí nhớ: 6 việc chờ quyết thành 10 mục, kèm thêm một danh sách đánh số thứ hai, khiến người đọc bỏ sót mục 9 và 10.
- Làm rơi một câu hỏi còn mở và một chi tiết số liệu (số migration).
- Chuyển một việc sang nhóm "quyết sau" trong khi bản gốc xếp nó vào đợt hiện tại.
- Hỏi lại một việc người đọc đã chốt vì không ghi rõ phần đã chốt và phần còn thiếu.
- Đổi "đề xuất" thành "sẽ", hoặc "có thể chậm" thành "sẽ chậm".

Dòng đối chiếu ở cuối bài giúp phát hiện các lỗi này:

> Đối chiếu bản gốc: giữ 6/6 mục và 2/2 câu hỏi mở; bổ sung: lý do của mục 1 (từ `plan.md` phase 7); bản gốc chưa rõ: U01–U14 là gì.
