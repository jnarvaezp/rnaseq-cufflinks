#tophat
/home/gururea/tophat-2.1.1.Linux_x86_64/tophat -p 24 -G GCF_000195955.2_ASM19595v2_genomic.gff -o N0031_thout MTB ../ERR219205.fastq ../ERR219199.fastq
/home/gururea/tophat-2.1.1.Linux_x86_64/tophat -p 24 -G GCF_000195955.2_ASM19595v2_genomic.gff -o N0145_thout MTB ../ERR219198.fastq ../ERR219204.fastq
/home/gururea/tophat-2.1.1.Linux_x86_64/tophat -p 24 -G GCF_000195955.2_ASM19595v2_genomic.gff -o N0153_thout MTB ../ERR219201.fastq ../ERR219194.fastq
#cufflinks
cufflinks -p 3 -o N0031_clout N0031_thout/accepted_hits.bam
cufflinks -p 3 -o N0145_clout N0145_thout/accepted_hits.bam
cufflinks -p 3 -o N0153_clout N0153_thout/accepted_hits.bam
#merge
cuffmerge -g GCF_000195955.2_ASM19595v2_genomic.gtf -s GCF_000195955.2_ASM19595v2_genomic.fna -p 8 assemblies.txt
#diff
cuffdiff -o diff_out -b GCF_000195955.2_ASM19595v2_genomic.fa -p 8 -L N0031,N0145,N0153 -u merged_asm/merged.gtf ./N0031_thout/accepted_hits.bam ./N0145_thout/accepted_hits.bam ./N0153_thout/accepted_hits.bam

