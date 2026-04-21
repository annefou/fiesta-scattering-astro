# Scattering Transform: Astrophysics Reproduction

## What are scattering transforms?

The **scattering transform** is a wavelet-based representation that captures
non-Gaussian statistical properties of a signal across multiple scales. Unlike
the power spectrum, which only encodes second-order (Gaussian) information,
scattering coefficients preserve higher-order correlations -- making them ideal
for characterising complex, non-Gaussian fields such as those found in
astrophysics and geoscience.

The method was introduced by Mallat (2012) and adapted to spherical
astrophysical data by
[Delouis et al. 2022](https://doi.org/10.1051/0004-6361/202244566), who
applied it to CMB component separation using the
[FOSCAT](https://github.com/jmdelouis/FOSCAT) library.

## Why this matters for astrophysics

Large Scale Structure (LSS) maps encode the distribution of matter in the
Universe. Standard two-point statistics (power spectra) lose information about
the non-Gaussian features imprinted by gravitational collapse. By matching
scattering coefficients rather than power spectra alone, we can synthesise
realisations that faithfully reproduce the full statistical complexity of the
observed field.

## The FIESTA cross-domain story

This repository is one half of a **cross-domain demonstration** within the
FIESTA-OSCARS project. We show that the same scattering transform methodology
transfers between:

- **Astrophysics** (this repo) -- synthesis of an LSS cosmological map
- **Earth observation**
  ([fiesta-scattering-sst](https://github.com/annefou/fiesta-scattering-sst))
  -- synthesis of a Sea Surface Temperature field

The mathematical framework is identical; only the input data and physical
interpretation change. This transferability is a concrete example of how FAIR,
reproducible research workflows can bridge scientific disciplines.

## Results summary

| Metric | Value |
|---|---|
| Power spectrum ratio (synthesised / input) | **0.987** |
| Scattering coefficient match | **99.6 %** |

The synthesised map reproduces both the power spectrum and the higher-order
scattering statistics of the original LSS field to high fidelity.

## Companion repositories

- [fiesta-scattering-sst](https://github.com/annefou/fiesta-scattering-sst) --
  Sea Surface Temperature synthesis (Earth observation counterpart)
- [FOSCAT](https://github.com/jmdelouis/FOSCAT) -- the scattering transform
  library by Jean-Marc Delouis
