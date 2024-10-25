#!/bin/bash
#SBATCH --nodes 1
#SBATCH --gpus 8
#SBATCH -t 3-00:00:00
#SBATCH -A Berzelius-2024-286
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user shutong@kth.se
#SBATCH -o /home/x_shuji/moco/logs/slurm-%A.out
#SBATCH -e /home/x_shuji/moco/logs/slurm-%A.err

module load Anaconda/2023.09-0-hpc1-bdist
conda activate data4robotics


python main_moco.py \
  -a resnet50 \
  --lr 0.03 \
  --dist-url 'tcp://localhost:10001' \
  --multiprocessing-distributed --world-size 1 --rank 0 \
  --checkpoint_dir /proj/cloudrobotics-nest/users/Stacking/dataset/CloudGripper_push_1k/mocov2/resnet50/003_1M \
  --max_images 1000000 \
  --wandb_name v2_resnet50_003_1M \
  /proj/cloudrobotics-nest/users/Stacking/dataset/CloudGripper_push_1k/hdf5

