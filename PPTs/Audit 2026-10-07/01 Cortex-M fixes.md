# Follow-up: Cortex-M vs ARM-state fixes (2026-10-08)

Request: (1) conditional instructions need IT blocks on Cortex-M, (2) LDM IB/DA exist only in A32, (3) `long` was treated as 8 bytes.
Backups of every file touched: `bak\audit-20261007\<name> (pre-IT-fix).pptx`.

## 1. IT blocks (Cortex-M / Thumb-2)
UAL order is used (S before condition, e.g. `SUBSNE`). Branches need no IT; 16-bit `SUBS` inside IT is assembled as the 32-bit form.

| Deck | Slides | Change |
|---|---|---|
| Ch4 ANS (both ANS and ANS OLD4) | S14, S15 | `IT LT` before `RSBLT`; prompt "only three instructions (HINT: CMP, IT, RSB)" |
| Ch4 main | S12 notes | `ADDEQS` -> `ADDSEQ` with `IT EQ` |
| Ch6 main / Exercises / Exercises ANS | all conditional-execution slides (main: S20, S27, S29-S34, S40, S43; S8/S10 re-applied on top of your edits) | IT/ITT/ITE lines added; tables on S29/S43 got an "IT (Cortex-M)" column; S40 callout reworded: "Write IT explicitly on Cortex-M. Some assemblers can insert it automatically (not portable)." |
| Ch7 | S12-S13, S20 (after you deleted old S2) | `IT EQ`; `ITT NE / SUBSNE / MULNE / BNE loop`; trace updated; `ITT GT` in max-of-array |
| Ch8 Exercises ANS | S30 | `ITE LT` / `ITE MI` |
| Ch9 | S4-S6 | `ITT EQ`, `ITE NE` |
| ARM Instruction References (+OLD) | S8 / S7 | footnote: conditional instructions need IT on Cortex-M |
| Chxx_Review S6, Lecture_xx_Review S5 | | "MOVEQ, MOVNE (needs an IT block on Cortex-M, e.g. ITE EQ)" |
| ZDELETED | S8 | IT HI / IT LO |

## 2. LDM/STM IB and DA = A32 only
Thumb-2 supports only IA and DB (PUSH = STMDB SP!, POP = LDMIA SP!).
- Ch5 main S43: `xx = IA or DB (IB, DA: A32 only)`; footnote on S43-S46; S44 notes; S53 title.
- Ch5 Exercises ANS S23: footnote.
- Ch8-2 S8, S9, S10, S12: annotated A32-only.
- NOT editable (pictures): Ch5 main S45/S46, Ch5 ANS S23, Ch8-2 S9/S10 - flagged by footnote only.

## 3. `long` = 4 bytes (`long long` = 8)
Ch3 ANS S15/S16, Ch5 ANS S21, Lecture_xx_Review S13 ("64-bit long long").

## Caveats
- Your own post-audit edits (Ch4 ANS S28 1025, Ch6 S2, Ch7 deleted S2) were kept; only my slides were merged in.
- Ch7 `SUBSNE` loop and other IT code have not been run through an assembler.
- Some Ch6 slides (S20, S34) and Ch7 S20 still run slightly past the slide bottom in the LibreOffice render (pre-existing); check in PowerPoint.
- Ch5 S53 URL runs past the footer; Ch8-2 S12 still colours only FD red.
- PDFs not regenerated.
