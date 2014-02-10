#!/usr/bin/env perl

# Does not always return expected results
# eg. 192.168.5.0/23 generates an exception, although 192.168.0.0/23 works

use Net::IP;

my $ipRange = $ARGV[0] || die "Error: gimme a mug o' yer finest CIDR\n";

testHandler();

sub testHandler {
	my %testIP = returnStartEnd($ipRange);
	print("Number of IPs : " . $testIP{'ipCount'} . "\n");
	print("Starting IP   : " . $testIP{'start'} . "\n");
	print("Ending IP     : " . $testIP{'end'} . "\n");
}

sub returnStartEnd {
	my $checkRange = new Net::IP(@_);

	my $startIPInt = $checkRange->intip();
	my $startIP = inttoip($startIPInt);

	%ipHash = ();
	$ipHash { 'ipCount' } = $checkRange->size();
	$ipHash { 'start' } = inttoip($startIPInt);

	my $endIPInt = $startIPInt + $ipHash{'ipCount'} - 1;
	$ipHash { 'end' } = inttoip($endIPInt);

	return %ipHash;
}

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

