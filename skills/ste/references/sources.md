# Nguồn và ghi nhận

Skill này được viết lại cho người đọc không chuyên và cho các workflow agent viết code. Không sao chép bộ từ điển hoặc script từ repo nguồn.

## Repo nguồn

[0xpili/simplified-technical-english](https://github.com/0xpili/simplified-technical-english/tree/1e148d670cba46685ad2b4c3f2354a637a7fdbbe), commit `1e148d670cba46685ad2b4c3f2354a637a7fdbbe`.

Repo này dựa trên ASD-STE100 Issue 7 (2017). Phần học từ repo: câu rõ, câu chủ động, mỗi câu một ý chính, thuật ngữ nhất quán, giữ các từ cần thiết và rà lại sau khi viết. Chế độ tiếng Anh `--strict` tham khảo giới hạn 20/25 từ một câu và sáu câu một đoạn.

Repo có MIT license cho phần skill và script; từ điển ASD có quyền riêng, và bộ này không phân phối từ điển đó. Xem [license upstream](https://github.com/0xpili/simplified-technical-english/blob/1e148d670cba46685ad2b4c3f2354a637a7fdbbe/LICENSE) và [NOTICE](https://github.com/0xpili/simplified-technical-english/blob/1e148d670cba46685ad2b4c3f2354a637a7fdbbe/NOTICE.md). Bản license upstream được giữ trong `UPSTREAM-LICENSE` để ghi nhận phần tham khảo; file đó giữ nguyên tiếng Anh vì là văn bản pháp lý gốc.

## Bài của Karpathy

[Bài gốc](https://x.com/karpathy/status/2105819303471976479) nhắc tới ASD-STE100, khả năng nới mức áp dụng, rồi mở rộng sang sơ đồ, HTML tương tác và video giải thích. Bộ này lấy ý tưởng chọn hình thức nào giúp người đọc hiểu nhất; không coi danh sách đó là thứ tự bắt buộc. Repo không lưu toàn văn bài.

## Dữ liệu thực tế

Hợp đồng giữ nghĩa và [các khoảng cách hay gặp](reader-gaps.md) rút ra từ việc rà khoảng 1.740 tin nhắn của một chủ dự án không chuyên với Claude Code và Codex (08–10/2026). Trong đó có khoảng 50 lần họ phải hỏi lại. Lần thử đầu tiên của skill cũng cho thấy các lỗi giữ nghĩa khi viết lại một danh sách theo trí nhớ. Dữ liệu gốc không được công bố; các ví dụ trong repo đã được viết lại thành tình huống chung.

## Phần bổ sung của bộ này

Hợp đồng giữ nghĩa, dòng đối chiếu, rà chỗ mơ hồ theo hành vi triển khai, ghép với workflow, chế độ chỉ đọc và quy tắc chọn minh họa đều là thiết kế bổ sung. Chúng không phải quy tắc nguyên văn từ bài Karpathy, cũng không phải chứng nhận của ASD.

ASD-STE100 thuộc ASD. Bộ này không liên kết chính thức với ASD, không được ASD phê duyệt và không chứng nhận tuân thủ. Chuẩn chính thức có tại [ASD-STE100](https://www.asd-ste100.org/).
