def read_fasta(file_path):
    sequences = []
    current_sequence = None
    current_sequence_data = []

    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()
            if line.startswith('>'):
                # If a new sequence starts, save the previous one if any
                if current_sequence is not None:
                    sequences.append(current_sequence_data)
                # Initialize data for the new sequence
                current_sequence = line[1:]
                current_sequence_data = [current_sequence, '']
            else:
                # Append sequence data
                current_sequence_data[1] += line

    # Add the last sequence
    if current_sequence is not None:
        sequences.append(current_sequence_data)

    return sequences

def calculate_conservation(sequences):
    num_sequences = len(sequences)
    alignment_length = len(sequences[0][1])

    # Calculate percentage of non-gaps
    non_gaps_count = sum(1 for column in zip(*[seq[1] for seq in sequences]) if '-' not in column)
    non_gaps_percentage = (non_gaps_count / alignment_length) * 100

    # Calculate percentage of totally conserved columns
    conserved_count = sum(1 for column in zip(*[seq[1] for seq in sequences]) if len(set(column)) == 1 and '-' not in column[0])
    conserved_percentage = (conserved_count / alignment_length) * 100

    return non_gaps_percentage, conserved_percentage

# Example usage:
file_path = '/fs/cbcb-scratch/imittra/829A/muscle_test_output_0.01p.afa'
sequences = read_fasta(file_path)
non_gaps_percentage, conserved_percentage = calculate_conservation(sequences)

print("Percentage of non-gaps: ", non_gaps_percentage)
print("Percentage of totally conserved columns: ", conserved_percentage)
