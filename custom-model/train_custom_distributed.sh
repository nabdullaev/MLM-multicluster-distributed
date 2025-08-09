#!/bin/bash

# Placeholder script to launch distributed training for a custom model.
# Update DATASET_PATH and MODEL_CONFIG_PATH with your data and model paths.

# ==== User-editable paths ====
DATASET_PATH=/path/to/dataset_text_document
MODEL_CONFIG_PATH=/path/to/model_config_or_checkpoint
CHECKPOINT_PATH=/path/to/checkpoints
TENSORBOARD_LOGS_PATH=/path/to/tensorboard/logs

# ==== Multi-node configuration ====
GPUS_PER_NODE=8
MASTER_ADDR=localhost
MASTER_PORT=6000
NUM_NODES=1
NODE_RANK=0
WORLD_SIZE=$(($GPUS_PER_NODE * $NUM_NODES))

DISTRIBUTED_ARGS=(
    --nproc_per_node $GPUS_PER_NODE
    --nnodes $NUM_NODES
    --node_rank $NODE_RANK
    --master_addr $MASTER_ADDR
    --master_port $MASTER_PORT
)

TRAINING_ARGS=(
    --dataset-path $DATASET_PATH
    --model-config $MODEL_CONFIG_PATH
    --save $CHECKPOINT_PATH
    --tensorboard-dir $TENSORBOARD_LOGS_PATH
)

# Launch training
exec torchrun ${DISTRIBUTED_ARGS[@]} custom-model/train.py ${TRAINING_ARGS[@]}
