# Paddy Leaf Disease Detection (MATLAB)

4th-year course project · Bharathidasan University, India · 2021 · solo project

A MATLAB application that detects diseases in paddy (rice) leaves from photos, using
image processing and a feed-forward neural network.

## What it does
1. **Load** a paddy leaf image (GUI).
2. **Pre-process**: convert to grayscale and remove noise with an average filter.
3. **Analyse colour**: check RGB ranges measured for healthy leaves.
4. **Extract features**: convert the binary image into a 240-value vector (saved as CSV).
5. **Classify** with a feed-forward neural network (`newff`, 25 hidden neurons) into 4 classes:
   - Blast disease
   - Narrow brown spot disease
   - Brown spot disease
   - Normal (healthy) leaf

## Results
Tested on **40 leaf images** (10 per class): **37 correct, 92.5% accuracy**.

| Class | Test images | Correct | Accuracy |
|---|---|---|---|
| Blast | 10 | 9 | 90% |
| Narrow brown spot | 10 | 10 | 100% |
| Brown spot | 10 | 8 | 80% |
| Normal | 10 | 10 | 100% |
| **Total** | **40** | **37** | **92.5%** |

## Files
| File | Step |
|---|---|
| `load_image.m` | image acquisition |
| `preprocess.m` | grayscale + filtering |
| `color_range_check.m` | RGB colour analysis |
| `export_features.m` | binary image → 240-value feature vector |
| `train_and_classify.m` | neural network training, noise test, classification |

## Note
This is an **archived student project**. The original project folder was not kept, so these
files are **code excerpts recovered from the 2021 project report** lightly reformatted, with long messages shortened.
They are GUI callback excerpts (they use `handles` from the MATLAB GUI) and are not a
complete runnable application.

**Tools:** MATLAB (Image Processing Toolbox, Neural Network Toolbox)

Author: Marimuthu Mayavan · [mayavan-m.github.io](https://mayavan-m.github.io)
