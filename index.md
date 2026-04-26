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

## FORRT nanopublication chain

The full provenance of this replication is recorded as a six-step FORRT
nanopublication chain on the
[Science Live](https://platform.sciencelive4all.org) platform — paper →
quote → atomic claim → FORRT claim → study → outcome → CiTO citation back
to the paper. Each step is independently citable and machine-readable.

> **Headline assertion — machine-readable:**
> [**This replication `cito:confirms` and `cito:usesMethodIn` Delouis et al. 2022**](https://w3id.org/sciencelive/np/RAAKbihIlG-DgS_LBhWCGPGc8-fKHWvIM-ee03u7t9kqs)
>
> Two relationships in one citation nanopublication: we substantiate the
> paper's generalisation claim (`cito:confirms`) by replicating the
> framework on a different astrophysical map, and our work uses the
> scattering-transform method developed in that paper (`cito:usesMethodIn`).
> Discovery tools (Scholia, Wikidata pipelines, SPARQL endpoints) can
> follow this single citation to find both relationships.

The five preceding nanopubs build the provenance ladder up to that citation:

| Step | Type | Nanopub URI |
|---|---|---|
| 1 | Quote-with-comment | <https://w3id.org/sciencelive/np/RAWvryGSpOem0bvHN8n9Oxb-YtE3SkPZCfjrsTX0vL_tA> |
| 2 | AIDA sentence | <https://w3id.org/sciencelive/np/RAQAkuCWgBCTFrngRjONy5rpUfgNeafzDpG10Z1E0SSXI> |
| 3 | FORRT Claim (model performance) | <https://w3id.org/sciencelive/np/RANzldYFCS3QYLbv8mQ7yCzVrr83sjOMU11GueTODExw4> |
| 4 | FORRT Replication Study | <https://w3id.org/sciencelive/np/RA0uFwTDq3Ip2_M_ZeHxmfavOu3ZCx9ZEeYSbXE0quHQk> |
| 5 | FORRT Replication Outcome (Validated, High) | <https://w3id.org/sciencelive/np/RAmEYMywIv9uDQPHuvPcPLEONpl7Et4M9hikmvDrRdVG0> |
| 6 | **CiTO `confirms` + `usesMethodIn` Delouis 2022** | **<https://w3id.org/sciencelive/np/RAAKbihIlG-DgS_LBhWCGPGc8-fKHWvIM-ee03u7t9kqs>** |

## Companion repositories

- [fiesta-scattering-sst](https://github.com/annefou/fiesta-scattering-sst) --
  Sea Surface Temperature synthesis (Earth observation counterpart)
- [FOSCAT](https://github.com/jmdelouis/FOSCAT) -- the scattering transform
  library by Jean-Marc Delouis
