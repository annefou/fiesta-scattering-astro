# FIESTA Scattering Astro: Astrophysics Map Synthesis Reproduction

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
of the [OSCARS](https://oscars-project.eu/) project, exploring reproducible
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

## Author

**Anne Fouilloux** -- LifeWatch ERIC
ORCID [0000-0002-1784-2920](https://orcid.org/0000-0002-1784-2920)

## License

[MIT](LICENSE)
