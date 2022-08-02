#!/bin/bash
#SBATCH --job-name=ESRNET
#SBATCH --output=output_esrnet.out
#SBATCH --error=error_esrnet.out
#SBATCH --ntasks=1
#SBATCH --time=120:00:00
#SBATCH --mem=60Gb
#SBATCH --gres=gpu:rtx8000:4
#SBATCH --partition=long
#SBATCH -c 8


module add anaconda/3
conda activate downscaling

mkdir $SLURM_TMPDIR/datasets
cp -r /home/mila/v/venkatesh.ramesh/scratch/downscaling/Real-ESRGAN/datasets/DIV2K_train_HR $SLURM_TMPDIR/datasets

python realesrgan/train.py -opt options/train_realesrnet_x2plus.yml --debug 
