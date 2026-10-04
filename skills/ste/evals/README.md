# Chạy lại bộ ca

`evals.json` chứa chín input train và tiêu chí chấm. Ca `rewrite-previous` kiểm tra cách dùng chính: đưa `fixtures/technical-report.md` vào làm câu trả lời trước của agent, rồi gọi `/ste` không kèm gì. Khi chạy consumer, chỉ đưa prompt và fixture; giữ expected_output/assertions ở bên người chấm.

Với ca readonly, sao chép `fixtures/input-plan.md` thành `input-plan.md` trong workspace tạm riêng trước khi chạy, ghi SHA256 trước/sau và kiểm tra không tạo artifact. Không cho consumer đọc cây nguồn/bộ expected của variant khác.

So sánh baseline không đọc STE với candidate đọc SKILL và tham chiếu phù hợp, giữ cùng input/công cụ/cấu hình. Ghi rõ nếu chạy batch trong một phiên hoặc từng ca ở phiên mới; hai kiểu không có cùng mức độc lập.

Nếu muốn một bộ holdout cho lần cải tiến sau, hãy tạo ca mới mà agent chưa từng đọc.

Các tool kiểm tra schema (ví dụ `eval_skill.py` của skill-creator) chỉ kiểm tra cấu trúc hoặc chấm artifact, không tự chạy model. Không coi schema hợp lệ là toàn bộ test đã qua.
