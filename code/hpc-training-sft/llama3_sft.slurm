#!/bin/bash
#SBATCH --partition=gpu_a100
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:1
#SBATCH --mem=95GB
#SBATCH --time=12:00:00
#SBATCH --output=finetune_%j.log
#SBATCH --error=finetune_%j.err

WORKSPACE=${WORKSPACE:-"$PWD"}
CONTAINER=${CONTAINER:-env4.sif}
LLAMA_ALPACA_DIR=${LLAMA_ALPACA_DIR:-Chinese-LLaMA-Alpaca-3}

cd "$WORKSPACE"
singularity exec --unsquash --nv --pwd /workspace --bind .:/workspace "$CONTAINER" \
    bash "/workspace/$LLAMA_ALPACA_DIR/scripts/training/run_sft_dg.sh"
