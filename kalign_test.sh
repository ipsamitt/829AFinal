#! /bin/bash
#SBATCH -J kalign_test # Job name
#SBATCH -o kalign_test.o # Name of output file
#SBATCH -e kalign_test.e # Name of error file
#SBATCH --mail-user=imittra@terpmail.umd.edu # Email for job info
#SBATCH --mail-type=all # Get email for begin, end, and fail
#SBATCH --time=12:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=8gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb

cd /fs/cbcb-scratch/imittra/long-read-data/

module load conda
source activate ENV
/usr/bin/time -v kalign -i /fs/cbcb-scratch/imittra/829A/test_0.01p_set.fasta -o kalign_test_output_0.01p.afa

