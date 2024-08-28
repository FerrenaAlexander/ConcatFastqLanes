# ConcatFastqLanes


This script will concatenate gzipped FASTQ files if they are split across lanes.

If you have FASTQ files like this:
```
Patient1_L004_R1_001.fastq.gz
Patient1_L004_R2_001.fastq.gz
Patient1_L005_R1_001.fastq.gz
Patient1_L005_R2_001.fastq.gz
```

Or files like this:
```
Patient1_L004_R1_001.fq.gz
Patient1_L004_R2_001.fq.gz
Patient1_L005_R1_001.fq.gz
Patient1_L005_R2_001.fq.gz
```

Then, chances are your fastq samples were split across multiple lanes because that's how they were sequenced or they were just computationally split for whatever reason, and you may need to concatenate them for downstream processing. This script will concatenate the R1 and R2 files from across lanes and give files like this:

```
Patient1_L001_R1_001.fastq.gz
Patient1_L001_R2_001.fastq.gz
```


<br />
<br />


## Installation
1. Clone this repo or download/copy the file `concatfilenames_script.sh`.
2. You may have to make it executable: `chmod chmod +x concatfilenames_script.sh`

## Usage

Make sure to provide the path to the file when calling it (or you can add it to your PATH)

Here is how it works:
`./concatfilenames_script INDIR OUTDIR`

The script takes two positional arguments. The positions are important.

1. INDIR: this is a path to a folder containing the .fastq.gz or .fq.gz files as above.
2. OUTDIR: this is a path to a folder where the merged files will be saved

```
/path/to/script/concatfilenames_script.sh    path/to/split/files    path/to/desired/output
```

<br />
<br />

## Inspiration

This script was inspired by and modified from [this blog post](https://www.biostars.org/p/317385/#317471). Enhancements include the ability to choose input and output folders, ability to handle .fq.gz files, and string splitting using "_L00" rather than string length cutting.
