# Lam_RED
Current revision 0.0.4

Lam_RED software version 0.0.4
Matthew J. Dorman
dormanm.com
12/10/15

Changelog: 
12/10/15 Version 0.0.4. Fixed so that 40 bp +/- site to mutagenise were used for primer. Also tidied up script. 

INTRODUCTION~

Lam_RED is a short PERL script which carries out the initial design of your primer sequences for lambda red mutagenesis. 

The program reads in a bacterial genome in unannotated FASTA format (the default file supplied with Lam_RED is the Salmonella enterica serovar Typhimurium strain SL1344 chromosomal genome, extracted from the Ensembl repository on 10/10/15).

You need to specify the region of DNA you want to disrupt, and you need to know onto which strand your insertion should occur. 

INSTRUCTIONS FOR USE~

To use Lam_RED, you need to have Perl installed. If you use a Mac or a Linux PC, odds are you already have Perl. If you use a Windows PC, you need to install Perl if you haven't already (ActiveState Perl allows you to run Perl on the command line, or you could try Cygwin).

Make sure you have the Lam_RED script in the same folder as your genome FASTA file.

Run Lam_RED by using the following command:

perl Lam_RED.pl INPUT.fa

(where INPUT.fa is your suitably-formatted genome file in .fa format).

Lam_RED will prompt you for the co-ordinates of chromosomal DNA you want to disrupt with the pKD3 or pKD4 amplicons. You need to supply these in their order of magnitude (i.e., co-ordinate 1 needs to be smaller than co-ordinate 2). If your co-ordinates refer to a sequence on the negative strand of the genome template, just indicate that when prompted. 

Lam_RED will also ask which strand (+ or -) your mutagenesis is targeted to. This is important, because it tells the script whether to take the reverse complement of the region specified by your co-ordinates. 

Once you supply these three facts, Lam_RED will generate two oligo sequences for you. It will also give you the region of DNA that your co-ordinates refer to in its input file. You should double-check these to make sure that you're targeting the right DNA region. 

The lowercase regions in your mutagenesis primers are the 20-mer homology arms to amplify the pKD3 or pKD4 disruption cassette. If you want to use a different gene replacement cassette, you are more than welcome to edit the script yourself to alter these homology sequences. 

If you have any problems, please email matt [at] dormanm [dot] com. 

12/10/15
