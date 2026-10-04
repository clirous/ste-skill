# Rà yêu cầu để agent không phải đoán

Mục tiêu là tìm chỗ có thể làm hai người triển khai hai hành vi khác nhau. Không biến brainstorming thành đặc tả đầy đủ quá sớm; chỉ làm rõ đến mức cần cho quyết định hiện tại.

## Checklist theo vấn đề

| Điểm cần rõ | Câu hỏi cần giải quyết nếu có liên quan |
|---|---|
| Chủ thể và quyền | Ai được làm? Trong phạm vi tổ chức/chi nhánh/bản ghi nào? |
| Kích hoạt và hành động | Khi nào chạy? Thay đổi gì? Người dùng thấy kết quả nào? |
| Điều kiện và ngoại lệ | Điều kiện nối bằng AND hay OR? Khi điều kiện không đạt thì sao? |
| Giá trị và thời gian | Ngưỡng nào, đơn vị nào, múi giờ nào, có gồm điểm biên không? |
| Trạng thái và thuật ngữ | Một tên có nhiều nghĩa không? Trạng thái nào được phép chuyển sang đâu? |
| Dữ liệu và lỗi | Nguồn nào có thẩm quyền? Khi thiếu/không hợp lệ/lỗi dịch vụ thì xử lý thế nào? |
| Chạy lặp hoặc đồng thời | Nếu thao tác lặp hay hai người thao tác cùng lúc, kết quả mong muốn là gì? |
| Hoàn thành | Tình huống nào chứng minh đúng? Trường hợp lỗi nào cần kiểm tra? |

Dùng các hàng phù hợp với task; không bổ sung concurrency, múi giờ hoặc cơ chế mới cho mọi yêu cầu chỉ để hoàn thành checklist.

## Cách xử lý một phát hiện

1. Trỏ đúng câu hoặc vị trí nguồn và nêu hai cách hiểu khác nhau.
2. Nêu khác biệt hành vi thực tế; bỏ tranh luận từ ngữ nếu nó không ảnh hưởng nghĩa.
3. Đọc code/tài liệu/kiểm thử hiện có nếu chúng có thể giải quyết. Phân biệt hành vi đang có với hành vi mới chủ dự án muốn.
4. Nếu nguồn đã rõ, sửa diễn đạt khi được phép và dẫn chứng. Nếu nguồn mâu thuẫn hoặc thiếu quyết định nghiệp vụ, hỏi điều quyết định hành vi; không chọn một câu trả lời thay chủ dự án.
5. Trong bản nháp chưa chốt, ghi rõ điểm cần chốt. Không biến placeholder thành tiêu chí nghiệm thu đã được duyệt; không mô tả plan sẵn sàng code khi còn thiếu quyết định cản trở triển khai.

## Ví dụ minh họa, không phải yêu cầu mặc định

“Không cho đặt lịch trùng” chưa xác định trùng khách, nhân viên hay phòng; cũng chưa nói lịch hủy có tính không. Không tự chọn “trùng kỹ thuật viên” hoặc coi hai lịch chạm biên là trùng. Tìm quy tắc dự án hoặc hỏi chủ dự án.

“Đề xuất giảm timeout từ 30s xuống 10s nếu thử nghiệm đạt” phải giữ chữ đề xuất, cả hai giá trị và điều kiện thử nghiệm. Không viết lại thành “Timeout là 10s”.

“Dịch vụ có thể bị chậm khi mất kết nối” không có nghĩa “Dịch vụ sẽ bị chậm”. Câu ngắn hơn mà đổi độ chắc chắn là sai.
