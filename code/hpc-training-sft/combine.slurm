#!/bin/bash
#SBATCH --partition=gpu_a100
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:1
#SBATCH --mem=95GB
#SBATCH --time=0-01:00:00
#SBATCH --output=combine_%j.log
#SBATCH --error=combine_%j.err

WORKSPACE=${WORKSPACE:-"$PWD"}
CONTAINER=${CONTAINER:-env4.sif}
LLAMA_ALPACA_DIR=${LLAMA_ALPACA_DIR:-Chinese-LLaMA-Alpaca-3}
BASE_MODEL=${BASE_MODEL:-Llama-3.1-8B}
LORA_MODEL=${LORA_MODEL:-sft-b-output/sft-b-5}
COMBINED_OUTPUT=${COMBINED_OUTPUT:-sft-b-combined/sft-b-5}

cd "$WORKSPACE"
singularity exec --unsquash --nv --pwd /workspace --bind .:/workspace "$CONTAINER" \
    python3 "/workspace/$LLAMA_ALPACA_DIR/scripts/merge_llama3_with_chinese_lora_low_mem.py" \
    --base_model "/workspace/$BASE_MODEL" \
    --lora_model "/workspace/$LORA_MODEL" \
    --output_dir "/workspace/$COMBINED_OUTPUT"
