#!/bin/bash

#SBATCH --cpus-per-task=20
#SBATCH --job-name=testsc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --partition=gpu
#SBATCH --gpus-per-node=2
#SBATCH --qos=gpu_free
#SBATCH --mem=350GB
#SBATCH --time=12:00:00
#SBATCH --chdir /scratch/izar/xugao/testLogs
#SBATCH --output=/scratch/izar/xugao/testLogs/testsc_0_%j.out
#SBATCH --error=/scratch/izar/xugao/testLogs/testsc_0_%j.err

module load gcc cuda
echo "hello from 'hostname'"

source /home/xugao/venvs/venv-for-demo/bin/activate

cd /home/xugao/gitRepo/F-LSeSim
python test.py \
--dataroot /home/xugao/gitRepo/swapping-autoencoder-pytorch/datasets/nightVisionDatasets/ \
--checkpoints_dir ./checkpoints \
--name night2day \
--model sc \
--num_test 50 \
--gpu_ids 0 \
--gan_mode lsgan