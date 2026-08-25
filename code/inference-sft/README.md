# SFT Inference

To generate distractors with an SFT model, please follow the steps below:

Assume that `inference-batch.ipynb` is placed under `sft-b/`.

1. File setup

- Place the 9-fold `test`, `train`, and `val` data in `sft-b/`.
- Place the model in `sft-b/`.
- Create an output directory such as `sft-b/output/`.

2. Path setup

- Update the paths in `inference-batch.ipynb`.
- `inference.ipynb` can also be used, but it does not process the data in batch.
