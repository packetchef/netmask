#!/usr/bin/env perl

use Net::IP;

#my $iprange = new Net::IP('192.168.5.0/24');
my $inputRange = $ARGV[0];
my $iprange = new Net::IP($inputRange);

my $ipsize = $iprange->size();
my $startIPint = $iprange->intip();
my $endIPint = $startIPint + $ipsize - 1;

my $startIP = inttoip($startIPint);
my $endIP = inttoip($endIPint);

#print "Range : $iprange\n";
print "Size : $ipsize\n";
print "startIPint : $startIPint\n";
print "endIPint : $endIPint\n";
print "startIP : $startIP\n";
print "endIP : $endIP\n";

my @checkArr = returnArray();
print "Check 1 : " . $checkArr[0] . "\n";
print "Check 2 : " . $checkArr[1] . "\n";

my %checkHash = returnHash();
print "Check 1 : " . $checkHash{'start'} . "\n";
print "Check 2 : " . $checkHash{'end'} ."\n";

sub inttoip {
	my($inputInt) = @_;
	my(@IPArray);
	for(my($i) = 0; $i < 4; $i++)  {
		$IPArray[$i] = $inputInt % 256;
		$inputInt = ($inputInt - $IPArray[$i]) / 256;
	}
	my $IP=$IPArray[3] . '.' . $IPArray[2] . '.' . $IPArray[1] . '.' . $IPArray[0];
	return $IP;
}

sub returnArray {
	my @returnArr = ();
	push @returnArr, 5;
	push @returnArr, 55;
	return @returnArr;	
}

sub returnHash {
	%retHash = ();
	$retHash { 'start' } = 192;
	$retHash { 'end' } = 256;
	return %retHash;
}


