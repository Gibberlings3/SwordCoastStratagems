#!/usr/bin/env perl

my $scsline="";
# my $defaultlibraryfile="scsii/ssl/library.slb";
# my $autolibfile="scsii/ssl/autolib.slb";
# my $sslfiles="sslfiles.txt";
my $outputroot="ssl_out";
my $outputoverride="no";
my $location="none";
my @scsarray=();
my @trigger=();
my @action=();
my @output=();
my $inloop="No";
my $combine="";

my @target=();
my @targetcondition=();

my %targethash=();
my %targetlist=();

my %triggerhash=();
my %triggerlist=();

my @defaulttrigger=();


my @filelist=();
#####################################################
sub process_user_input {

# The format is:
#
# perl ssl.pl "<inputfiles> -o <output directory> -l <library files> <variable list>"
#
# library.slb and autolib.slb are always checked in the working directory 
# unless they don't exist
#
# input files can be given without suffix; if they are, we append .ssl . Ditto if library files are
# given without .slb
#
# if output directory is blank, output to input directory/ssl_out
#
# The variable list has form IsVampire=True&IsLich=False . Each occurrence of the entry before the = sign is replaced
# by the respective entry after the = sign

     #	@instructions=split(' ',$userinput);
	%varhash=();
	$libfiles=0;
	$booleans=0;
	$aretherefiles=0;
	$suffix=".ssl";
	foreach $1 (@instructions) {
		chomp $1;
		if ($1 eq "-l") {
			$suffix=".slb";
			$libfiles=1;
			$outputloc=0;
			$booleans=0;
		}
		elsif ($1 eq "-o") {
                        $outputloc=1;
                        $libfiles=0;
                        $booleans=0;
                }
		elsif ($1 eq "-b") {
                        $outputloc=0;
                        $libfiles=0;
                        $booleans=1;
                }
		elsif ($1=~m/=/ eq "1") {
			$therearevars="Yes";
			@vararraytemp=split('&',$1);
			foreach $2 (@vararraytemp) {
				@vararraytemp2=split('=',$2);
				$varhash{$vararraytemp2[0]}=$vararraytemp2[1];
			}
		}
		elsif ($outputloc eq 1) {
                     $outputroot=$1;
                     $outputoverride="yes";
                  }
                elsif ($booleans eq 1) {
                        push @booleanlist,$1;
                }
                else {
			$dotcheck=substr $1,-4,1;
			if (length $1<4 or $dotcheck ne ".") { 		
				$1=join('',$1,$suffix);
			}
                        if ($libfiles eq 0 & $booleans eq 0) {
				push @filelist,$1;
				$aretherefiles=1;
			}
			else {
				push @librarylist,$1;
			}
		}
					
	}

	if ($aretherefiles eq "0") {
		get_files()
	}


}


#####################################################
sub get_files {
	unless (open (infile, lc $sslfiles)) {
		die "FATAL ERROR (no input files have been specified and SSL cannot find file list)";
	}
	@temparray=<infile>;
	close(infile);
	foreach $1 (@temparray) {
		chomp $1;
		$dotcheck=substr $1,-4,1;
		if (length $1<4 or $dotcheck ne ".") { 		
			$1=join('',$1,".ssl");
		}	
		push @filelist,$1;
	}
}

#####################################################
sub read_library {

# push @librarylist, $defaultlibraryfile,$autolibfile;

foreach $1 (@librarylist) {
	$libraryfile=$1;
	$libraryfile=~s/\\/\//g;
	unless (open (infile, lc $libraryfile)) {
		if ($libraryfile eq $defaultlibraryfile) {
			print "NOTE: Cannot find the default library file\n"
		}
		elsif ($libraryfile eq $autolibfile) {
			print "NOTE: Cannot find the auto-generated library file\n"
		}
		else {
			die "FATAL ERROR (Cannot find library file $libraryfile)";
		}
	}
	@library=<infile>;
	close(infile);
	foreach $1 (@library) {
		chomp $1;
		$scsline=$1;
		strip_spaces();
		$checktarget=substr $1,0,6;
		$checktrigger=substr $1,0,7;
		$checktargetreplace=substr $1,0,14;
		$checktriggerreplace=substr $1,0,15;
		if ($checktargetreplace eq 'TARGET_REPLACE') {
			$keyname=substr $scsline,15;
			$targetlist{$keyname}=1;
			$libtype="target";
			@{ $targethash{$keyname} } = ();
		}
		elsif ($checktriggerreplace eq 'TRIGGER_REPLACE') {
			$keyname=substr $scsline,16;
			$triggerlist{$keyname}=1;
			$libtype="trigger";
			@{ $triggerhash{$keyname} } = ();
		}
		elsif ($checktarget eq 'TARGET') {
			$keyname=substr $scsline,7;
			$targetlist{$keyname}=1;
			$libtype="target";
		}
		elsif ($checktrigger eq 'TRIGGER') {
			$keyname=substr $scsline,8;
			$triggerlist{$keyname}=1;
			$libtype="trigger";
		}
		elsif ($libtype eq "target") {
			push @{ $targethash{$keyname} },$scsline;
		}
		elsif ($libtype eq "trigger") {
			push @{ $triggerhash{$keyname} },$scsline;
		}
	}
}
}
############################################################
sub read_input {
	unless (open (infile, lc $inputfile)) {
		die "cannot find input file";
	}
	@scsarray=<infile>;
	foreach (@scsarray) {
		chomp;
	}
	close (infile);
}
################################################################
sub work_out_outputfile {

	substr $outputfile,-4,4,".baf";
	if ($outputroot ne "") {
                #$outputroot="ssl_out";
		if ($outputfile=~m/\\/ eq "1") { ### delimited by \
			@outputarray=split(/\\/,$outputfile);
		} 
		elsif ($outputfile=~m/\// eq "1") { ### delimited by /
			@outputarray=split(/\//,$outputfile);
		} 
		if ($outputfile=~m/\\/ eq "1" or $outputfile=~m/\// eq "1") {
			$outputarraylength=scalar @outputarray;
			$outputres=$outputarray[$outputarraylength-1];
			$outputarray[$outputarraylength-1]=$outputroot;
			if ($outputoverride eq "no") {
			   $outputdir=join("\/",@outputarray);
                        }
                        else {
                         $outputdir=$outputroot;
                        }
			$outputfile=join("\/",$outputdir,$outputres);
			if (-e $outputdir ne "1") {
				print "$outputdir \n";
				system "mkdir $outputdir";
			}	
		}
	}


}
############################################################
sub write_output {


	unless (open(outfile, ">$outputfile")) {
		die "FATAL ERROR: SSL cannot open the output file $outputfile";
	}	
	foreach $1 (@output) {
		print outfile "$1\n";
	}
	close(outfile);
}

############################################################

sub strip_spaces {
	@temparray=split ("//",$scsline);
	$scsline=$temparray[0];
	@temparray=split(' ',$scsline);
	$scsline=join(' ',@temparray);
}


##############################################################

sub extract_from_brackets {

        $firstbracket=1+index $scsline,"(";
	$lastbracket=rindex $scsline,")";
	$size=$lastbracket-$firstbracket;
	$scsline=substr $scsline, $firstbracket,$size;

}

##############################################################

sub check_ssl_booleans {

        $abort_print=0;
        @temp=();
        foreach $b_line (@output_trial) {
            if ($abort_print eq 1) {}
            elsif ($b_line=~m/!SSLBoolean/ eq "1") {
                  $f_b=1 + index $b_line,"(";
                  $l_b=rindex $b_line,")";
                  $sz=$l_b-$f_b;
                  $b_line = substr $b_line, $f_b, $sz;
	          @bool_list=split('\|',$b_line);
                  foreach $var (@bool_list) {
                    foreach $possible (@booleanlist) {
                       if ($var eq $possible) {
                        $abort_print=1;
                       }
                    }
                  }
            }
            elsif ($b_line=~m/SSLBoolean/ eq "1") {
                  $abort_print = 1;
                  $f_b=1 + index $b_line,"(";
                  $l_b=rindex $b_line,")";
                  $sz=$l_b-$f_b;
                  $b_line = substr $b_line, $f_b, $sz;
	          @bool_list=split('\|',$b_line);
                  foreach $var (@bool_list) {
                    foreach $possible (@booleanlist) {
                       if ($var eq $possible) {
                        $abort_print=0;
                       }
                    }
                  }
            }
            else {
              push @temp,$b_line;
            }
        }
        @output_trial = @temp;
}

###############################################################

sub extract_targets {

	$arg1=@_[0];

	@targetsubarray=();
	@temparray=split('\*',$arg1);
	@targetexclude=split('&',$temparray[1]);
	@targetconsider=split('&',$temparray[0]);
	foreach $8 (@targetconsider) {
		$label=0;
		if ($targethash{$8}[0] eq "") {
			die "Unrecognised TargetBlock ($8) near line $linenum";
		}
		while ($targethash{$8}[$label] ne "") {
			$inexclude=0;
			foreach $7 (@targetexclude) {
				if ($7 eq $targethash{$8}[$label]) {
					$inexclude=1;
				}
			}
			if ($inexclude eq 0) {
				push @targetsubarray,$targethash{$8}[$label];
			}
			$label=$label+1;
		}
	}
}

###############################################################

sub process_line {
	if ($location eq "none") {
		if ($scsline=~m/DEFAULT TRIGGER/ eq "1") {
			extract_from_brackets();
			if ($scsline eq "") {
				@defaulttrigger=()
			}
			else {
				@defaulttrigger=split('&',$scsline)
			}
		}
		elsif ($scsline eq "BEGIN_ACTION_DEFINITION") {
			$location="actiondefinename";
		}
		elsif ($scsline eq "IF TRIGGER") {
			@trigger=();
			@target=();
			@targetcondition=();
			$triggerindex="0";
			$inloop="No";
			@looplist=();
			$location="trigger";
			$combine="";
			$combinetype="";
			$ignorethisblock="No";
			@outputhere=();
		}
		elsif ($scsline eq "IF") {
			$location="bafblock";
			$baflocation="triggers";
			@bafactionarray=();	
			$ignorethisblock="No";
			@bafblock=();
			push @bafblock,$scsline;
		}
		elsif ($scsline eq "END") {
			die "Unexpected END [1] at line $linenum";
		}
		elsif ($scsline eq "THEN DO") {
			die "1: Unexpected THEN DO at line $linenum";
		}
		elsif ($scsline=~m/VARIABLE/ eq "1") {
		}
		elsif ($scsline ne "") {
			push @output, $scsline;
		}
	return;
	}
	elsif ($location eq "actiondefinename") {

		if ($scsline=~m/Name/ eq "1") {
			extract_from_brackets();
			$definename=$scsline;
			$definenamehash{$definename}=1;
			@{ $defineaction{$definename}}=();
			@{ $definetrigger{$definename}}=();				
		}
		elsif ($scsline=~m/RANDOMIZE/ eq "1") {
			extract_from_brackets();
			$randomaction{$definename}=$scsline;
		}
		elsif ($scsline eq "TRIGGER") {
			$location="actiondefinetrigger";
		}
		else {
			die "Syntax error in action_define block near line $linenum";
		}
	}
	elsif ($location eq "actiondefinetrigger") {
		strip_spaces();
		if ($scsline eq "ACTION") {
			$location="actiondefineaction";
		}
		elsif ($scsline eq "") {
		}
		else {
			push @{ $definetrigger{$definename} },$scsline;
		}
	}
	elsif ($location eq "actiondefineaction") {
		strip_spaces();
		if ($scsline eq "END") {
			$location="none";
		}
		elsif ($scsline eq "") {
		}
		else {
			push @{ $defineaction{$definename} },$scsline;
		}
	}


	elsif ($location eq "trigger") {
		if ($scsline=~m/ConditionalTargetBlock/ eq "1") {
			extract_from_brackets();
			@condarray=split(';',$scsline);
			extract_targets($condarray[0]);
			push @target,@targetsubarray;
			foreach $x (@targetsubarray) {
				push @targetcondition,$condarray[1];
			}
		}
		elsif ($scsline=~m/TargetBlock/ eq "1") {
			extract_from_brackets();
			extract_targets($scsline);
			push @target,@targetsubarray;
			foreach $x (@targetsubarray) {
				push @targetcondition,"None";
			}
		}
		elsif ($scsline=~m/Target\(/ eq "1") {
			extract_from_brackets();
			@temparray=split('&',$scsline);
			push @target,@temparray;
		}
		elsif ($scsline=~m/TriggerBlock/ eq "1") {
			extract_from_brackets();
			@triggerlist=split('\|',$scsline);
			foreach $2 (@triggerlist) {
				$label=0;
				$triggerdefined="No";
				while($triggerhash{$2}[$label] ne "") {
					push @trigger,$triggerhash{$2}[$label];
					$label=$label+1;
					$triggerdefined="Yes";
				}
				if ($triggerdefined eq "No") {
					die "Unrecognised TriggerBlock: $2, near line $linenum";
				}
			}
		}
		elsif ($scsline=~m/Multiple/ eq "1") {
			extract_from_brackets;
			@temparray=split(';',$scsline);
			@multiplearray=split('&',$temparray[0]);
			extract_targets($temparray[1]);
			foreach $8 (@targetsubarray) {
				foreach $9 (@multiplearray) {
					$temp=$9;
					$temp=~s/scsmultiple/$8/g;
					push @trigger,$temp;
				}
			}	

		}
		elsif ($scsline=~m/IgnoreBlock/ eq "1") {
			extract_from_brackets;
			@temparray=split('\|',$scsline);
			foreach $8 (@temparray) {
				if ($8 eq "True") {
					$ignorethisblock="Yes";
				}
			}

		}
		elsif ($scsline=~m/RequireBlock/ eq "1") {
			extract_from_brackets;
			@temparray=split('\|',$scsline);
			$requirecheck="No";
			foreach $8 (@temparray) {
				if ($8 eq "True") {
					$requirecheck="Yes";
				}
			}
			if ($requirecheck eq "No") {
				$ignorethisblock="Yes";
			}

		}
		elsif ($scsline=~m/THEN DO/ eq "1") {
			$location="action";
			$combine="No";
			@action=();
			@alwaysaction=();
			@continueaction=();
		}
		elsif ($scsline eq "IF") {
			die "Unexpected IF at line $linenum";
		}
		elsif ($scsline eq "IF TRIGGER") {
			die "Unexpected IF TRIGGER at line $linenum";
		}
		elsif ($scsline eq "THEN") {
			die "2: Unexpected THEN DO at line $linenum";
		}
		elsif ($scsline eq "END") {
			die "Unexpected END [2] at line $linenum";
		}
		else {
			push @trigger, $scsline;
		}
	return;
	}

	elsif ($location eq "action") {
		strip_spaces();
		if ($scsline=~m/ActionCondition\(/ eq "1") {
			extract_from_brackets();
			push @action, $scsline;
		}
		elsif ($scsline=~m/Action\(/ eq "1") {
			extract_from_brackets;
			push @action, $scsline;
		}
		elsif ($scsline=~m/Combine\(/ eq "1") {
			$combine="Yes";
			extract_from_brackets;
			$combinetype=$scsline;
		}
		elsif ($scsline=~m/OnContinue\(/ eq "1") {
			extract_from_brackets;
			push @continueaction, $scsline;
		}
		elsif ($scsline eq "END") {
			$location="none";
			process_block();
		}
		elsif ($scsline eq "IF") {
			die "Unexpected IF at line $linenum";
		}
		elsif ($scsline eq "IF TRIGGER") {
			die "Unexpected IF TRIGGER at line $linenum";
		}
		elsif ($scsline eq "THEN") {
			die "Unexpected THEN at line $linenum";
		}
		elsif ($scsline eq "THEN DO") {
			die "3: Unexpected THEN DO at line $linenum";
		}
		else {
			push @alwaysaction, $scsline;
		}
		return;
	}
	elsif ($location="bafblock") {
		strip_spaces();
		if ($scsline eq "END") {
			$location="none";
			if ($ignorethisresponse eq "No") {
				push @bafblock,@bafactionarray;
			}
			push @bafblock,$scsline;

			if ($ignorethisblock eq "No") {
                              @output_trial = @bafblock;
                              check_ssl_booleans;
                              if ($abort_print eq 0) {
				push @output, @output_trial;
				push @output, "";
			                           }
			}
		}
		elsif ($scsline=~m/RESPONSE/ eq "1") {
			$baflocation="responses";
			if ($ignorethisresponse eq "No") {
				push @bafblock,@bafactionarray;
			}
			@bafactionarray=();
			push @bafactionarray,$scsline;
			$ignorethisresponse = "No";

		}
		elsif ($scsline=~m/IgnoreBlock/ eq "1") {
			extract_from_brackets;
			@temparray=split('\|',$scsline);
			foreach $8 (@temparray) {
				if ($8 eq "True") {
					if ($baflocation eq "responses") {
						$ignorethisresponse="Yes";
					} else {
						$ignorethisblock="Yes";
					}
				}
			}

		}
		elsif ($scsline=~m/RequireBlock/ eq "1") {
			extract_from_brackets;
			@temparray=split('\|',$scsline);
			$requirecheck="No";
			foreach $8 (@temparray) {
				if ($8 eq "True") {
					$requirecheck="Yes";
				}
			}
			if ($requirecheck eq "No") {
					if ($baflocation eq "responses") {
						$ignorethisresponse="Yes";
					} else {
						$ignorethisblock="Yes";
					}
			}

		}
		else {
			if ($baflocation eq "responses") {
				push @bafactionarray,$scsline;
			} else {
				push @bafblock,$scsline;
			}
		}
		return;
	}
}

##############################################################################
sub streamline_trigger {

	my %sthash=();
	my @starray=();
	foreach $st (@trigger) {
		if ($ornumber>0) {
			$ornumber=$ornumber-1;
			push @starray,$st;
		}
		elsif ($st=~m/OR\(/ eq "1") {
			$firstbracket=1+index $st,"(";
			$lastbracket=rindex $st,")";
			$size=$lastbracket-$firstbracket;
			$ornumber=substr $st, $firstbracket,$size;
			push @starray,$st;
		}
		elsif ($sthash{$st} ne "Yes") {
			push @starray,$st;
			$sthash{$st}="Yes";
		}
		
	}

	@trigger=@starray;

}

##############################################################################
sub get_combine_top {
	%combinehash=();
	$firsttimethrough="Yes";
	foreach $forcombine (@action) {
		@temp=split('\|',$forcombine);
		@actionargs=split(',',$temp[0]);
		if ($definenamehash{$actionargs[0]} eq "1") {
			@temptriggertop=@{ $definetrigger{$actionargs[0]} };
			$statelabel=0;
			foreach $replace (@actionargs) {
				$replacelabel=join ('',"scsargument",$statelabel);
				$triggerlabel=0;
				foreach (@temptriggertop) {	
					$temptriggertop[$triggerlabel]=~s/$replacelabel/$actionargs[$statelabel]/g;
					$triggerlabel=$triggerlabel+1;
				}
			$statelabel=$statelabel+1;
			}
		}
		elsif ($actionargs[0] eq "Literal") {
			@temptriggertop=();
			if ($actionargs[2] ne "") {
				@temparray=split('&',$actionargs[2]);
				foreach $11 (@temparray) {
					$temp=$11;
					$temp=~s/\\/,/g;
					push @temptriggertop,$temp;
				}
			}
		}
		elsif ($actionargs[0] eq "LiteralRandomTarget" or $actionargs[0] eq "SpellReplaceRandom") {
			die "Error near line $linenum: $actionargs[0] is not valid at present in Combine() ";
		}
		else {
			die "Error near line $linenum: $actionargs[0] is not a recognised action type";
		}

		%temphash=();
		foreach $forcombine2 (@temptriggertop) {
			$temphash{$forcombine2}="1";
		}
		if ($firsttimethrough eq "Yes") {
			%combinehash=%temphash;
			@combinearray=@temptriggertop;
			$firsttimethrough="No";
		}
		else {
			@keys=keys %combinehash;
			foreach $forcombine2 (@keys) {
				if ($temphash{$forcombine2} eq "1") {
					$combinehash{$forcombine2}=1;
				}
				else {
					$combinehash{$forcombine2}=0;
				}
			}
		}
	}
}
###########################################################################
sub process_block {

	if ($ignorethisblock eq "Yes") {
		return;
	}
        $actionsexist=0;
	streamline_trigger();
	if ($combine eq "Yes") {
		get_combine_top();
		@triggertop=();
		foreach $processlabel (@combinearray) {
			if ($combinehash{$processlabel} eq "1") {
				push @triggertop,$processlabel;
			}
		}
		@actiontop="RESPONSE #100\n Continue()";
		@target=reverse @target;
		@targetcondition=reverse @targetcondition;
		$condition="";
		block_print();
		$combine ="No";
		@target=('LastSeenBy(Myself)');
		push @trigger, "See(LastSeenBy(Myself))";
		@targetcondition=();
	}
	if (scalar @action eq 0) {
		push @action,"Literal";
	}
	foreach $2 (@action) {
		@actionsplit=();
		@actionsplit=split('\|',$2);
		if ($actionsplit[1] ne "") {
			$prob1=$actionsplit[1];
			$prob2=$actionsplit[2];
		}
		else {
			$prob1=100;
			$prob2=0;
		}
		@actionsplit=split(';',$actionsplit[0]);
		if ($actionsplit[1] ne "") {
			@temparray=split('&',@actionsplit[1]);
			$condition=join("\n",@temparray);
		}
		else {
			$condition="";
		}
	@actionargs=split (',',$actionsplit[0]);
	make_action();

	if ($abort_print eq "0") {
	     block_print();
	     if ($abort_print eq "0") {
	         $actionsexist=1;
	     }
	  }
	}
	if ($actionsexist eq 1) {
              push @output, @outputhere;
          }
}
############################################################################
sub make_action {

	@triggertop=();
	@actiontop=();
	@randomreplace=();
	$abort_print=0;

	if ($definenamehash{$actionargs[0]} eq "1") {
		@triggertop=@{ $definetrigger{$actionargs[0]} };
		check_ssl_booleans();
		@actiontop=@{ $defineaction{$actionargs[0]} };
		check_ssl_booleans();
		$statelabel=0;
		if ($randomaction{$actionargs[0]} ne "") {	
			$replacelabel=join ('',"scsargument",$randomaction{$actionargs[0]});
			@randomreplace=@actionargs;
			splice (@randomreplace,0,$randomaction{$actionargs[0]}-1);
			@tempactiontop=@actiontop;
			@actiontop=();
			$actionlabel=0;
			foreach $replace (@randomreplace) {
				foreach $tempstring (@tempactiontop) {
					$actiontop[$actionlabel]=$tempstring;
					$actiontop[$actionlabel]=~s/$replacelabel/$replace/g;
					$actionlabel=$actionlabel+1;
				} 
			}
		}
		foreach $replace (@actionargs) {
			$replacelabel=join ('',"scsargument",$statelabel);
			$triggerlabel=0;
			foreach (@triggertop) {
				$triggertop[$triggerlabel]=~s/$replacelabel/$actionargs[$statelabel]/g;
				$triggerlabel=$triggerlabel+1;
			}
			$actionlabel=0;
			foreach (@actiontop) {
				$actiontop[$actionlabel]=~s/$replacelabel/$actionargs[$statelabel]/g;
                                $actionlabel=$actionlabel+1;
			}
			$statelabel=$statelabel+1;
		}
		$replacelabel="scsprob1";
		$actionlabel=0;
		foreach (@actiontop) {
			$actiontop[$actionlabel]=~s/$replacelabel/$prob1/g;
			$actionlabel=$actionlabel+1;
		}
		push @actiontop, @alwaysaction;
	}

	elsif ($actionargs[0] eq "SpellReplaceRandom") {
		$triggertop[0]="!GlobalTimerNotExpired(\"castspell\",\"LOCALS\")";
		$triggertop[1]="HaveSpell($actionargs[1])";
		$label="2";
		$labelB="0";
		while($actionargs[$label] ne "") {
			$actiontop[$labelB]="RESPONSE #$prob1";
			$labelB=$labelB+1;
			$actiontop[$labelB]="SetGlobalTimer(\"castspell\",\"LOCALS\",6)";
			$labelB=$labelB+1;
			$actiontop[$labelB]="RemoveSpell($actionargs[1])";
			$labelB=$labelB+1;
			$actiontop[$labelB]="SpellNoDec(scstarget,$actionargs[$label])";
			push @actiontop, @alwaysaction;
			$labelB=#$actiontop;
			$labelB=$labelB+1;
			$label=$label+1;
		}
	}

	elsif ($actionargs[0] eq "Literal") {
		$actiontop[0]="RESPONSE #$prob1";
		@temparray=split('&',$actionargs[1]);
		foreach $11 (@temparray) {
			$temp=$11;
			$temp=~s/\\/,/g;
			push @actiontop,$temp;
		}
		push @actiontop, @alwaysaction;
		if ($actionargs[2] ne "") {
			@temparray=split('&',$actionargs[2]);
			foreach $11 (@temparray) {
				$temp=$11;
				$temp=~s/\\/,/g;
				push @triggertop,$temp;
			}
		}
	}	
	elsif ($actionargs[0] eq "LiteralRandomTarget") {
		@literalactionarray=();
		@temparray=split('&',$actionargs[1]);
		foreach $11 (@temparray) {
			$temp=$11;
			$temp=~s/\\/,/g;
			push @literalactionarray,$temp;
		}
		if ($actionargs[2] ne "") {
			@temparray=split('&',$actionargs[2]);
		}
		else {
			@temparray=();
		}
		foreach $11 (@temparray) {
			$temp=$11;
			$temp=~s/\\/,/g;
			push @literalconditionarray,$temp;
		}

		$label=0;
		extract_targets($actionargs[3]);
		foreach $8 (@targetsubarray) {
			push @actiontop,"RESPONSE #$prob1";
			foreach $9 (@literalactionarray) {
				$temp=$9;
				$temp=~s/scsrandom/$8/g;
				push @actiontop,$temp;
			}
			push @actiontop,@alwaysaction;
			
		}
		push @triggertop,@literalconditionarray;
	}
	
	else {
		die "unrecognised Action : $actionargs[0], near line $linenum";
	}	
	if ($prob2 ne "0") {
		push @actiontop, "RESPONSE #$prob2";
		push @actiontop, @continueaction;
		push @actiontop, "Continue()";
	}
}

###########################################################################################
sub sub_target {

	$arg1=@_[0];
	$arg2=@_[1];
	$arg1=~s/scstarget/$arg2/g;
	$statelabel=1;
	foreach $replace (@actionargs) {
			$replacelabel=join ('',"scsargument",$statelabel);   
                        $arg1=~s/scsargument1/$actionargs[$statelabel]/g;
			$statelabel=$statelabel+1;
	}
	return $arg1;
}
###########################################################################################
sub block_print {

	if (@target[0] eq "") {
		push @target, "NODEFINEDTARGET";
	}
	$conditioncounter=0;
	foreach $3 (@target) {
                @output_trial=();
		push @output_trial, "IF";
		push @output_trial, @defaulttrigger;
		foreach $4 (@triggertop) {
			push @output_trial, sub_target($4,$3);
		}
		if ($combine ne "Yes" and $3 ne "LastSeenBy(Myself)" and $3 ne "NODEFINEDTARGET") {
			push @output_trial, "See($3)";
		}
		if ($condition ne "") {
			push @output_trial, sub_target($condition,$3);
		}
		foreach $4 (@trigger) {
			push @output_trial, sub_target($4,$3);
		}
		if ($targetcondition[$conditioncounter] ne "None" and $targetcondition[$conditioncounter] ne "") {
			@condarray=split('&',$targetcondition[$conditioncounter]);
			foreach $4 (@condarray) {
				push @output_trial, sub_target($4,$3);
			}
		}
		if ($combine eq "Yes") {
			push @output_trial, "See($3)";
			push @output_trial, "False()";
		}
		push @output_trial, "THEN";
		foreach $4 (@actiontop) { 
			push @output_trial, sub_target($4,$3);
		}
		push @output_trial, "END";
		push @output_trial, "";
		$conditioncounter=$conditioncounter+1;
		check_ssl_booleans;
		if ($abort_print eq "0") {
		    push @outputhere,@output_trial;
		}
		
	}
}

####################################################################

sub process_include_blocks {

	$linenum=0;
	while ($linenum < scalar @scsarray) {
		$scsline=$scsarray[$linenum];
		strip_spaces();
		if ($scsline=~m/INCLUDE FILE/ eq "1") {
			if ($therearevars=="Yes") {
				foreach $1 (keys %varhash) {
					$old=$1;
					$new=$varhash{$old};
					$scsline=~s/$old/$new/;
				}
			}

			extract_from_brackets;
			$scsline=~s/\\/\//g;
			unless (open (infile, lc $scsline)) {
				die "FATAL ERROR (SSL cannot find file requested [$scsline] at line $linenum)";
			}
			@temparray=<infile>;
			close(infile);
			splice(@scsarray,$linenum,1,@temparray);
		}
		else {
			$linenum=$linenum+1;
		}

	}
}

###################################################################



sub work_out_outer_loops {

	$linenum=0;
	$loopdepth=0;
	while ($linenum < scalar @scsarray) {
		$scsline=$scsarray[$linenum];
		if ($therearevars=="Yes") {
			foreach $1 (keys %varhash) {
				$old=$1;
				$new=$varhash{$old};
				$scsline=~s/$old/$new/;
				$scsarray[$linenum]=$scsline;
			}
		}
		if ($scsline=~m/BEGIN OUTER LOOP/ eq "1" and $loopdepth eq 0) {
			extract_from_brackets;
			@temparray1=split('\|\|',$scsline);
			$loopvariable=$temparray1[0];
			@loopvaluearray=split(';',$temparray1[1]);
			@loopdata=();
			$loopdepth=$loopdepth+1;
			$loopstartnum=$linenum;
			$linenum=$linenum+1;
		}
		elsif ($scsline=~m/END OUTER LOOP/ eq "1" and $loopdepth eq 1) {
			$loopdepth=0;
			$looplength=$linenum+1-$loopstartnum;
			@templooparray=();
			foreach $10 (@loopvaluearray) {
				@temparray0=split('&',$10);
				foreach $11 (@loopdata) {
					if ($11=~m/$loopvariable/ eq "1") {
						foreach $12 (@temparray0) {
							$loopline=$11;
							$loopline=~s/$loopvariable/$12/;
							push @templooparray,$loopline;
						}
					}
					else {
						push @templooparray,$11;
					}
				}
			}
			splice (@scsarray,$loopstartnum,$looplength,@templooparray);
			$linenum=$loopstartnum;
		}
		elsif ($scsline=~m/BEGIN OUTER LOOP/ eq "1" and $loopdepth ne 0) {
			$linenum=$linenum+1;
			push @loopdata,$scsline;
			$loopdepth=$loopdepth+1;
		}
		elsif ($scsline=~m/END OUTER LOOP/ eq "1" and $loopdepth ne 1) {
			$linenum=$linenum+1;
			push @loopdata,$scsline;
			$loopdepth=$loopdepth-1;
		}
		elsif ($loopdepth ne 0) {
			$linenum=$linenum+1;
			push @loopdata,$scsline;
		}
		else {
			if ($scsline=~m/VARIABLE/ eq "1") {
				strip_spaces();	
				extract_from_brackets();
				$therearevars="Yes";
				@vararraytemp=split('&',$scsline);
				foreach $2 (@vararraytemp) {
					@vararraytemp2=split('=',$2);
					$varhash{$vararraytemp2[0]}=$vararraytemp2[1];
				}
			
			}
			$linenum=$linenum+1;
		}
	}
	if ($loopdepth ne 0) {
		die "SYNTAX ERROR: unclosed outer loops"
	}

}


###################################################################

print "This is Stratagems Scripting Language...\n";
# $userinput=shift;
@instructions = @ARGV;
process_user_input;
read_library();
foreach (@filelist) {
	$location="none";
	@scsarray=();
	@trigger=();
	@action=();
	@output=();
	$combine="";
	$inputfile=$_;

	$outputfile=$_;
	work_out_outputfile();


	$inputfile=~s/\\/\//g;
	print "\n \n Input file is $inputfile \n";
	read_input();


	work_out_outer_loops();
	process_include_blocks();

	$linenum=0;
	$loopdepth=0;
	while ($linenum < scalar @scsarray) {
		$scsline=$scsarray[$linenum];
		if ($therearevars=="Yes") {
			foreach $1 (keys %varhash) {
				$old=$1;
				$new=$varhash{$old};
				$scsline=~s/$old/$new/;
			}
		}
		strip_spaces();
		if ($scsline=~m/BEGIN LOOP/ eq "1" and $loopdepth eq 0) {
			extract_from_brackets;
			@temparray1=split('\|\|',$scsline);
			$loopvariable=$temparray1[0];
			@loopvaluearray=split(';',$temparray1[1]);
			@loopdata=();
			$loopdepth=$loopdepth+1;
			$loopstartnum=$linenum;
			$linenum=$linenum+1;
		}
		elsif ($scsline=~m/END LOOP/ eq "1" and $loopdepth eq 1) {
			$loopdepth=0;
			$looplength=$linenum+1-$loopstartnum;
			@templooparray=();
			foreach $10 (@loopvaluearray) {
				@temparray0=split('&',$10);
				foreach $11 (@loopdata) {
					if ($11=~m/$loopvariable/ eq "1") {
						foreach $12 (@temparray0) {
							$loopline=$11;
							$loopline=~s/$loopvariable/$12/;
							push @templooparray,$loopline;
						}
					}
					else {
						push @templooparray,$11;
					}
				}
			}
			splice (@scsarray,$loopstartnum,$looplength,@templooparray);
			$linenum=$loopstartnum;
		}
		elsif ($scsline=~m/BEGIN LOOP/ eq "1" and $loopdepth ne 0) {
			$linenum=$linenum+1;
			push @loopdata,$scsline;
			$loopdepth=$loopdepth+1;
		}
		elsif ($scsline=~m/END LOOP/ eq "1" and $loopdepth ne 1) {
			$linenum=$linenum+1;
			push @loopdata,$scsline;
			$loopdepth=$loopdepth-1;
		}
		elsif ($scsline=~m/INCLUDE FILE/ eq "1" and $loopdepth ne 0) {
			extract_from_brackets;
			die "waargh, we shouldn't be here (1)";
			unless (open (infile, lc $scsline)) {
				die "FATAL ERROR (SSL cannot find file requested [$scsline] at line $linenum)";
			}
			@temparray=<infile>;
			close(infile);
			push @loopdata,@temparray;
			$linenum=$linenum+1;
		}
		elsif ($loopdepth ne 0) {
			$linenum=$linenum+1;
			push @loopdata,$scsline;
		}
		elsif ($scsline eq "IF") {
			$linenum=$linenum+1;
			splice (@scsarray,$linenum,0,@defaulttrigger);
			process_line;
		}
		elsif ($scsline=~m/INCLUDE FILE/ eq "1") {
			extract_from_brackets;
			die "waargh, we shouldn't be here (2)";
			print "attempting to open file $scsline ...";
			unless (open (infile, lc $scsline)) {
				die "FATAL ERROR (SSL cannot find file requested [$scsline] at line $linenum)";
			}
			print "successful!\n";
			@temparray=<infile>;
			close(infile);
			splice(@scsarray,$linenum,1,@temparray);
		}
		else {
			$linenum=$linenum+1;
			process_line;
		}
	}
	$outputexists="No";
	if ($loopdepth ne 0) {
		die "SYNTAX ERROR: unclosed loops"
	}
	foreach $outputcheck (@output) {
		chomp $outputcheck;
		if ($outputcheck ne "") {
			$outputexists="Yes"
		}
	}
	if ($outputexists eq "Yes") {
		print "\n Output file is $outputfile \n";
		write_output();	
	}
	else {
		print "\n No output file for this input file ";
	}
}
