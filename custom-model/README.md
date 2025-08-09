# Custom Model Distributed Training Template

This directory contains placeholder files for launching distributed training
of a custom model on a custom dataset using `torchrun`.

## Usage
1. Edit the paths inside `train_custom_distributed.sh`:
   - `DATASET_PATH` – path to your preprocessed dataset.
   - `MODEL_CONFIG_PATH` – path to your model configuration or checkpoint directory.
   - `CHECKPOINT_PATH` – directory where checkpoints will be saved.
   - `TENSORBOARD_LOGS_PATH` – directory for TensorBoard logs.
   - adjust cluster variables (`GPUS_PER_NODE`, `NUM_NODES`, etc.) as needed for your setup.
2. Run the script:

```bash
bash custom-model/train_custom_distributed.sh
```

3. Replace the contents of `train.py` with your actual training logic. It currently only parses the arguments and prints the provided paths.

This template lets you quickly plug in your own model and dataset while preserving the multi-cluster launch pattern used throughout this repository.
