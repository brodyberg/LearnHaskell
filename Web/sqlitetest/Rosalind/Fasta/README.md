# FASTA

File format for DNA-related information

## Example

>Rosalind_1
GATTACA

## Goal

Turn this: 

	>Rosalind_1
	GATTACA

Via this: 

type Name = String
data DNA = A | G | T | C
data RNA = A | G | U | C
data Fasta = Name [DNA]
           | Name [RNA] 

Into this: 

fromString
">Rosalind_1
GATTACA" == Fasta("Rosalind1", [G, A, T, T, A, C, A])