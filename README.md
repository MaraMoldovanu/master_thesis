# Master Thesis — Mara Moldovanu

Analysis code for the Master's thesis *"Characterization of retinal ganglion cells in
mouse retinal organoids"*, submitted to the Graduate School of Systemic Neurosciences
(GSN-LMU) and carried out in the Serwane Lab, Universität Ulm.

## What this repository contains

Python code for the quantitative image analysis presented in the thesis. All analyses
were performed on confocal and light-sheet recordings of mouse retinal organoids derived
from E14Tg2a and RxGFP embryonic stem cell lines.

### Analyses

**Transduction efficiency (3D)**
Quantification of AAV-VLP transduction efficiency at the single-nucleus level. Nuclei are
segmented in three dimensions with Cellpose, and each nucleus is classified as transduced
or non-transduced using a peri-nuclear shell-overlap protocol adapted from Rogler et al.
Includes threshold sensitivity analysis and 3D visualisation of the classification.

**Calcium imaging**
Extraction of single-cell fluorescence traces from jGCaMP time-lapse recordings, with
bi-exponential photobleaching correction, ΔF/F computation, and threshold-based detection
of calcium transients.

**Voltron / jGCaMP8f co-expression**
Shape-based separation of Voltron, Nuc650 and SiRact674 signal from a spectrally mixed
638 nm channel, followed by per-cell co-expression quantification and soma morphology
analysis.

**Immunostaining images**
Loading, scaling and channel inspection of confocal immunostaining datasets.

## Repository structure
