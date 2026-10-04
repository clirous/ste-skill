# Minh họa khi nó giúp hiểu

Chọn theo câu hỏi người đọc cần giải quyết, không theo mong muốn trang trí hoặc làm đầu ra có vẻ đầy đủ. Hướng của Karpathy là mở thêm cách giải thích; không phải lúc nào video cũng tốt hơn chữ.

## Quyết định trong chế độ auto

Trước khi tạo visual, xác định: người đọc sẽ hiểu điều gì nhanh hoặc chính xác hơn nhờ hình này? Nếu không trả lời cụ thể được, dùng chữ. Không cần công bố lý do bỏ visual cho mỗi câu trả lời đơn giản.

| Nhu cầu | Hình thức phù hợp | Khi không nên thêm |
|---|---|---|
| Một kết luận, một thao tác, vài ý rõ | Đoạn văn hoặc danh sách ngắn | Không thêm sơ đồ chỉ vì có tên kỹ thuật |
| So sánh phương án/quyền/trạng thái theo cùng tiêu chí | Bảng gọn | Ít thông tin, đọc một câu đã đủ |
| Quan hệ, thứ tự, nhánh quyết định, trách nhiệm hoặc luồng dữ liệu khó hình dung | Mermaid nhỏ, bảng chuyển trạng thái hoặc sơ đồ tĩnh | Chỉ có chuỗi đơn giản đã rõ trong chữ; không vẽ mọi component |
| Số liệu hoặc biến thiên cần so sánh | Biểu đồ dùng dữ liệu nguồn | Không tự tạo dữ liệu, tỷ lệ, chiều hướng hoặc độ chính xác |
| Người đọc cần lọc, thử kịch bản, đổi tham số hoặc khám phá nhiều lớp | HTML tương tác gọn, nếu được phép tạo artifact | Không xuất HTML chỉ để trình bày vài đoạn chữ |
| Thay đổi theo thời gian/chuyển động cần xem | Chỉ đề xuất video khi hữu ích | Không tự dựng video trong auto |

Trong `--visual off`, không tạo visual tùy chọn. Nội dung bắt buộc đã chốt của workflow đang dùng vẫn giữ; nếu toàn bộ yêu cầu không thể đáp ứng đồng thời, nêu xung đột trước khi thay đổi yêu cầu. Không xóa visual cũ khi chỉ rà văn phong.

## Khi người dùng chọn hình thức

- `diagram`: tạo sơ đồ phù hợp dù auto sẽ chọn chữ; giữ phạm vi nhỏ. Dùng skill Mermaid/diagram đang có nếu nó phù hợp và có thể gọi; không yêu cầu cài công cụ mới chỉ để vẽ.
- `html`: tạo HTML theo khả năng hiện có. Khi một workflow khác đã tạo artifact HTML (ví dụ plan hoặc brainstorm có `--html`), để workflow đó sở hữu artifact và áp dụng `ste` vào nội dung/visual của artifact đó; không tạo HTML thứ hai.
- `video`: kiểm tra công cụ, nguồn hình và âm thanh, quyền sử dụng, chi phí và phạm vi đã cho phép. Không tự lấy secret, bật dịch vụ trả phí hoặc hứa đã render nếu chưa có công cụ. Nếu chưa thể dựng, báo giới hạn và chỉ tạo kịch bản/storyboard khi đó là phần được yêu cầu/cho phép.
- `--check`: chỉ nhận xét và đề xuất visual trong chat; không tạo file ở bất kỳ chế độ nào.

## Chất lượng và nguồn sự thật

1. Mỗi visual giải quyết một câu hỏi; dùng nhãn dễ hiểu và giữ nguyên định danh khi cần đối chiếu code.
2. Giữ đủ nhánh lỗi/ngoại lệ ảnh hưởng kết luận. Đánh dấu “đề xuất” hoặc “chưa chốt” trên phần chưa được xác nhận; hình không được làm giả định có vẻ như kiến trúc đang chạy.
3. Với visual giải thích, văn bản nguồn giữ quy tắc chính thức. Nếu workflow có hợp đồng Markdown/HTML riêng, giữ hợp đồng đó. Các con số và trạng thái trong hình phải khớp nguồn.
4. Không chép lại toàn bộ tài liệu thành một artifact phụ. Nhúng sơ đồ vào tài liệu gốc nếu thích hợp; file riêng dẫn về nguồn gốc và chỉ phục vụ câu hỏi cần minh họa.
5. HTML dùng được ở kích thước màn hình nhỏ, có nhãn/đọc bằng bàn phím cho tương tác, không lệ thuộc CDN hoặc mạng nếu có thể làm tự chứa. Nội dung dạng chữ phải vẫn đọc được nếu JavaScript không chạy.
6. Kiểm tra cú pháp và mở/render artifact khi có công cụ. Nếu không render được, ghi rõ mới kiểm tra nguồn hoặc cú pháp; không tuyên bố đã xem hình.
7. Nếu runtime không hiển thị Mermaid, dùng ASCII hoặc bảng tương đương khi phù hợp; báo hạn chế mà không biến một yêu cầu đơn giản thành tác vụ cài môi trường.
