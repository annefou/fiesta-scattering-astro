# FIESTA Scattering Astro: Astrophysics Map Synthesis Reproduction

[![Source DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19685025.svg)](https://doi.org/10.5281/zenodo.19685025)
[![Docker image DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19708077.svg)](https://doi.org/10.5281/zenodo.19708077)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

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
