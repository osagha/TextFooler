#!/bin/sh
#SBATCH --gres=gpu:1
#SBATCH --mem=64000
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00
#SBATCH --job-name="textfooler_bert"

module purge
module load anaconda3/5.3.1
module load cuda/10.0.130
module load gcc/6.3.0
module load mysql/5.7.17

NETID=sak869


source activate /scratch/${NETID}/nlu/code/project/TextFooler/env

export PYTORCH_TRANSFORMERS_CACHE=/scratch/${NETID}/nlu/code/project/TextFooler/pycache

python attack_classification.py \
--dataset_path ./data/ag \
--target_model bert \
--target_model_path ./models/ag/ \
--counter_fitting_embeddings_path ./counter_fit_embeddings/counter-fitted-vectors.txt \
--USE_cache_path ./cache
