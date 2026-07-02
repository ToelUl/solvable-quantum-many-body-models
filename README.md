# Solvable Quantum Many-Body Models in Condensed Matter

**Mother Models, Equivalence Maps, and Unified Solution Methods**

Author: **Qian--Rui Lee**  
Status: **working lecture notes**  
Current public version: **v0.1.0**

This repository contains a set of lecture notes on exactly solvable quantum many-body models in condensed matter physics.  The organizing principle is not to treat solvable models as isolated examples, but to arrange them by **mother models**, **equivalence maps**, and **shared solution mechanisms**.

The notes emphasize how a small number of mathematical structures generate many standard models through parameter limits, dualities, transfer-matrix constructions, Jordan--Wigner transformations, Bogoliubov--de Gennes reductions, Bethe-ansatz structures, stabilizer/projector constructions, or Majorana-gauge decompositions.

---

## Scope

The main theme is:

> Solve a small number of mother models, then recover whole families of solvable models by parameter choices or equivalence maps.

The lecture notes cover, among other topics:

- spin-1/2 algebra and lattice conventions;
- Jordan--Wigner transformation;
- Fourier transformation and momentum-space block diagonalization;
- Bogoliubov--de Gennes formalism;
- Bogoliubov transformations and quasiparticles;
- correlation functions, covariance matrices, and Pfaffians;
- transfer matrices and quantum--classical correspondence;
- Kramers--Wannier duality and related dual descriptions;
- topology of two-band Hamiltonians;
- Bethe ansatz and Yang--Baxter structures;
- transverse-field XY chain as a mother model;
- transverse-field Ising model;
- XX chain;
- Kitaev chain;
- SSH chain;
- two-dimensional classical Ising model;
- six-vertex model and XXZ chain;
- eight-vertex model and XYZ chain;
- coordinate and algebraic Bethe ansatz;
- toric code;
- Kitaev quantum double models;
- Kitaev honeycomb model;
- Rokhsar--Kivelson quantum dimer models;
- AKLT, cluster, and parent-Hamiltonian constructions;
- mechanisms of exact solvability.

---

## Repository contents

The repository is organized as a single LaTeX project.  The root file `main.tex` collects all chapter sources from the `chapters/` directory, where each file is prefixed with a `chNN_` index reflecting its reading order in the notes:

```text
.
├── main.tex
└── chapters/
    ├── ch01_spin_half_algebra_lattice_conventions_chapter.tex
    ├── ch02_Jordan_Wigner_Transformation.tex
    ├── ch03_fourier_transform_momentum_space_blocks_chapter.tex
    ├── ch04_bogoliubov_de_gennes_formalism_chapter.tex
    ├── ch05_bogoliubov_transformation_quasiparticles_chapter.tex
    ├── ch06_correlation_functions_covariance_matrices_pfaffians_chapter.tex
    ├── ch07_transfer_matrix_quantum_classical_correspondence_chapter.tex
    ├── ch08_duality_chapter.tex
    ├── ch09_topology_two_band_hamiltonians_chapter.tex
    ├── ch10_bethe_ansatz_yang_baxter_preview_chapter.tex
    ├── ch11_transverse_field_xy_mother_model_chapter.tex
    ├── ch12_transverse_field_ising_model_chapter.tex
    ├── ch13_xx_chain_free_fermions_chapter.tex
    ├── ch14_kitaev_chain_fermionic_image_xy_chapter.tex
    ├── ch15_ssh_chain_two_band_chiral_fermions_chapter.tex
    ├── ch16_two_dimensional_classical_ising_model_chapter.tex
    ├── ch17_from_2d_classical_ising_to_1d_quantum_tfim_chapter.tex
    ├── ch18_six_vertex_model_xxz_chain_chapter.tex
    ├── ch19_eight_vertex_model_xyz_chain_chapter.tex
    ├── ch20_coordinate_bethe_ansatz_xxz_chain_chapter.tex
    ├── ch21_algebraic_bethe_ansatz_chapter.tex
    ├── ch22_further_integrable_models_chapter.tex
    ├── ch23_commuting_projector_toric_code_chapter.tex
    ├── ch24_kitaev_quantum_double_models_chapter.tex
    ├── ch25_kitaev_honeycomb_model_chapter.tex
    ├── ch26_rokhsar_kivelson_quantum_dimer_models_chapter.tex
    ├── ch27_exact_ground_state_models_aklt_cluster_parent_chapter.tex
    └── ch28_mechanisms_exact_solvability_concluding_chapter.tex
```

The root file is:

```text
main.tex
```

The compiled lecture note is distributed as a PDF through GitHub Releases.

---

## Build instructions

Both **XeLaTeX** and **pdfLaTeX** are usable for the current source.  XeLaTeX is the preferred compiler because it is more robust for modern Unicode-aware LaTeX workflows, while pdfLaTeX is kept as a supported conventional option.

### Quick build with `make`

A `Makefile` is provided as the simplest entry point.  It drives `latexmk` and handles the multiple passes needed for the table of contents and cross-references automatically.

```bash
make            # build main.pdf with XeLaTeX (default)
make pdflatex   # build main.pdf with pdfLaTeX instead
make watch      # continuous rebuild on every file save
make clean      # remove auxiliary files (keep the PDF)
make distclean  # remove auxiliary files and the PDF
```

### Recommended build with XeLaTeX

```bash
latexmk -xelatex -interaction=nonstopmode main.tex
```

### Alternative build with pdfLaTeX

```bash
latexmk -pdf -interaction=nonstopmode main.tex
```

### Direct compiler calls

If `latexmk` is unavailable, run the compiler multiple times to resolve the table of contents and cross-references.

Using XeLaTeX:

```bash
xelatex -interaction=nonstopmode main.tex
xelatex -interaction=nonstopmode main.tex
```

Using pdfLaTeX:

```bash
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
```

### Clean auxiliary files

With `latexmk`:

```bash
latexmk -C
```

Common auxiliary files such as `.aux`, `.log`, `.toc`, `.out`, `.fls`, `.fdb_latexmk`, `.synctex.gz`, and `.xdv` are intentionally ignored by Git.

---

## Continuous integration

The notes are compiled automatically by GitHub Actions using XeLaTeX, matching the recommended local build.  Two workflows are provided under `.github/workflows/`:

- `build.yml` — on every push or pull request to `main` (and via manual dispatch), compiles `main.tex` and uploads the resulting `main.pdf` as a downloadable workflow artifact.  This acts as a continuous check that the source still compiles cleanly.
- `release.yml` — when a version tag of the form `vX.Y.Z` is pushed, compiles the notes and attaches the PDF to a GitHub Release, in line with the versioning policy below.

```bash
git tag v0.2.0
git push origin v0.2.0   # triggers release.yml and publishes the PDF
```

---

## LaTeX dependencies

A standard TeX Live or MiKTeX installation should be sufficient.  The project uses common LaTeX packages including:

- `amsmath`, `amssymb`, `amsthm`, `mathtools`;
- `bm`;
- `booktabs`, `array`, `makecell`, `longtable`, `tabularx`, `adjustbox`;
- `ragged2e`, `enumitem`;
- `xcolor`;
- `geometry`;
- `microtype`;
- `hyperref`;
- `cleveref`.

On TeX Live, a reasonably complete installation such as `texlive-full` is the simplest option.  On MiKTeX, missing packages can be installed automatically or through the MiKTeX package manager.

---

## Versioning policy

The notes use semantic-style version tags:

- `v0.x.x`: working public drafts;
- `v0.x.0`: substantial new content, structural revisions, or new chapters;
- `v0.x.y`: minor corrections, typo fixes, notation cleanups, and small clarifications;
- `v1.0.0`: first stable edition suitable for formal citation as a complete version.

The PDF associated with each public version should be attached to the corresponding GitHub Release.

---

## Citation

If these lecture notes are useful for your work, please cite the repository or the corresponding released version.  Citation metadata is provided in `CITATION.cff` when available.

Suggested citation format:

```text
Qian--Rui Lee, Solvable Quantum Many-Body Models in Condensed Matter:
Mother Models, Equivalence Maps, and Unified Solution Methods,
working lecture notes, v0.1.0, 2026.
```

If a DOI is later assigned through Zenodo or another archival service, the DOI should be used for formal citation.

---

## License

Unless otherwise stated, these lecture notes are released under the
**Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**
(`CC-BY-NC-SA-4.0`).

This means that others may share and adapt the material for non-commercial purposes, provided that appropriate credit is given and derivative works are distributed under the same or a compatible license.

---

## Contributing

Corrections, suggestions, and issue reports are welcome.  Useful contributions include:

- typo corrections;
- notation inconsistencies;
- missing assumptions in derivations;
- unclear explanations;
- incorrect equations or references;
- suggestions for additional solvable-model connections.

For substantial changes, it is preferable to open an issue first so that the scope and notation can be discussed before editing the LaTeX source.

---

## Disclaimer

These notes are under active development.  They are intended as pedagogical research-level lecture notes rather than a finalized textbook.  Mathematical details, notation, references, and chapter organization may continue to change across versions.
