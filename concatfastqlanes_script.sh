#!/bin/bash

# read the arguments, indir and outdir

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 indir outdir"
  exit 1
fi

# Assign positional parameters to variables
INDIR=$1
OUTDIR=$2


#get samplenames.
# in the input dir, find all files with *.fq.gz or *.fastq.gz, 
# then basename (strip the input file path); 
# then using sed, we set the string "_L00" as a "," which we can use a delimiter
# then using cut, we get the first half of the delimiter.
# then, we sort and deduplicate, since the sample name will have multiple files.
sampnames=$(find $INDIR -type f -name "*.f*q.gz" | while read F; do basename $F | sed 's/_L00/,/g' | cut -d ',' -f 1; done | sort | uniq)

for i in $sampnames; do

	printf '\n\n'; echo $i;

	echo 'Merging R1 files';
	cat ${INDIR}/${i}_L00*_R1_*.f*q.gz > ${OUTDIR}/${i}_L001_R1_001.fastq.gz

        echo 'Merging R2 files';
        cat ${INDIR}/${i}_L00*_R2_*.f*q.gz > ${OUTDIR}/${i}_L001_R2_001.fastq.gz

done
