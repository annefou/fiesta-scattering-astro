# FIESTA Scattering Astro: Astrophysics Map Synthesis Reproduction

[![CI](https://github.com/annefou/fiesta-scattering-astro/actions/workflows/ci.yml/badge.svg)](https://github.com/annefou/fiesta-scattering-astro/actions/workflows/ci.yml)
[![Jupyter Book](https://github.com/annefou/fiesta-scattering-astro/actions/workflows/jupyter-book.yml/badge.svg)](https://annefou.github.io/fiesta-scattering-astro/)
[![Docker](https://github.com/annefou/fiesta-scattering-astro/actions/workflows/docker.yml/badge.svg?event=release)](https://github.com/annefou/fiesta-scattering-astro/pkgs/container/fiesta-scattering-astro)
[![Source DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19685025.svg)](https://doi.org/10.5281/zenodo.19685025)
[![Docker image DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19708077.svg)](https://doi.org/10.5281/zenodo.19708077)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![FAIR4RS](https://img.shields.io/badge/FAIR4RS-conformant-brightgreen)](https://doi.org/10.15497/RDA00068)
[![FORRT](https://img.shields.io/badge/FORRT-replication-blue)](https://forrt.org/)
[![Science Live](https://img.shields.io/badge/Science%20Live-nanopub%20chain-purple)](https://w3id.org/sciencelive/np/RAmEYMywIv9uDQPHuvPcPLEONpl7Et4M9hikmvDrRdVG0)

This repository reproduces the **scattering transform synthesis** method from
[Delouis et al. 2022](https://doi.org/10.1051/0004-6361/202244566) (*Astronomy & Astrophysics*),
applying it to a Large Scale Structure (LSS) cosmological map.

The scattering transform, originally developed for CMB component separation by
**Jean-Marc Delouis**, captures non-Gaussian statistical features of
astrophysical fields across multiple scales. We use his
[FOSCAT](https://github.com/jmdelouis/FOSCAT) library to synthesise a new
realisation of an LSS map that matches the scattering statistics of the input.

## Results

| Metric | Value |
|---|---|
| Power spectrum ratio (synth / input) | **0.987** |
| Scattering coefficient match | **99.6 %** |

Full figures are written to `results/`.

## Companion repository

This work is paired with
[fiesta-scattering-sst](https://github.com/annefou/fiesta-scattering-sst),
which applies the same scattering transform approach to Sea Surface Temperature
data. Together the two repos form the **cross-domain story** of the
FIESTA-OSCARS project: demonstrating that scattering-based synthesis techniques
transfer between astrophysics and Earth observation.

## FIESTA-OSCARS

FIESTA (FAIR Interoperable Experimental Scattering Transform Analysis) is part
of the [OSCARS](https://oscars-project.eu/projects/fair-image-analysis-across-sciences) project, exploring reproducible
research workflows that bridge disciplines through shared mathematical methods.

## FORRT nanopublication chain

The full provenance of this replication is recorded as a six-step FORRT
nanopublication chain on the
[Science Live](https://platform.sciencelive4all.org) platform. Each step is
independently citable and machine-readable; together they form the FAIR
provenance receipt for this replication.

> **Headline assertion — machine-readable:**
> [**This replication `cito:confirms` and `cito:usesMethodIn` Delouis et al. 2022**](https://w3id.org/sciencelive/np/RAAKbihIlG-DgS_LBhWCGPGc8-fKHWvIM-ee03u7t9kqs)
>
> The CiTO citation nanopublication encodes two relationships at once: we
> substantiate the paper's own generalisation claim (`cito:confirms`) by
> applying the framework to a different astrophysical map, and our work
> uses the scattering-transform method developed in that paper
> (`cito:usesMethodIn`). Discovery tools (Scholia, Wikidata pipelines,
> SPARQL endpoints) can follow this single citation to find both
> relationships.

The five preceding nanopubs build the provenance ladder up to that citation:

| Step | Type | Asserts | Nanopub URI |
|---|---|---|---|
| 1 | Quote-with-comment | Verbatim quote of Delouis et al. 2022's generalisation claim (Section 6 Conclusion), with personal comment on its potential | [`RAWvr…`](https://w3id.org/sciencelive/np/RAWvryGSpOem0bvHN8n9Oxb-YtE3SkPZCfjrsTX0vL_tA) |
| 2 | AIDA sentence | Atomic, declarative restatement: scattering transforms on the sphere can synthesise astrophysical maps that match multi-scale non-Gaussian statistics | [`RAQAk…`](https://w3id.org/sciencelive/np/RAQAkuCWgBCTFrngRjONy5rpUfgNeafzDpG10Z1E0SSXI) |
| 3 | FORRT Claim (model performance) | The synthesis claim, typed as a FORRT model-performance claim | [`RANzl…`](https://w3id.org/sciencelive/np/RANzldYFCS3QYLbv8mQ7yCzVrr83sjOMU11GueTODExw4) |
| 4 | FORRT Replication Study | Methodology: same FOSCAT software, different astrophysical input data (cosmological LSS instead of Planck dust polarisation), lower resolution for CPU compatibility | [`RA0uF…`](https://w3id.org/sciencelive/np/RA0uFwTDq3Ip2_M_ZeHxmfavOu3ZCx9ZEeYSbXE0quHQk) |
| 5 | FORRT Replication Outcome (Validated, High) | PS ratio 0.987, scattering match 99.55%, pixel correlation −0.004 | [`RAmEY…`](https://w3id.org/sciencelive/np/RAmEYMywIv9uDQPHuvPcPLEONpl7Et4M9hikmvDrRdVG0) |
| 6 | **CiTO citation — `cito:confirms` + `cito:usesMethodIn` Delouis 2022** | The headline dual assertion above | [**`RAAKb…`**](https://w3id.org/sciencelive/np/RAAKbihIlG-DgS_LBhWCGPGc8-fKHWvIM-ee03u7t9kqs) |

The chain runs: paper → quote → atomic claim → FORRT claim → study (this
repo) → outcome (the metrics in the Results table) → CiTO citation back to
the paper.

## Quick start

```bash
# Install dependencies
pip install foscat healpy numpy matplotlib scipy jupytext

# Run the synthesis
python 01_astro_synthesis.py
```

Or with conda:

```bash
conda env create -f environment.yml
conda activate fiesta-scattering-astro
jupytext --to notebook 01_astro_synthesis.py
jupyter execute 01_astro_synthesis.ipynb
```

## Note on FOSCAT and GPU/CPU support

The [FOSCAT](https://github.com/jmdelouis/FOSCAT) package (as of v2026.2.7 on
PyPI) has several hardcoded `device='cuda'` defaults, which means it **only
works on machines with an NVIDIA GPU** out of the box. On CPU-only machines
(Apple Silicon Macs, CI runners, etc.) it will crash with a CUDA device error.

We have submitted a fix upstream:
[jmdelouis/FOSCAT#40](https://github.com/jmdelouis/FOSCAT/pull/40)
([commit](https://github.com/annefou/FOSCAT/commit/04244ed)).

Until the fix is merged and released, you can install FOSCAT from our fork:

```bash
pip install git+https://github.com/annefou/FOSCAT.git@v0.1.0-cpu
```

The fix is fully backwards compatible: on CUDA machines the behaviour is
identical to the original. It simply adds auto-detection so that CPU is used as
a fallback when CUDA is not available.

## Container image

A Docker container is built on every release and pushed to GitHub Container
Registry, and archived to Zenodo for long-term preservation.

```bash
docker pull ghcr.io/annefou/fiesta-scattering-astro:latest
docker run --rm -v "$PWD/results:/app/results" \
    ghcr.io/annefou/fiesta-scattering-astro:latest
```

Zenodo-archived tarballs of every released image are available via the
[Docker image concept DOI 10.5281/zenodo.19708077](https://doi.org/10.5281/zenodo.19708077)
— each release has its own version-specific DOI listed on that Zenodo page.

## How to cite

If you use this repository, please cite it via its Zenodo DOI together with
the original method paper (Delouis et al. 2022).

```
Fouilloux, A. (2026). FIESTA Scattering Astro: Astrophysics Map Synthesis
Reproduction (v0.2.1). Zenodo. https://doi.org/10.5281/zenodo.19685025
```

BibTeX:

```bibtex
@software{fouilloux_fiesta_scattering_astro,
  author    = {Fouilloux, Anne},
  title     = {FIESTA Scattering Astro: Astrophysics Map Synthesis Reproduction},
  year      = {2026},
  version   = {0.2.1},
  publisher = {Zenodo},
  doi       = {10.5281/zenodo.19685025},
  url       = {https://doi.org/10.5281/zenodo.19685025}
}
```

The DOI above is the **concept DOI** — it always resolves to the latest
release. Specific version DOIs are available on the
[Zenodo record page](https://doi.org/10.5281/zenodo.19685025).

See [`CITATION.cff`](CITATION.cff) for machine-readable citation metadata.

## Author

**Anne Fouilloux** -- LifeWatch ERIC
ORCID [0000-0002-1784-2920](https://orcid.org/0000-0002-1784-2920)

## License

[MIT](LICENSE)
