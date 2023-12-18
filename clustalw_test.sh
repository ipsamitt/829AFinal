#! /bin/bash
#SBATCH -J clustal_test # Job name
#SBATCH -o clustal_test.o # Name of output file
#SBATCH -e clustal_test.e # Name of error file
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
/usr/bin/time -v clustalo -i fs/cbcb-scratch/imittra/829A/test_0.01p_set.fasta -o /fs/cbcb-scratch/imittra/829A/clustal_test_0.01p.msa --output=FASTA

