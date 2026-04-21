rule all:
    input:
        "results/power_spectrum_comparison.png",


rule run_notebook:
    input:
        script="01_astro_synthesis.py",
        data="data/LSS_map_nside128.npy",
    output:
        "results/power_spectrum_comparison.png",
    shell:
        """
        jupytext --to notebook {input.script}
        jupyter execute 01_astro_synthesis.ipynb
        """
