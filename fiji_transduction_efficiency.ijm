// ============================================================
// Measure, for each frame of a timelapse, the fraction of the
// image area covered by pixels with intensity > 0.
// ============================================================

// --- User settings ---------------------------------------------------
saveResults = true;                 // set to false to skip saving the table
outputName  = "area_fraction_results.csv";

// --- Open file ---------------------------------------------------------
path = File.openDialog("Select the timelapse TIFF file");
open(path);

title = getTitle();
getDimensions(width, height, channels, slices, frames);
totalArea = width * height;

// If the stack is a hyperstack, collapse it to a plain stack of frames
// so we can loop with setSlice(). Adjust here if you have multiple
// channels/slices and want to select a specific one first.
nFrames = nSlices;

// Prepare results table
run("Clear Results");

// --- Loop over frames ---------------------------------------------------
for (i = 1; i <= nFrames; i++) {
    selectWindow(title);
    setSlice(i);

    // Duplicate current frame so thresholding doesn't alter original data
    run("Duplicate...", "title=frame_dup");

    // Threshold: keep pixels with intensity > 0
    // (lower=1 so that 0 itself is excluded, upper=max possible value)
    setThreshold(1, 65535);   // adjust upper bound if 8-bit (use 255) or 32-bit
    run("Convert to Mask");   // creates binary mask: 255 = above threshold

    // Measure area covered by mask (in pixels)
    run("Set Measurements...", "area limit redirect=None decimal=3");
    // "limit to threshold" restricts area measurement to thresholded pixels
    run("Measure");

    coveredArea = getResult("Area", nResults - 1);

    fraction = coveredArea / totalArea;

    setResult("Frame", nResults - 1, i);
    setResult("CoveredArea_px", nResults - 1, coveredArea);
    setResult("TotalArea_px", nResults - 1, totalArea);
    setResult("AreaFraction", nResults - 1, fraction);

    close("frame_dup");
}

updateResults();

// --- Save results --------------------------------------------------------
if (saveResults) {
    dir = File.getParent(path) + File.separator;
    saveAs("Results", dir + outputName);
    print("Results saved to: " + dir + outputName);
}
