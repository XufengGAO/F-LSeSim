#!/bin/bash

#SBATCH --cpus-per-task=20
#SBATCH --job-name=sciAll
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --partition=gpu
#SBATCH --gpus-per-node=2
#SBATCH --qos=gpu_free
#SBATCH --mem=350GB
#SBATCH --time=12:00:00
#SBATCH --chdir /scratch/izar/xugao/trainLogs
#SBATCH --output=/scratch/izar/xugao/trainLogs/scAll_0_%j.out
#SBATCH --error=/scratch/izar/xugao/trainLogs/scAll_0_%j.err

module load gcc cuda
echo "hello from 'hostname'"

source /home/xugao/venvs/venv-for-demo/bin/activate

cd /home/xugao/gitRepo/F-LSeSim

python train.py  \
--dataroot /home/xugao/gitRepo/swapping-autoencoder-pytorch/datasets/nightVisionDatasets/ \
--name night2dayAll \
--lambda_spatial 4 \
--lambda_spatial_idt 1 \
--lambda_identity 1 \
--lambda_style 2 \
--lambda_perceptual 1 \
--lambda_gradient 0 \
--model sc \
--gpu_ids 0 \
--attn_layers 4,7,9 \
--loss_mode cos \
--gan_mode lsgan \
--display_port 8097 \
--direction AtoB \
--patch_size 32 \
--learned_attn \
--augment \
--use_norm \
--continue_train \
--epoch_count 5


echo "bye from 'hostname'"