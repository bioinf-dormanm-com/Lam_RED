use warnings;
use strict;

my $coord1 = '';
my $coord2 = '';
my $strand_input = '';
my $strand = '';

my $promcoord1 = '';
my $promcoord2 = '';
my $geneseq = '';
my $promseq = '';
my $genelen = '';
my $promlen = 0;
my $lic5 = 'GTGTAGGCTGGAGCTGCTTC';
my $lic3 = 'ATGGGAATTAGCCATGGTCC';
my $prom20up = '';
my $prom20down = '';
my $oligo5 = '';
my $oligo3 = '';

$lic5 = lc($lic5);
$lic3 = lc($lic3);

print "\n\n\nHello.\n\n";
print "Lam_RED computes primer sequences to disrupt a sequence of DNA by double crossover events (Datsenko and Wanner 2000). \n";
print "\nThe program relies on a genome sequence file in the directory, input.fa. Read the README.\n";
print "Please be ready to supply the following information:\n\n";
print "1: The co-ordinates of your disruption target site on the reference genome\n";
print "2: The strand on which your gene is located\n\n";
print "NOTE: If giving coordinates on the -'ve strand, you need to give the lower value BEFORE the larger value. If you don't the script won't run.\n\n";

#######reads in the genome file#####

my $sequence = shift;

my $dna = ''; # will be moving the sequence here.

# this lets the program distinguich between a FASTA file and a command line sequence.

if ($sequence =~ /\.fa/) {
	open (INPUT, $sequence);
	while (my $input = <INPUT>) {
	
    	# check if it is a '>'
    	if ($input =~ /^>/) {
    		# we have a header line
    		# skip it
    		next;
    	
    	} else {
    
       	 # append to DNA string
			chomp $input;
			$dna .= uc $input;
    	}
	}
	close INPUT;
} else {
	chomp $sequence;
	$dna = uc $sequence;
} 

my $dna2 = $dna;



print "\nPlease now enter your first disruption co-ordinate:      ";
$coord1 = <>;
chomp $coord1;
print "\nAnd the second co-ordinate:                              ";
$coord2 = <>;
chomp $coord2;
print "\nAnd on the positive (+) or the negative (-) strand?      ";
$strand_input = <>;
chomp $strand_input;

print $coord1;
print '..';
print $coord2;
print " ($strand_input)";

if ($strand_input eq '-') {
	$promcoord1 = $coord2 + $promlen;
	$promcoord2 = $coord2;
	$genelen = $coord2 - $coord1 + 1;
} else {
	$promcoord1 = $coord1 - $promlen;
	$promcoord2 = $coord1;
	$genelen = $coord2 - $coord1 + 1;
};

print "\n\nDesigning primers to knockout the sequence between co-ordinates ";
print $coord1;
print " and ";
print $coord2;
print " for you,";
if ($strand_input eq '-') {
	print " on the reverse strand.\n";
} else {
	print " on the forward strand.\n";
	}
	

$geneseq = substr $dna, $coord1 - 1, $genelen;

if ($strand_input eq '-') {
	$geneseq = reverse($geneseq);
	$geneseq =~ tr/GATC/CTAG/;
}

print "\nOK, the sequence you want to disrupt is:\n";
print $geneseq;

$prom20up = substr $geneseq, 0, 40;
$prom20down = substr $geneseq, length($geneseq) - 40, length ($geneseq) - 1;

print "\nOf length: ";
print length($geneseq);
print " bp.";


my $regionseq = substr $dna, $coord1 - 41, $genelen + 81;

if ($strand_input eq '-') {
	$regionseq = reverse($regionseq);
	$regionseq =~ tr/GATC/CTAG/;
}

print "\n\nSo we're looking at a disruption region:\n";
print $regionseq;

$prom20up = substr $regionseq, 0, 40;
$prom20down = substr $regionseq, length($regionseq) - 40, length ($regionseq) - 1;

print "\nOf length: ";
print length($regionseq);
print " bp.";


print "\n\nThe first ";
print length($prom20up);
print " bases of the disruption region are: \n";
print $prom20up;
print "\nThe last ";
print length($prom20down);
print " bases of the disruption region are: \n";
print $prom20down;

$prom20down = reverse($prom20down);
$prom20down =~ tr/GATC/CTAG/;

print "\nReverse complement is: ";
print $prom20down;

$oligo5 = $prom20up . $lic5;
$oligo3 = $prom20down. $lic3;

print "\n\n And so your knockout oligo sequences are:\n";
print "Forward primer: $oligo5\n";
print "Reverse primer: $oligo3\n";

print "\nHave a nice day!\n";

