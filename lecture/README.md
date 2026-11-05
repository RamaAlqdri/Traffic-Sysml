# Catatan Lengkap MBSE dan SysML

Dokumen ini merupakan indeks gabungan dari dua materi perkuliahan:

1. **Pengantar Model-Based System Engineering**
2. **Pemodelan Sistem dengan MBSE**

Gunakan dokumen berikut sebagai sumber utama:

- [`01-pengantar-mbse.md`](./01-pengantar-mbse.md)
- [`02-pemodelan-mbse-sysml.md`](./02-pemodelan-mbse-sysml.md)

---

# Peta Konsep

```text
Systems Engineering
        |
        v
       MBSE
        |
        +------------------------+
        |                        |
        v                        v
   Modeling Language         Framework
      (SysML)           Arcadia / Magic Grid / SYSMOD
        |
        +-------------------------+
        |            |            |
        v            v            v
 Requirement      Behavior      Structure
        |            |            |
        |            |            +--> BDD
        |            |            +--> IBD
        |            |            +--> Parametric
        |            |
        |            +--> Use Case
        |            +--> Activity
        |            +--> Sequence
        |            +--> State Machine
        |
        +--> Requirement Diagram

Semua view dihubungkan melalui:
- consistency
- traceability
- allocation
- satisfy
- verify
```

---

# Inti Pemahaman

## MBSE bukan software tertentu

MBSE adalah pendekatan engineering.

Tool hanya membantu implementasi.

## SysML bukan MBSE itu sendiri

SysML adalah salah satu modeling language yang dapat digunakan dalam MBSE.

## Diagram bukan tujuan akhir

Tujuan akhirnya adalah model sistem yang:

- konsisten,
- terintegrasi,
- dapat ditelusuri,
- dapat dianalisis,
- dapat diverifikasi.

## Traceability adalah kunci

Hubungan ideal:

```text
Need
→ Requirement
→ Behavior
→ Structure
→ Interface
→ Verification
```

## Model adalah single source of truth

Requirement, desain, analisis, dan verification harus dapat dikaitkan melalui model yang sama atau ekosistem model yang konsisten.

---

# Relevansi Proyek Smart Traffic Light

Smart Traffic Light cocok dimodelkan dengan MBSE karena menggabungkan:

- physical system,
- software logic,
- sensor,
- controller,
- interface,
- behavior berbasis waktu,
- safety constraint,
- requirement,
- verification.

Model proyek sebaiknya dibangun mengikuti alur:

```text
Literature Evidence
        ↓
Stakeholder / Problem
        ↓
Requirements
        ↓
Use Case & Activity
        ↓
Sequence & State
        ↓
BDD & IBD
        ↓
Traceability
        ↓
Verification
```

Untuk workflow code-based:

- Mermaid → Requirement Diagram
- PlantUML → behavioral dan structural diagrams
- LaTeX → report
- LaTeX Beamer → presentation
- Git → version control
```
