# ste — để AI nói cho người không chuyên hiểu, mà không đổi nghĩa

Skill cho Claude Code, Codex và các agent hỗ trợ chuẩn Agent Skills. Khi AI vừa trả lời một tràng kỹ thuật (kết quả test, deploy, plan, các câu cần bạn quyết), gõ `/ste`. Agent sẽ viết lại đúng câu trả lời đó để người không đọc code cũng hiểu được và biết mình cần làm gì, nhưng vẫn giữ đủ mọi chi tiết của bản gốc.

*English summary at the bottom.*

## Vì sao cần

Tác giả đã rà khoảng 1.740 tin nhắn của chính mình (một chủ dự án không chuyên) với Claude Code và Codex trong hai tháng. Có khoảng 50 lần phải hỏi lại "chưa hiểu", "là sao". Nguyên nhân chủ yếu không phải câu văn khó, mà là:

1. **Mã và nhãn nội bộ không được giải thích:** "U01–U14", "phase 4/5", "Lần B", tên biến.
2. **Câu hỏi cần chốt thiếu bối cảnh:** không nói đang quyết việc gì, vì sao, có những lựa chọn nào, AI khuyên chọn gì.
3. **Cơ chế hoặc đánh đổi nói chưa tới nơi**, có khi tự mâu thuẫn.
4. **Từ thường mang nghĩa riêng:** "phát hành" (đưa bản mới lên server) bị hiểu thành phát hành hóa đơn.
5. **Báo cáo không nói người đọc cần làm gì.**

Một dòng "hãy viết dễ hiểu" đặt cố định trong file hướng dẫn chỉ làm giảm nhóm 5. Vì vậy skill xử lý thẳng từng nhóm. Chi tiết và ví dụ: [reader-gaps.md](skills/ste/references/reader-gaps.md).

## Viết dễ hiểu mà không sai nghĩa

Rủi ro lớn nhất khi "dịch" cho dễ hiểu là AI làm lệch nghĩa. Skill có một hợp đồng giữ nghĩa bắt buộc:

- Viết lại trên nguyên văn, không soạn lại theo trí nhớ.
- Giữ đủ số mục, đúng thứ tự, giữ mọi câu hỏi còn mở.
- Giữ nguyên con số, ngày giờ, tên file, lệnh, mã, điều kiện, phủ định và độ chắc chắn ("có thể", "chưa kiểm tra", "đề xuất").
- Giải thích thuật ngữ nhưng vẫn giữ tên gốc trong ngoặc, để bạn còn nhắc lại được với AI.
- Không bịa thêm. Chỗ bản gốc chưa nói (ví dụ thiếu khuyến nghị) thì ghi là chưa có.
- Cuối câu trả lời có một dòng đối chiếu, ví dụ: `Đối chiếu bản gốc: giữ 6/6 mục; bản gốc chưa rõ: U01–U14 là gì.`

Dòng đối chiếu do chính agent tự rà, nên không phải bằng chứng độc lập. Với quyết định quan trọng, bạn vẫn nên so nhanh với bản gốc.

## Cài đặt

macOS hoặc Linux:

```bash
git clone https://github.com/clirous/ste-skill.git ~/Code/ste-skill
~/Code/ste-skill/install.sh
```

Script tạo liên kết tới thư mục `skills/ste` trong `~/.claude/skills/`, `~/.codex/skills/` và `~/.agents/skills/`, chỉ với những công cụ đã có trên máy. Nếu đã có một thư mục `ste` thật ở đó, script giữ nguyên và báo cho bạn. Muốn cập nhật thì chạy `git pull` trong repo.

Windows, hoặc nếu không muốn dùng script: chép nguyên thư mục `skills/ste` vào `%USERPROFILE%\.claude\skills\ste` (Claude Code) hoặc `%USERPROFILE%\.codex\skills\ste` (Codex).

Sau khi cài, mở một phiên mới.

## Cách dùng

```text
/ste                              viết lại câu trả lời vừa rồi của AI
/ste plans/my-plan/plan.md        viết lại file đó cho rõ
/ste --check plans/my-plan/plan.md   chỉ nhận xét, không sửa file
/ste giải thích webhook là gì     viết mới theo cùng quy tắc
/ste --visual off                 chỉ dùng chữ, không bảng hay sơ đồ
/ste --visual diagram             thêm sơ đồ khi luồng khó hình dung
/ste --strict                     văn bản tiếng Anh theo tinh thần ASD-STE100
```

Trong Codex, gõ `$ste` thay cho `/ste`. Có thể dùng cùng workflow khác, ví dụ "lập plan cho tính năng X, dùng ste cho toàn bộ plan". Skill trả lời bằng ngôn ngữ bạn đang dùng.

## Giới hạn

- Skill chỉ diễn đạt lại. Nếu bản gốc sai hoặc thiếu, bản viết lại cũng không đúng hơn; skill chỉ cố chỉ ra chỗ thiếu.
- Skill chạy khi bạn gọi, không tự bật cho mọi câu trả lời.
- Đây không phải bản chính thức của ASD-STE100 và không chứng nhận tuân thủ chuẩn đó.

## Ghi nhận và giấy phép

Dựa trên ý tưởng của [0xpili/simplified-technical-english](https://github.com/0xpili/simplified-technical-english) và [bài viết của Andrej Karpathy](https://x.com/karpathy/status/2105819303471976479) nhắc tới ASD-STE100 cùng các cách giải thích bằng sơ đồ, HTML và video. Chi tiết: [sources.md](skills/ste/references/sources.md). Giấy phép MIT; license của repo tham khảo nằm ở `skills/ste/UPSTREAM-LICENSE`.

---

## English summary

`ste` is an Agent Skill for Claude Code, Codex and compatible agents. After an AI sends a technical report, type `/ste` (or `$ste` in Codex). The agent rewrites that exact answer for a non-technical reader. It explains internal codes and jargon, puts the outcome and next action first, and turns each pending decision into a clear question with options and the source's recommendation. A strict meaning-preservation contract applies: same items in the same order, numbers, identifiers and certainty kept verbatim, no invented facts, original terms kept in brackets, and a final line comparing the rewrite with the original. The instructions are written in Vietnamese, but the skill replies in the reader's language. `--strict` gives English output in the spirit of ASD-STE100 (not certified). Install with `./install.sh` as shown above. MIT licensed.
