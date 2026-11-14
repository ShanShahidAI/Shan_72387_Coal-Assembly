# Computer Organization & Assembly Language (COAL) — Labs & Assignments

**Student:** Shan (SAP 72387)  
**Degree:** BS Artificial Intelligence • Riphah International University, Islamabad

Original 8086 Assembly coursework organized by lab number, with assignment submissions and extra emu8086 practice programs kept in their own folders. The code was moved without rewriting the source.

## Lab index

| Folder | Included work |
| --- | --- |
| [Lab 02](lab-02/) | 8086 DOS output exercise (one distinct source file) |
| [Lab 04](lab-04/) | Two assembly tasks |
| [Lab 05](lab-05/) | Five programs, including **two distinct tasks originally both named Task 3** |
| [Lab 06](lab-06/) | Eighteen exercises: arithmetic, loops, functions, number checks and arrays |
| [Lab 07](lab-07/) | Twelve short exercises and a PDF submission |
| [Lab 10](lab-10/) | Five assembly programs and Word/PDF submissions |
| [Practice](practice/) | Bank account and student-result practice programs |
| [Assignments](assignments/) | Assignment 01 and another submission with conflicting original labels |

**Not present in the uploaded GitHub repository:** separately identified Lab 01, 03, 08 and 09 submissions. No files have been invented.

## Assignments

- [Assignment 01](assignments/assignment-01/) — original `.asm` file plus Word and PDF reports.
- [Assignment 03](assignments/assignment-03/) — Word/PDF filenames both say “Assignment 3,” **but the original GitHub directory was called “Assignment 2.”** The path is based on the filenames; please verify the title inside the documents against your instructor's sheet before submission. Original filenames and folder remain on the backup branch.

## Running programs

These are 16-bit x86 assembly exercises. Most source files use `org 100h` and DOS interrupts, so use **emu8086** or a compatible 8086/DOS emulator rather than running `.asm` directly in Windows.

1. Open the intended `.asm` file in emu8086.
2. Assemble/compile the program.
3. Run/emulate and inspect the output or registers.
4. Change input constants only where the exercise expects them.

**This repository cleanup did not assemble or execute all programs.**

## File cleanup

- Consistent `lab-XX/` paths and human-readable ASCII filenames.
- The two originally separate Lab 02 tasks had **identical Git blob SHA values**, so the current branch keeps one canonical copy (`lab-02/task-01.asm`). Both originals remain recoverable in backup.
- The two similarly named **Lab 05 Task 3** programs are different: even/odd and positive/negative/zero. Both are intentionally preserved.
- All original reports, PDFs, `.asm` programs and practice files are retained.
- Full original tree is recoverable on `backup/before-coal-reorganization-2026-11-14`.

## Semester project

[Traffic Signal Controller — Signal City V5](https://github.com/ShanShahidAI/traffic-signal-controller) lives in its own repository with 8086 source, interactive HTML demo, proposal, technical report and slides.

[GitHub profile](https://github.com/ShanShahidAI)
