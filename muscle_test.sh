#! /bin/bash
#SBATCH -J muscle_test # Job name
#SBATCH -o muscle_test.o # Name of output file
#SBATCH -e muscle_test.e # Name of error file
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
/usr/bin/time -v muscle -align /fs/cbcb-scratch/imittra/829A/test_0.01p_set.fasta -output /fs/cbcb-scratch/imittra/829A/muscle_test_output_0.01p.afa

