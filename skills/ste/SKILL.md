---
name: ste
description: "Viết lại câu trả lời hoặc tài liệu kỹ thuật của AI để người không chuyên hiểu và quyết định được, mà không đổi nghĩa: giữ đủ từng mục, số liệu, định danh và độ chắc chắn; giải thích mã nội bộ, thuật ngữ và các câu hỏi cần chốt. Dùng khi gọi /ste hoặc $ste, khi người đọc nói chưa hiểu, hoặc khi cần rà chỗ mơ hồ trong plan/yêu cầu. Không áp lên nội dung thương hiệu; không chứng nhận ASD-STE100."
user-invocable: true
when_to_use: "Ngay sau một báo cáo hoặc kế hoạch kỹ thuật mà người đọc không chuyên cần hiểu hoặc phải quyết định; khi rà tài liệu để agent khác triển khai không phải đoán."
category: reasoning
keywords: [ste, clarity, plain-language, ambiguity, decision, non-technical]
argument-hint: "[path|chủ đề] [--check] [--strict] [--visual auto|off|diagram|html|video]"
license: MIT
metadata:
  version: "2.0.0"
---
# STE: viết lại cho người không chuyên mà không đổi nghĩa

Người đọc hiểu công việc của họ nhưng không đọc code: chủ dự án, quản lý, khách hàng. Skill có hai mục tiêu, và mục tiêu thứ hai được ưu tiên khi hai bên xung đột:

1. Người đọc hiểu kết quả và biết mình cần làm hoặc quyết điều gì.
2. Mọi thông tin của bản gốc vẫn còn đủ và đúng.

## Đầu vào

| Cách gọi | Xử lý |
|---|---|
| `/ste` không kèm gì | Viết lại câu trả lời gần nhất của agent trong cuộc trò chuyện này |
| `/ste <đường dẫn>` | Viết lại file đó tại chỗ; với `--check` thì chỉ nhận xét |
| `/ste <chủ đề hoặc câu hỏi>` | Viết mới hoặc giải thích theo cùng quy tắc |
| Gọi cùng workflow khác (brainstorm, plan, review…) | Áp dụng ngay khi viết đầu ra của workflow đó; đọc [cách ghép workflow](references/workflow-composition.md) |

Viết bằng ngôn ngữ người đọc đang dùng, trừ khi họ yêu cầu khác. Giữ nguyên giọng thương hiệu, thơ, truyện và lời trích dẫn. Khi giao việc cho agent khác, truyền kèm lựa chọn `ste`, ngôn ngữ, chế độ, phạm vi file và hợp đồng giữ nghĩa dưới đây.

## Hợp đồng giữ nghĩa

Áp dụng mọi lúc, kể cả khi bản viết lại vì thế mà dài hơn.

1. **Viết trên nguyên văn.** Đọc lại đúng văn bản nguồn trước khi viết; không soạn lại từ trí nhớ về chủ đề. Nếu không còn thấy nguyên văn (ví dụ sau khi ngữ cảnh bị rút gọn), nói rõ điều đó, đọc lại file nguồn nếu có, và báo giới hạn nếu không có.
2. **Giữ danh sách.** Giữ cùng số mục, cùng thứ tự, cùng số thứ tự. Không gộp, tách hoặc bỏ mục. Câu hỏi còn mở, việc chờ quyết, cảnh báo và rủi ro vẫn phải có mặt.
3. **Giữ nguyên chi tiết chịu lực:** con số, đơn vị, ngày giờ, tên người, định danh (file, lệnh, API, biến, mã commit, mã đơn), điều kiện, phủ định, ngoại lệ, thứ tự bước, và độ chắc chắn (có thể, chưa kiểm tra, đề xuất, đã chốt).
4. **Giải thích, không thay thế.** Lần đầu gặp thuật ngữ hoặc mã nội bộ, viết nghĩa bằng lời thường và giữ tên gốc trong ngoặc, ví dụ "đưa bản mới lên server (release Lần B)". Nhờ vậy người đọc vẫn tra được và nhắc lại được với agent.
5. **Không thêm sự thật mới.** Thuật ngữ phổ biến (smoke test, migration, webhook) được giải thích theo nghĩa chung. Mã riêng của dự án (U01, Lần B, phase 4) chỉ được giải thích theo nguồn; nếu không có nguồn thì ghi "bản gốc chưa giải thích". Thông tin lấy thêm từ file vừa đọc trong lượt này phải ghi "bổ sung từ <nguồn>".
6. **Không che chỗ hổng.** Nếu bản gốc mâu thuẫn, thiếu việc người đọc cần làm, hoặc đặt câu hỏi mà không có lựa chọn hay khuyến nghị, nêu rõ đó là chỗ bản gốc chưa có. Không tự lấp bằng phán đoán.
7. **Dòng đối chiếu.** Khi viết lại từ một nguồn, kết thúc câu trả lời bằng một dòng như: `Đối chiếu bản gốc: giữ 6/6 mục; bổ sung: …; lược: …; bản gốc chưa rõ: …`. Bỏ những phần không có. Với file, ghi dòng này trong câu trả lời chat, không chèn vào file.

## Khoảng cách hay gặp giữa đầu ra kỹ thuật và người đọc

Rà theo thứ tự này. Ví dụ đúng và sai ở [reader-gaps](references/reader-gaps.md).

1. **Câu hỏi cần chốt thiếu bối cảnh.** Mỗi câu nêu bốn điều: đang quyết việc gì, nói bằng lời thường; vì sao cần quyết và mỗi lựa chọn dẫn tới khác biệt gì; các lựa chọn; khuyến nghị hoặc mặc định mà bản gốc đưa ra. Tách điều đã chốt khỏi điều còn thiếu, để không hỏi lại việc người đọc đã quyết. Điều gì mọi câu cùng thiếu (ví dụ không câu nào có khuyến nghị) thì nói một lần trước danh sách, không lặp ở từng câu. Không tạo thêm danh sách đánh số thứ hai; thông tin phụ dùng gạch đầu dòng.
2. **Mã, nhãn nội bộ và viết tắt** (phase 4, U01–U14, Lần B, tên biến, YAGNI, RPC): giải thích ngắn ở lần đầu theo quy tắc 4 và 5.
3. **Từ thường hoặc từ dịch mang nghĩa riêng.** Nếu một từ có thể bị hiểu theo nghĩa nghiệp vụ khác của người đọc, nói rõ nó chỉ cái gì. Ví dụ: "phát hành" một bản phần mềm khác "phát hành" hóa đơn; "xuất", "nháp", "đồng bộ" cũng thường gây nhầm. Không tự đặt từ dịch mới cho một thuật ngữ.
4. **Kết quả và việc cần làm lên đầu.** Mở bằng kết quả và việc người đọc cần làm bây giờ, hoặc nói rõ là chưa cần làm gì.
5. **Cơ chế và đánh đổi nói bằng hệ quả:** ai thấy gì, khi nào, được gì, mất gì. Dùng ví dụ có số liệu nếu bản gốc có.
6. **Lượng mơ hồ** ("giảm", "cắt bớt", "gần đây"): ghi con số từ đâu đến đâu nếu bản gốc có; nếu không có thì ghi là chưa rõ.

## Chế độ

| Chế độ | Hành vi |
|---|---|
| Mặc định | Viết lại theo hợp đồng giữ nghĩa; dùng `--visual auto` |
| `--check` | Chỉ đọc: nêu vị trí, tác động, đề xuất và điểm cần chốt; không sửa hoặc tạo file, kể cả HTML |
| `--strict` | Chỉ cho văn bản tiếng Anh, theo tinh thần ASD-STE100; đọc [hướng dẫn tiếng Anh](references/strict-english.md); không tự dịch tài liệu ngôn ngữ khác |
| `--visual off` | Không thêm bảng, sơ đồ, HTML hay video tùy chọn |
| `--visual diagram/html/video` | Dùng hình thức được yêu cầu; đọc [quy tắc minh họa](references/visual-routing.md) |

Chỉ chọn một giá trị `--visual`. Nếu `--check` đi kèm yêu cầu tạo file, chỉ trả nhận xét trong chat và nói rõ giới hạn chỉ đọc.

## Rà yêu cầu cho người triển khai

Khi viết hoặc rà plan, yêu cầu hay tiêu chí nghiệm thu, đọc [checklist mơ hồ](references/ambiguity.md). Tìm câu trả lời trong nguồn trước. Chỉ hỏi người quyết những điểm nghiệp vụ mà nguồn chưa chốt. Không tự điền giá trị và không biến đề xuất thành yêu cầu.

## Minh họa

Mặc định là `--visual auto`: dùng chữ cho câu trả lời ngắn, bảng khi cần so sánh, sơ đồ khi luồng hoặc quan hệ khó hình dung. Đọc [quy tắc minh họa](references/visual-routing.md) trước khi tạo hình, HTML hoặc video.

## Tự rà trước khi gửi

- Đếm lại số mục và số câu hỏi so với bản gốc.
- Dò từng chi tiết chịu lực ở quy tắc 3 xem còn đủ và đúng không.
- Tìm câu nào làm tăng hoặc giảm độ chắc chắn so với bản gốc.
- Đọc như người không chuyên: còn câu nào khiến họ phải hỏi "là sao" hoặc "cái này là gì" không?
- Rà câu chữ không phải là kiểm chứng hệ thống. Không viết "đã kiểm tra" nếu mới chỉ rà văn bản.

## Nguồn và giới hạn

Đọc [nguồn](references/sources.md) để biết thiết kế dựa trên đâu. Đây không phải bản chính thức của ASD-STE100, cũng không phải thước đo độ chính xác của agent.
