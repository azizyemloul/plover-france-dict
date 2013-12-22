#!/usr/bin/awk -f
#brute();
#verbes();
#noms();
#adjectifs();
## * BEGIN
#BEGIN{FS="\t";OFS="\t"}
#BEGIN{FS="\t";}

BEGIN{
    FS="\t";
    # ### Les contractions CV1/CV2 = CCV2 quand V2 = V1 pour les mots de	       > 2 syll

    arr["sa"] = gensub(/(S)A\/([PMTFNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["se"] = gensub(/(S)E\/([PMTFNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["si"] = gensub(/(S)I\/([PMTFNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["so"] = gensub(/(S)O\/([PMTFNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["su"] = gensub(/(S)U\/([PMTFNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["ka"] = gensub(/(K)A\/([PMTFNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["ke"] = gensub(/(K)E\/([PMTFNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["ki"] = gensub(/(K)I\/([PMTFNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["ko"] = gensub(/(K)O\/([PMTFNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["ku"] = gensub(/(K)U\/([PMTFNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["pa"] = gensub(/(P)A\/([MTFNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["pe"] = gensub(/(P)E\/([MTFNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["pi"] = gensub(/(P)I\/([MTFNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["po"] = gensub(/(P)O\/([MTFNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["pu"] = gensub(/(P)U\/([MTFNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["ma"] = gensub(/(M)A\/([TFNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["me"] = gensub(/(M)E\/([TFNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["mi"] = gensub(/(M)I\/([TFNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["mo"] = gensub(/(M)O\/([TFNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["mu"] = gensub(/(M)U\/([TFNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["ta"] = gensub(/(T)A\/([FNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["te"] = gensub(/(T)E\/([FNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["ti"] = gensub(/(T)I\/([FNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["to"] = gensub(/(T)O\/([FNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["tu"] = gensub(/(T)U\/([FNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["ra"] = gensub(/(R)A\/([NL])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["re"] = gensub(/(R)E\/([NL])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["ri"] = gensub(/(R)I\/([NL])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["ro"] = gensub(/(R)O\/([NL])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["ru"] = gensub(/(R)U\/([NL])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["na"] = gensub(/(N)A\/(L)A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["ne"] = gensub(/(N)E\/(L)E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["ni"] = gensub(/(N)I\/(L)I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["no"] = gensub(/(N)O\/(L)O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["nu"] = gensub(/(N)U\/(L)U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["fa"] = gensub(/(F)A\/(N)A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["fe"] = gensub(/(F)E\/(N)E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["fi"] = gensub(/(F)I\/(N)I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["fo"] = gensub(/(F)O\/(N)O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["fu"] = gensub(/(F)U\/(N)U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["va"] = gensub(/(F\*)A\/([LR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["ve"] = gensub(/(F\*)E\/([LR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["vi"] = gensub(/(F\*)I\/([LR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["vo"] = gensub(/(F\*)O\/([LR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["vu"] = gensub(/(F\*)U\/([LR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["vae"] = gensub(/(F)\*A\/(N)A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["vee"] = gensub(/(F)\*E\/(N)E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["vie"] = gensub(/(F)\*I\/(N)I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["voe"] = gensub(/(F)\*O\/(N)O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["vue"] = gensub(/(F)\*U\/(N)U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["ba"]  = gensub(/(P\*)A\/([LR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["be"]  = gensub(/(P\*)E\/([LR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["bi"]  = gensub(/(P\*)I\/([LR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["bo"]  = gensub(/(P\*)O\/([LR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["bu"]  = gensub(/(P\*)U\/([LR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["bae"]  = gensub(/(P)\*A\/([FN])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["bee"]  = gensub(/(P)\*E\/([FN])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["bie"]  = gensub(/(P)\*I\/([FN])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["boe"]  = gensub(/(P)\*O\/([FN])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["bue"]  = gensub(/(P)\*U\/([FN])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["da"]  = gensub(/(T\*)A\/([LR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["de"]  = gensub(/(T\*)E\/([LR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["di"]  = gensub(/(T\*)I\/([LR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["doo"] = gensub(/(T\*)O\/([LR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["du"]  = gensub(/(T\*)U\/([LR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

    arr["dae"]  = gensub(/(T)\*A\/([FN])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
    arr["dee"]  = gensub(/(T)\*E\/([FN])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
    arr["die"]  = gensub(/(T)\*I\/([FN])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
    arr["dooe"] = gensub(/(T)\*O\/([FN])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
    arr["due"]  = gensub(/(T)\*U\/([FN])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

}
adjectifs();
## * BRUTE()
# function brute(){
# 	print "\"" $2 "\": \"" $1 "\",";}
# function brute(){
#     gsub(/-/, "/", $2);
#     print $0;}

## * VERBES()
function verbes(){
    if ($3 ~ /VER/){
## ** Infinitif
	if ($6 ~ /^inf;$/){
	    if ($1 ~/^[aeiouéàâêïîô]/){
		print "\"" $2 "\": \"" $1 "\",";
		print "\"T*" $2 "\": \"d'" $1 "\",";
		# print "\"A/FIn/T*" $2 "\": \"afin d'" $1 "\",";
		# print "\"A/F*An/T*" $2 "\": \"avant d'" $1 "\",";
		print "\"L" $2 "\": \"l'" $1 "\",";
		print "\"N" $2 "\": \"n'" $1 "\",";
		print "\"S" $2 "\": \"s'" $1 "\",";
		print "\"M" $2 "\": \"m'" $1 "\",";
		print "\"T" $2 "\": \"t'" $1 "\",";

		print "\"KL" $2 "\": \"que l'" $1 "\",";
		print "\"T*L" $2 "\": \"de l'" $1 "\",";
		# print "\"T*LE/" $2 "\": \"de les " $1 "\",";
		# print "\"T*/LE/" $2 "\": \"de les " $1 "\",";
		print "\"NL" $2 "\": \"ne l'" $1 "\",";
		print "\"KT*" $2 "\": \"que d'" $1 "\",";
		print "\"TN" $2 "\": \"de n'" $1 "\",";
		print "\"KN" $2 "\": \"que n'" $1 "\",";
		print "\"KT" $2 "\": \"que t'" $1 "\",";
		print "\"KM" $2 "\": \"que m'" $1 "\",";
		print "\"A/" $2 "\": \"à " $1 "\",";

	    }

	    if ($1 ~/^[^aeiouéàâêïîô]/){
		print "\"" $2 "\": \"" $1 "\",";
		# print "\"T*/" $2 "\": \"de " $1 "\",";
		# print "\"A/FIn/T*/" $2 "\": \"afin de " $1 "\",";
		# print "\"A/F*An/T*/" $2 "\": \"avant de " $1 "\",";
		# print "\"L/" $2 "\": \"le " $1 "\",";
		# print "\"N/" $2 "\": \"ne " $1 "\",";
		# print "\"M/" $2 "\": \"me " $1 "\",";
		# print "\"T/" $2 "\": \"te " $1 "\",";

		# print "\"KL/" $2 "\": \"que le " $1 "\",";
		# print "\"T*L/" $2 "\": \"de le " $1 "\",";
		# print "\"T*LE/" $2 "\": \"de les " $1 "\",";
		# print "\"T*/LE/" $2 "\": \"de les " $1 "\",";
		# print "\"KT*/" $2 "\": \"que de " $1 "\",";
		# print "\"TN/" $2 "\": \"de ne " $1 "\",";
		# print "\"KN/" $2 "\": \"que ne " $1 "\",";
		# print "\"A/" $2 "\": \"à " $1 "\",";
		# print "\"S/" $2 "\": \"se " $1 "\",";
		# print "\"M/" $2 "\": \"me " $1 "\",";
		# print "\"T/" $2 "\": \"te " $1 "\",";

		if ($1 !~ /h/ && $2 ~/^[KPMTFRNL]/){
		    print "\"S" $2 "\": \"se " $1 "\",";
		}

		if ($1 !~ /h/ && $2 ~/^[TFRNL]/){
		    print "\"M" $2 "\": \"me " $1 "\",";
		}

		if ($1 !~ /h/ && $2 ~/^[FRNL]/){
		    print "\"T" $2 "\": \"te " $1 "\",";
		}

		if ($1 !~ /h/ && $2 ~/^[RL]/){
		    print "\"T*" $2 "\": \"de " $1 "\",";
		}
	    }

	    if ($1 ~/^[^h]/){
		print "\"" $2 "\": \"" $1 "\",";
	    }

	}
## ** Je
	if ($6 ~ /1s/){
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"Y" $2 "\": \"j'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Y/" $2 "\": \"je " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KY" $2 "\": \"que j'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KY/" $2 "\": \"que je " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKY" $2 "\": \"ce que j'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKY/" $2 "\": \"ce que je " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"Y/N" $2 "\": \"je n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Y/N/" $2 "\": \"je ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KY/N" $2 "\": \"que je n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KY/N/" $2 "\": \"que je ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKY/N" $2 "\": \"ce que je n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKY/N/" $2 "\": \"ce que je ne " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"Y/N" $2 "/PA\": \"je n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Y/N/" $2 "/PA\": \"je ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KY/N" $2 "/PA\": \"que je n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KY/N/" $2 "/PA\": \"que je ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKY/N" $2 "/PA\": \"ce que je n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKY/N/" $2 "/PA\": \"ce que je ne " $1 " pas\",";}
	}


## ** Tu
	if ($6 ~ /2s/){
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"TU/" $2 "\": \"tu " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîô]/){print "\"TU/" $2 "\": \"tu " $1 "\",";}

	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/TU\": \"" $1 "-tu\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/TU\": \"" $1 "-tu\",";}


	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"KTU/" $2 "\": \"que tu " $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KTU/" $2 "\": \"que tu " $1 "\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKTU/" $2 "\": \"ce que tu " $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKTU/" $2 "\": \"ce que tu " $1 "\",";}

	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"TU/N" $2 "\": \"tu n'" $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"TU/N/" $2 "\": \"tu ne " $1 "\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"KTU/N" $2 "\": \"que tu n'" $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KTU/N/" $2 "\": \"que tu ne " $1 "\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKTU/N" $2 "\": \"ce que tu n'" $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKTU/N/" $2 "\": \"ce que tu ne " $1 "\",";}

	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"TU/N" $2 "/PA\": \"tu n'" $1 " pas\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"TU/N/" $2 "/PA\": \"tu ne " $1 " pas\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"KTU/N" $2 "/PA\": \"que tu n'" $1 " pas\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KTU/N/" $2 "/PA\": \"que tu ne " $1 " pas\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKTU/N" $2 "/PA\": \"ce que tu n'" $1 " pas\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKTU/N/" $2 "/PA\": \"ce que tu ne " $1 " pas\",";}
	}
## ** Il, On, Ça
	if ($6 ~ /3s/){
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/" $2 "\": \"il " $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/" $2 "\": \"il " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/TIl\": \"" $1 "-t-il\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/TIl\": \"" $1 "-t-il\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/" $2 "\": \"qu'il " $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/" $2 "\": \"qu'il " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/" $2 "\": \"ce qu'il " $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/" $2 "\": \"ce qu'il " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/N" $2 "\": \"il n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/N/" $2 "\": \"il ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/N" $2 "\": \"qu'il n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/N/" $2 "\": \"qu'il ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/N" $2 "\": \"ce qu'il n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/N/" $2 "\": \"ce qu'il ne " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/N" $2 "/PA\": \"il n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/N/" $2 "/PA\": \"il ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/N" $2 "/PA\": \"qu'il n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/N/" $2 "/PA\": \"qu'il ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/N" $2 "/PA\": \"ce qu'il n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/N/" $2 "/PA\": \"ce qu'il ne " $1 " pas\",";}


	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"On/" $2 "\": \"on " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîô]/){print "\"On/" $2 "\": \"on " $1 "\",";}


	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/TOn\": \"" $1 "-t-on\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/TOn\": \"" $1 "-t-on\",";}


	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KOn/" $2 "\": \"qu'on " $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KOn/" $2 "\": \"qu'on " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKOn/" $2 "\": \"ce qu'on " $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKOn/" $2 "\": \"ce qu'on " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"On/N" $2 "\": \"on n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"On/N/" $2 "\": \"on ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KOn/N" $2 "\": \"qu'on n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KOn/N/" $2 "\": \"qu'on ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKOn/N" $2 "\": \"ce qu'on n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKOn/N/" $2 "\": \"ce qu'on ne " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"On/N" $2 "/PA\": \"on n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"On/N/" $2 "/PA\": \"on ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KOn/N" $2 "/PA\": \"qu'on n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KOn/N/" $2 "/PA\": \"qu'on ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKOn/N" $2 "/PA\": \"ce qu'on n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKOn/N/" $2 "/PA\": \"ce qu'on ne " $1 " pas\",";}


	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SA/" $2 "\": \"ça " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîô]/){print "\"SA/" $2 "\": \"ça " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"K/SA/" $2 "\": \"que ça " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîô]/){print "\"K/SA/" $2 "\": \"que ça " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SA/N" $2 "\": \"ça n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SA/N/" $2 "\": \"ça ne " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"K/SA/N" $2 "\": \"que ça n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"K/SA/N/" $2 "\": \"que ça ne " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SA/N" $2 "/PA\": \"ça n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SA/N/" $2 "/PA\": \"ça ne " $1 " pas\",";}


	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"K/SA/N" $2 "/PA\": \"que ça n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"K/SA/N/" $2 "/PA\": \"que ça ne " $1 " pas\",";}

	}
## ** Nous
	if ($6 ~ /1p/){
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"NOU/" $2 "\": \"nous " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîô]/){print "\"NOU/" $2 "\": \"nous " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/NOU\": \"" $1 "-nous\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/NOU\": \"" $1 "-nous\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KNOU/" $2 "\": \"que nous " $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KNOU/" $2 "\": \"que nous " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKNOU/" $2 "\": \"ce que nous " $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKNOU/" $2 "\": \"ce que nous " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"NOU/N" $2 "\": \"nous n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"NOU/N/" $2 "\": \"nous ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KNOU/N" $2 "\": \"que nous n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KNOU/N/" $2 "\": \"que nous ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKNOU/N" $2 "\": \"ce que nous n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKNOU/N/" $2 "\": \"ce que nous ne " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"NOU/N" $2 "/PA\": \"nous n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"NOU/N/" $2 "/PA\": \"nous ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KNOU/N" $2 "/PA\": \"que nous n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KNOU/N/" $2 "/PA\": \"que nous ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKNOU/N" $2 "/PA\": \"ce que nous n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKNOU/N/" $2 "/PA\": \"ce que nous ne " $1 " pas\",";}
	}
## ** Vous
	if ($6 ~ /2p/){

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"F*OU/" $2 "\": \"vous " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîô]/){print "\"F*OU/" $2 "\": \"vous " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/F*OU\": \"" $1 "-vous\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/F*OU\": \"" $1 "-vous\",";}


	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KF*OU/" $2 "\": \"que vous " $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KF*OU/" $2 "\": \"que vous " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKF*OU/" $2 "\": \"ce que vous " $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKF*OU/" $2 "\": \"ce que vous " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"F*OU/N" $2 "\": \"vous n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"F*OU/N/" $2 "\": \"vous ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KF*OU/N" $2 "\": \"que vous n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KF*OU/N/" $2 "\": \"que vous ne " $1 "\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKF*OU/N" $2 "\": \"ce que vous n'" $1 "\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKF*OU/" $2 "\": \"ce que vous ne " $1 "\",";}

	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"F*OU/N" $2 "/PA\": \"vous n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"F*OU/N/" $2 "/PA\": \"vous ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"KF*OU/N" $2 "/PA\": \"que vous n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KF*OU/N/" $2 "/PA\": \"que vous ne " $1 " pas\",";}
	    # if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKF*OU/N" $2 "/PA\": \"ce que vous n'" $1 " pas\",";}
	    # if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKF*OU/" $2 "/PA\": \"ce que vous ne " $1 " pas\",";}
	}
## ** Ils
	# if ($6 ~ /3p/){
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/" $2 "\": \"ils " $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/" $2 "\": \"ils " $1 "\",";}

	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/Il$\": \"" $1 "-ils\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/Il$\": \"" $1 "-ils\",";}

	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/" $2 "\": \"qu'ils " $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/" $2 "\": \"qu'ils " $1 "\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/" $2 "\": \"ce qu'ils " $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/" $2 "\": \"ce qu'ils " $1 "\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/N" $2 "\": \"ils n'" $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/N/" $2 "\": \"ils ne " $1 "\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/N" $2 "\": \"qu'ils n'" $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/N/" $2 "\": \"qu'ils ne " $1 "\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/N" $2 "\": \"ce qu'ils n'" $1 "\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/N/" $2 "\": \"ce qu'ils ne " $1 "\",";}

	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/N" $2 "/PA\": \"ils n'" $1 " pas\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/N/" $2 "/PA\": \"ils ne " $1 " pas\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/N" $2 "/PA\": \"qu'ils n'" $1 " pas\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/N/" $2 "/PA\": \"qu'ils ne " $1 " pas\",";}
	#     if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/N" $2 "/PA\": \"ce qu'ils n'" $1 " pas\",";}
	#     if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/N/" $2 "/PA\": \"ce qu'ils ne " $1 " pas\",";}
	# }
    }
}
## * NOMS()
function noms(){
    if ($3 ~ /NOM/)
    {
	# if ($5 ~ /s/){							# Si singulier
	#     if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
	# 	print "\"" $2 "\": \"" $1 "\",";			# le sortir sans article
	#     }
	# }
## ** Premier moulinage
## *** Pluriel
	if ($5 ~ /p/){
	    print "\"LE/" $2 "\": \"les " $1 "\",";
	    print "\"T*E/" $2 "\": \"des " $1 "\",";
	    print "\"SE/" $2 "\": \"ses " $1 "\",";
	    print "\"SE/" $2 "/*\": \"ces " $1 "\",";
	    print "\"KElC/" $2 "\": \"quelques " $1 "\",";
	    # print "\"K/LE/" $2 "\": \"que les " $1 "\",";
	    # print "\"KLE/" $2 "\": \"que les " $1 "\",";
	    # print "\"K/T*E/" $2 "\": \"que des " $1 "\",";
	    # print "\"KT*E/" $2 "\": \"que des " $1 "\",";

	}
## *** Masculin singulier ^C
	if ($1  ~ /^[^aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/){
	    print "\"Un/" $2 "\": \"un " $1 "\",";
	    print "\"L/" $2 "\": \"le " $1 "\",";
	    print "\"S/" $2 "\": \"ce " $1 "\",";
	    print "\"SOn/" $2 "\": \"son " $1 "\",";
	    # print "\"T*U/" $2 "\": \"du " $1 "\",";
	    # print "\"Un/" $2 "\": \"un " $1 "\",";
	    # print "\"T*Un/" $2 "\": \"d'un " $1 "\",";
	    # print "\"KT*Un/" $2 "\": \"que d'un " $1 "\",";
	    # print "\"KUn/" $2 "\": \"qu'un " $1 "\",";
	    # if ($1 !~ /[^i][^t]é$/ ){					# si le mot se termine avec é mais pas "ité"
	    # 	print "\"L/" $2 "\": \"le " $1 "\",";
	    # 	print "\"T*/" $2 "\": \"de " $1 "\",";
	    # 	print "\"An/" $2 "\": \"en " $1 "\",";
	    # 	print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	    # 	print "\"K/" $2 "\": \"que " $1 "\",";
	    # 	print "\"S/" $2 "\": \"ce " $1 "\",";
	    # 	print "\"SOn/" $2 "\": \"son " $1 "\",";
	    # }								# S'il y a moyen de faire élision avec CE QUE DE
	    if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
	    # if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	    # if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]é$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	    # if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]é$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	}

## *** Féminin  singulier ^C
	if ($A  ~ /^[^aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/){
	    print "\"LA/" $2 "\": \"la " $1 "\",";
	    print "\"UnC/" $2 "\": \"une " $1 "\",";
	    print "\"SA/" $2 "\": \"sa " $1 "\",";
	    print "\"ST/" $2 "\": \"cette " $1 "\",";
	    # print "\"T*LA/" $2 "\": \"de la " $1 "\",";
	    # print "\"T*/LA/" $2 "\": \"de la " $1 "\",";
	    # print "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	    # print "\"T*UnC/" $2 "\": \"d'une " $1 "\",";
	    # print "\"KT*UnC/" $2 "\": \"que d'une " $1 "\",";
	    # if ($1 !~ /[^i][^t]ée$/ ){
	    # 	print "\"T*/" $2 "\": \"de " $1 "\",";
	    # 	print "\"An/" $2 "\": \"en " $1 "\",";
	    # 	print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	    # 	print "\"K/" $2 "\": \"que " $1 "\",";
	    # 	print "\"SA/" $2 "\": \"sa " $1 "\",";
	    # }
	    if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	    # if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]ée$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	    # if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]ée$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	    if ($2 ~ /^[LR]/)					{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	    if ($2 ~ /^[FN]/)					{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	    if ($2 ~ /^[FN]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2); print "\"" ssone "\": \"cette " $1 "\",";}
	}
## *** Masculin singulier ^V
	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/ ){
	    print       "\"Un/" $2 "\": \"un " $1 "\",";
	    print        "\"L" $2 "\": \"l'" $1 "\",";
	    print        "\"ST" $2 "\": \"cet " $1 "\",";
	    print       "\"ST/" $2 "\": \"cet " $1 "\",";
	    # print     "\"T*Un/" $2 "\": \"d'un " $1 "\",";
	    # print    "\"KT*Un/" $2 "\": \"que d'un " $1 "\",";
	    # print      "\"KUn/" $2 "\": \"qu'un " $1 "\",";
	    # if ($1 !~ /[^i][^t]é$/ ){
	    # 	print        "\"T*" $2 "\": \"d'" $1 "\",";
	    # 	print      "\"SOn/" $2 "\": \"son " $1 "\",";
	    # 	print	    "\"An/" $2 "\": \"en " $1 "\",";
	    # 	print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	    # 	print         "\"L" $2 "\": \"l'" $1 "\",";
	    # 	print         "\"K" $2 "\": \"qu'" $1 "\",";
	    # 	print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	    # 	print        "\"KL" $2 "\": \"que l'" $1 "\",";
	    # 	print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	    # 	print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
	}

## *** Féminin  singulier ^V
	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/ ){
	    print "\"L" $2 "\": \"l'" $1 "\",";
	    print "\"UnC/" $2 "\": \"une " $1 "\",";
	    print "\"ST" $2 "\": \"cette " $1 "\",";
	    print "\"ST/" $2 "\": \"cette " $1 "\",";
	    print  "\"SOn/" $2 "\": \"son " $1 "\",";
	    # print "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	    # print "\"T*UnC/" $2 "\": \"d'une " $1 "\",";
	    # print "\"KT*UnC/" $2 "\": \"que d'une " $1 "\",";
	    # print      "\"UnC/" $2 "\": \"une " $1 "\",";
	    # print      "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	    # if ($1 !~ /[^i][^t]ée$/ ){
	    # 	print        "\"T*" $2 "\": \"d'" $1 "\",";
	    # 	print      "\"SOn/" $2 "\": \"son " $1 "\",";
	    # 	print	    "\"An/" $2 "\": \"en " $1 "\",";
	    # 	print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	    # 	print         "\"L" $2 "\": \"l'" $1 "\",";
	    # 	print         "\"K" $2 "\": \"qu'" $1 "\",";
	    # 	print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	    # 	print        "\"KL" $2 "\": \"que l'" $1 "\",";
	    # 	print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	    # 	print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
	}

## ** Les contraction de base : D ID C KM

	sub(/SYOn$/, "C", $2);
	sub(/KO\/MO/, "KMO", $2);
	sub(/^KO\/MI/, "KMI", $2);
	sub(/^KO\/MU/, "KMU", $2);
	sub(/^KO\/ME/, "KME", $2);

	if ($11 > 2){
	    sub(/P\*L$/, "D", $2);
	    sub(/P\*R$/, "D", $2);
	    sub(/T\*R$/, "D", $2);
	    sub(/T\*L$/, "D", $2);
	    sub(/\/KL$/, "/C", $2);
	    sub(/I\/TE$/, "ID", $2);
	    if ($2 !~ /[DC]\/D$/ ){
		sub(/\/D$/, "D", $2);
	    }
	    if ($2 !~ /[DC]\/C$/ ){
		sub(/\/C$/, "C", $2);
	    }
	}

## ** Deuxième moulinage
## *** Pluriel
	if ($5 ~ /p/){
	    print "\"LE/" $2 "\": \"les " $1 "\",";
	    print "\"T*E/" $2 "\": \"des " $1 "\",";
	    print "\"SE/" $2 "\": \"ses " $1 "\",";
	    print "\"SE/" $2 "/*\": \"ces " $1 "\",";
	    print "\"KElC/" $2 "\": \"quelques " $1 "\",";
	    # print "\"K/LE/" $2 "\": \"que les " $1 "\",";
	    # print "\"KLE/" $2 "\": \"que les " $1 "\",";
	    # print "\"K/T*E/" $2 "\": \"que des " $1 "\",";
	    # print "\"KT*E/" $2 "\": \"que des " $1 "\",";

	}
## *** Masculin singulier ^C
	if ($1  ~ /^[^aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/){
	    print "\"Un/" $2 "\": \"un " $1 "\",";
	    print "\"L/" $2 "\": \"le " $1 "\",";
	    print "\"S/" $2 "\": \"ce " $1 "\",";
	    print "\"SOn/" $2 "\": \"son " $1 "\",";
	    # print "\"T*U/" $2 "\": \"du " $1 "\",";
	    # print "\"Un/" $2 "\": \"un " $1 "\",";
	    # print "\"T*Un/" $2 "\": \"d'un " $1 "\",";
	    # print "\"KT*Un/" $2 "\": \"que d'un " $1 "\",";
	    # print "\"KUn/" $2 "\": \"qu'un " $1 "\",";
	    # if ($1 !~ /[^i][^t]é$/ ){					# si le mot se termine avec é mais pas "ité"
	    # 	print "\"L/" $2 "\": \"le " $1 "\",";
	    # 	print "\"T*/" $2 "\": \"de " $1 "\",";
	    # 	print "\"An/" $2 "\": \"en " $1 "\",";
	    # 	print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	    # 	print "\"K/" $2 "\": \"que " $1 "\",";
	    # 	print "\"S/" $2 "\": \"ce " $1 "\",";
	    # 	print "\"SOn/" $2 "\": \"son " $1 "\",";
	    # }								# S'il y a moyen de faire élision avec CE QUE DE
	    if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
	    # if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	    # if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]é$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	    # if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]é$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	}

## *** Féminin  singulier ^C
	if ($A  ~ /^[^aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/){
	    print "\"LA/" $2 "\": \"la " $1 "\",";
	    print "\"UnC/" $2 "\": \"une " $1 "\",";
	    print "\"SA/" $2 "\": \"sa " $1 "\",";
	    print "\"ST/" $2 "\": \"cette " $1 "\",";
	    # print "\"T*LA/" $2 "\": \"de la " $1 "\",";
	    # print "\"T*/LA/" $2 "\": \"de la " $1 "\",";
	    # print "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	    # print "\"T*UnC/" $2 "\": \"d'une " $1 "\",";
	    # print "\"KT*UnC/" $2 "\": \"que d'une " $1 "\",";
	    # if ($1 !~ /[^i][^t]ée$/ ){
	    # 	print "\"T*/" $2 "\": \"de " $1 "\",";
	    # 	print "\"An/" $2 "\": \"en " $1 "\",";
	    # 	print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	    # 	print "\"K/" $2 "\": \"que " $1 "\",";
	    # 	print "\"SA/" $2 "\": \"sa " $1 "\",";
	    # }
	    if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	    # if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]ée$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	    # if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]ée$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	    if ($2 ~ /^[LR]/)					{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	    if ($2 ~ /^[FN]/)					{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	    if ($2 ~ /^[FN]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2); print "\"" ssone "\": \"cette " $1 "\",";}
	}
## *** Masculin singulier ^V
	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/ ){
	    print       "\"Un/" $2 "\": \"un " $1 "\",";
	    print        "\"L" $2 "\": \"l'" $1 "\",";
	    print        "\"ST" $2 "\": \"cet " $1 "\",";
	    print       "\"ST/" $2 "\": \"cet " $1 "\",";
	    # print     "\"T*Un/" $2 "\": \"d'un " $1 "\",";
	    # print    "\"KT*Un/" $2 "\": \"que d'un " $1 "\",";
	    # print      "\"KUn/" $2 "\": \"qu'un " $1 "\",";
	    # if ($1 !~ /[^i][^t]é$/ ){
	    # 	print        "\"T*" $2 "\": \"d'" $1 "\",";
	    # 	print      "\"SOn/" $2 "\": \"son " $1 "\",";
	    # 	print	    "\"An/" $2 "\": \"en " $1 "\",";
	    # 	print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	    # 	print         "\"L" $2 "\": \"l'" $1 "\",";
	    # 	print         "\"K" $2 "\": \"qu'" $1 "\",";
	    # 	print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	    # 	print        "\"KL" $2 "\": \"que l'" $1 "\",";
	    # 	print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	    # 	print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
	}

## *** Féminin  singulier ^V
	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/ ){
	    print "\"L" $2 "\": \"l'" $1 "\",";
	    print "\"UnC/" $2 "\": \"une " $1 "\",";
	    print "\"ST" $2 "\": \"cette " $1 "\",";
	    print "\"ST/" $2 "\": \"cette " $1 "\",";
	    print  "\"SOn/" $2 "\": \"son " $1 "\",";
	    # print "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	    # print "\"T*UnC/" $2 "\": \"d'une " $1 "\",";
	    # print "\"KT*UnC/" $2 "\": \"que d'une " $1 "\",";
	    # print      "\"UnC/" $2 "\": \"une " $1 "\",";
	    # print      "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	    # if ($1 !~ /[^i][^t]ée$/ ){
	    # 	print        "\"T*" $2 "\": \"d'" $1 "\",";
	    # 	print      "\"SOn/" $2 "\": \"son " $1 "\",";
	    # 	print	    "\"An/" $2 "\": \"en " $1 "\",";
	    # 	print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	    # 	print         "\"L" $2 "\": \"l'" $1 "\",";
	    # 	print         "\"K" $2 "\": \"qu'" $1 "\",";
	    # 	print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	    # 	print        "\"KL" $2 "\": \"que l'" $1 "\",";
	    # 	print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	    # 	print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
	}

## ** Deuxième moulinage ancien
	# if ($5 ~ /p/){							# Si pluriel
	#     print "\"LE/" $2 "\": \"les " $1 "\",";
	#     print "\"T*E/" $2 "\": \"des " $1 "\",";
	#     print "\"KLE/" $2 "\": \"que les " $1 "\",";
	#     print "\"K/T*E/" $2 "\": \"que des " $1 "\",";
	#     print "\"KT*E/" $2 "\": \"que des " $1 "\",";
	# }

	# if ($1  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /m/){		# si masclin singulier et ne commence pas avec une voyelle
	#     print "\"T*U/" $2 "\": \"du " $1 "\",";
	#     print "\"Un/" $2 "\": \"un " $1 "\",";
	#     if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
	# 	print "\"L/" $2 "\": \"le " $1 "\",";
	# 	print "\"T*/" $2 "\": \"de " $1 "\",";
	# 	print "\"An/" $2 "\": \"en " $1 "\",";
	# 	print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	# 	print "\"K/" $2 "\": \"que " $1 "\",";
	# 	print "\"S/" $2 "\": \"ce " $1 "\",";
	# 	print "\"SOn/" $2 "\": \"son " $1 "\",";
	#     }								# S'il y a moyen de faire élision avec CE QUE DE
	#     if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
	#     if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	#     if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]é$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	#     if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]é$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	# }

	# if ($A  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /f/){		# si féminin singulier et ne commence pas avec une voyelle
	#     print "\"LA/" $2 "\": \"la " $1 "\",";
	#     print "\"UnC/" $2 "\": \"une " $1 "\",";
	#     print "\"ST/" $2 "\": \"cette " $1 "\",";
	#     if ($1 !~ /[^i][^t]ée$/ ){
	# 	print "\"T*/" $2 "\": \"de " $1 "\",";
	# 	print "\"An/" $2 "\": \"en " $1 "\",";
	# 	print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	# 	print "\"K/" $2 "\": \"que " $1 "\",";
	# 	print "\"SA/" $2 "\": \"sa " $1 "\",";
	#     }
	#     if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	#     if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]ée$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	#     if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]ée$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	#     if ($2 ~ /^[FN]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2); print "\"" ssone "\": \"cette " $1 "\",";}
	# }

	# if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/ ){		# si masclin singulier commence avec une voyelle
	#     print       "\"Un/" $2 "\": \"un " $1 "\",";
	#     print      "\"KUn/" $2 "\": \"qu'un " $1 "\",";
	#     print        "\"ST" $2 "\": \"cet " $1 "\",";
	#     print       "\"ST/" $2 "\": \"cet " $1 "\",";
	#     if ($1 !~ /[^i][^t]é$/ ){
	# 	print        "\"T*" $2 "\": \"d'" $1 "\",";
	# 	print      "\"SOn/" $2 "\": \"son " $1 "\",";
	# 	print	    "\"An/" $2 "\": \"en " $1 "\",";
	# 	print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	# 	print         "\"L" $2 "\": \"l'" $1 "\",";
	# 	print         "\"K" $2 "\": \"qu'" $1 "\",";
	# 	print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	# 	print        "\"KL" $2 "\": \"que l'" $1 "\",";
	# 	print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	# 	print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
	# }

	# if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/ ){		# si féminin singulier commence avec une voyelle
	#     print      "\"UnC/" $2 "\": \"une " $1 "\",";
	#     print      "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	#     print        "\"ST" $2 "\": \"cette " $1 "\",";
	#     print       "\"ST/" $2 "\": \"cette " $1 "\",";
	#     if ($1 !~ /[^i][^t]ée$/ ){
	# 	print        "\"T*" $2 "\": \"d'" $1 "\",";
	# 	print      "\"SOn/" $2 "\": \"son " $1 "\",";
	# 	print	    "\"An/" $2 "\": \"en " $1 "\",";
	# 	print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	# 	print         "\"L" $2 "\": \"l'" $1 "\",";
	# 	print         "\"K" $2 "\": \"qu'" $1 "\",";
	# 	print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	# 	print        "\"KL" $2 "\": \"que l'" $1 "\",";
	# 	print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	# 	print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
	# }

## ** Troisième moulinage
# 	if ($11 > 2){
# 	    for (i in arr)
# 	    {
# 		if ($5 ~ /p/){
# 		    print "\"LE/" arr[i] "\": \"les " $1 "\",";
# 		    print "\"T*E/" arr[i] "\": \"des " $1 "\",";
# 		    print "\"SE/" arr[i] "\": \"ses " $1 "\",";
# 		    print "\"SE/" arr[i] "/*\": \"ces " $1 "\",";
# 		    print "\"KElC/" arr[i] "\": \"quelques " $1 "\",";
# 		    # print "\"K/LE/" arr[i] "\": \"que les " $1 "\",";
# 		    # print "\"KLE/" arr[i] "\": \"que les " $1 "\",";
# 		    # print "\"K/T*E/" arr[i] "\": \"que des " $1 "\",";
# 		    # print "\"KT*E/" arr[i] "\": \"que des " $1 "\",";

# 		}
## *** Masculin singulier ^C
# 		if ($1  ~ /^[^aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/){
# 		    print "\"Un/" arr[i] "\": \"un " $1 "\",";
# 		    print "\"L/" arr[i] "\": \"le " $1 "\",";
# 		    print "\"S/" arr[i] "\": \"ce " $1 "\",";
# 		    print "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 		    # print "\"T*U/" arr[i] "\": \"du " $1 "\",";
# 		    # print "\"Un/" arr[i] "\": \"un " $1 "\",";
# 		    # print "\"T*Un/" arr[i] "\": \"d'un " $1 "\",";
# 		    # print "\"KT*Un/" arr[i] "\": \"que d'un " $1 "\",";
# 		    # print "\"KUn/" arr[i] "\": \"qu'un " $1 "\",";
# 		    # if ($1 !~ /[^i][^t]é$/ ){					# si le mot se termine avec é mais pas "ité"
# 		    # 	print "\"L/" arr[i] "\": \"le " $1 "\",";
# 		    # 	print "\"T*/" arr[i] "\": \"de " $1 "\",";
# 		    # 	print "\"An/" arr[i] "\": \"en " $1 "\",";
# 		    # 	print "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 		    # 	print "\"K/" arr[i] "\": \"que " $1 "\",";
# 		    # 	print "\"S/" arr[i] "\": \"ce " $1 "\",";
# 		    # 	print "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 		    # }								# S'il y a moyen de faire élision avec CE QUE DE
# 		    if (arr[i] ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,arr[i]);  print "\"" ssone "\": \"ce " $1 "\",";}
# 		    # if (arr[i] ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, arr[i]);  print "\"" ksone "\": \"que " $1 "\",";}
# 		    # if (arr[i] ~ /^[LR]/ && $1 !~ /[^i][^t]é$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, arr[i]);	print "\"" ttsone "\": \"de " $1 "\",";}
# 		    # if (arr[i] ~ /^[FN]/ && $1 !~ /[^i][^t]é$/)		{tsone = gensub(/([FN])/, "T\\1", 1, arr[i]);	print "\"" tsone "\": \"de " $1 "\",";}
# 		}

## *** Féminin  singulier ^C
# 		if ($A  ~ /^[^aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/){
# 		    print "\"LA/" arr[i] "\": \"la " $1 "\",";
# 		    print "\"UnC/" arr[i] "\": \"une " $1 "\",";
# 		    print "\"SA/" arr[i] "\": \"sa " $1 "\",";
# 		    print "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 		    # print "\"T*LA/" arr[i] "\": \"de la " $1 "\",";
# 		    # print "\"T*/LA/" arr[i] "\": \"de la " $1 "\",";
# 		    # print "\"KUnC/" arr[i] "\": \"qu'une " $1 "\",";
# 		    # print "\"T*UnC/" arr[i] "\": \"d'une " $1 "\",";
# 		    # print "\"KT*UnC/" arr[i] "\": \"que d'une " $1 "\",";
# 		    # if ($1 !~ /[^i][^t]ée$/ ){
# 		    # 	print "\"T*/" arr[i] "\": \"de " $1 "\",";
# 		    # 	print "\"An/" arr[i] "\": \"en " $1 "\",";
# 		    # 	print "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 		    # 	print "\"K/" arr[i] "\": \"que " $1 "\",";
# 		    # 	print "\"SA/" arr[i] "\": \"sa " $1 "\",";
# 		    # }
# 		    if (arr[i] ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, arr[i]);  print "\"" ksone "\": \"que " $1 "\",";}
# 		    # if (arr[i] ~ /^[LR]/ && $1 !~ /[^i][^t]ée$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, arr[i]);	print "\"" ttsone "\": \"de " $1 "\",";}
# 		    # if (arr[i] ~ /^[FN]/ && $1 !~ /[^i][^t]ée$/)		{tsone = gensub(/([FN])/, "T\\1", 1, arr[i]);	print "\"" tsone "\": \"de " $1 "\",";}
# 		    if (arr[i] ~ /^[LR]/)					{ttsone = gensub(/([LR])/, "T*\\1", 1, arr[i]);	print "\"" ttsone "\": \"de " $1 "\",";}
# 		    if (arr[i] ~ /^[FN]/)					{tsone = gensub(/([FN])/, "T\\1", 1, arr[i]);	print "\"" tsone "\": \"de " $1 "\",";}
# 		    if (arr[i] ~ /^[FN]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,arr[i]); print "\"" ssone "\": \"cette " $1 "\",";}
# 		}
## *** Masculin singulier ^V
# 		if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/ ){
# 		    print       "\"Un/" arr[i] "\": \"un " $1 "\",";
# 		    print        "\"L/" arr[i] "\": \"l'" $1 "\",";
# 		    print        "\"ST" arr[i] "\": \"cet " $1 "\",";
# 		    print       "\"ST/" arr[i] "\": \"cet " $1 "\",";
# 		    # print     "\"T*Un/" arr[i] "\": \"d'un " $1 "\",";
# 		    # print    "\"KT*Un/" arr[i] "\": \"que d'un " $1 "\",";
# 		    # print      "\"KUn/" arr[i] "\": \"qu'un " $1 "\",";
# 		    # if ($1 !~ /[^i][^t]é$/ ){
# 		    # 	print        "\"T*" arr[i] "\": \"d'" $1 "\",";
# 		    # 	print      "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 		    # 	print	    "\"An/" arr[i] "\": \"en " $1 "\",";
# 		    # 	print	   "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 		    # 	print         "\"L" arr[i] "\": \"l'" $1 "\",";
# 		    # 	print         "\"K" arr[i] "\": \"qu'" $1 "\",";
# 		    # 	print       "\"T*L" arr[i] "\": \"de l'" $1 "\",";
# 		    # 	print        "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 		    # 	print       "\"KT*" arr[i] "\": \"que d'" $1 "\",";
# 		    # 	print      "\"KT*L" arr[i] "\": \"que de l'" $1 "\",";}
# 		}

## *** Féminin  singulier ^V
# 		if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/ ){
# 		    print "\"LA/" arr[i] "\": \"la " $1 "\",";
# 		    print "\"UnC/" arr[i] "\": \"une " $1 "\",";
# 		    print "\"ST" arr[i] "\": \"cette " $1 "\",";
# 		    print "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 		    print  "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 		    # print "\"KUnC/" arr[i] "\": \"qu'une " $1 "\",";
# 		    # print "\"T*UnC/" arr[i] "\": \"d'une " $1 "\",";
# 		    # print "\"KT*UnC/" arr[i] "\": \"que d'une " $1 "\",";
# 		    # print      "\"UnC/" arr[i] "\": \"une " $1 "\",";
# 		    # print      "\"KUnC/" arr[i] "\": \"qu'une " $1 "\",";
# 		    # if ($1 !~ /[^i][^t]ée$/ ){
# 		    # 	print        "\"T*" arr[i] "\": \"d'" $1 "\",";
# 		    # 	print      "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 		    # 	print	    "\"An/" arr[i] "\": \"en " $1 "\",";
# 		    # 	print	   "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 		    # 	print         "\"L" arr[i] "\": \"l'" $1 "\",";
# 		    # 	print         "\"K" arr[i] "\": \"qu'" $1 "\",";
# 		    # 	print       "\"T*L" arr[i] "\": \"de l'" $1 "\",";
# 		    # 	print        "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 		    # 	print       "\"KT*" arr[i] "\": \"que d'" $1 "\",";
# 		    # 	print      "\"KT*L" arr[i] "\": \"que de l'" $1 "\",";}
# 		}

## ** fin du 3e moulinage
# 	    }
# 		# 	if ($5 ~ /p/){							# Si pluriel
# 		# 	    print "\"LE/" arr[i] "\": \"les " $1 "\",";
# 		# 	    print "\"T*E/" arr[i] "\": \"des " $1 "\",";
# 		# 	    print "\"KLE/" arr[i] "\": \"que les " $1 "\",";
# 		# 	    print "\"K/T*E/" arr[i] "\": \"que des " $1 "\",";
# 		# 	    print "\"KT*E/" arr[i] "\": \"que des " $1 "\",";
# 	    # 	}

# 	    # 	if ($1  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /m/){		# si masclin singulier et ne commence pas avec une voyelle
# 	    # 	    print "\"T*U/" arr[i] "\": \"du " $1 "\",";
# 	    # 	    print "\"Un/" arr[i] "\": \"un " $1 "\",";
# 	    # 	    if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
# 	    # 		print "\"L/" arr[i] "\": \"le " $1 "\",";
# 	    # 		print "\"T*/" arr[i] "\": \"de " $1 "\",";
# 	    # 		print "\"An/" arr[i] "\": \"en " $1 "\",";
# 	    # 		print "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 	    # 		print "\"K/" arr[i] "\": \"que " $1 "\",";
# 	    # 		print "\"S/" arr[i] "\": \"ce " $1 "\",";
# 	    # 		print "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 	    # 	    }								# S'il y a moyen de faire élision avec CE QUE DE
# 	    # 	    if (arr[i] ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,arr[i]);  print "\"" ssone "\": \"ce " $1 "\",";}
# 	    # 	    if (arr[i] ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, arr[i]);  print "\"" ksone "\": \"que " $1 "\",";}
# 	    # 	    if (arr[i] ~ /^[LR]/ && $1 !~ /[^i][^t]é$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, arr[i]);	print "\"" ttsone "\": \"de " $1 "\",";}
# 	    # 	    if (arr[i] ~ /^[FN]/ && $1 !~ /[^i][^t]é$/)		{tsone = gensub(/([FN])/, "T\\1", 1, arr[i]);	print "\"" tsone "\": \"de " $1 "\",";}
# 	    # 	}

# 	    # 	if ($A  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /f/){		# si féminin singulier et ne commence pas avec une voyelle
# 	    # 	    print "\"LA/" arr[i] "\": \"la " $1 "\",";
# 	    # 	    print "\"UnC/" arr[i] "\": \"une " $1 "\",";
# 	    # 	    print "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 	    # 	    if ($1 !~ /[^i][^t]ée$/ ){
# 	    # 		print "\"T*/" arr[i] "\": \"de " $1 "\",";
# 	    # 		print "\"An/" arr[i] "\": \"en " $1 "\",";
# 	    # 		print "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 	    # 		print "\"K/" arr[i] "\": \"que " $1 "\",";
# 	    # 		print "\"SA/" arr[i] "\": \"sa " $1 "\",";
# 	    # 	    }
# 	    # 	    if (arr[i] ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, arr[i]);  print "\"" ksone "\": \"que " $1 "\",";}
# 	    # 	    if (arr[i] ~ /^[LR]/ && $1 !~ /[^i][^t]ée$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, arr[i]);	print "\"" ttsone "\": \"de " $1 "\",";}
# 	    # 	    if (arr[i] ~ /^[FN]/ && $1 !~ /[^i][^t]ée$/)		{tsone = gensub(/([FN])/, "T\\1", 1, arr[i]);	print "\"" tsone "\": \"de " $1 "\",";}
# 	    # 	    if (arr[i] ~ /^[FN]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,arr[i]); print "\"" ssone "\": \"cette " $1 "\",";}
# 	    # 	}

# 	    # 	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/ ){		# si masclin singulier commence avec une voyelle
# 	    # 	    print       "\"Un/" arr[i] "\": \"un " $1 "\",";
# 	    # 	    print      "\"KUn/" arr[i] "\": \"qu'un " $1 "\",";
# 	    # 	    print        "\"ST" arr[i] "\": \"cet " $1 "\",";
# 	    # 	    print       "\"ST/" arr[i] "\": \"cet " $1 "\",";
# 	    # 	    if ($1 !~ /[^i][^t]é$/ ){
# 	    # 		print        "\"T*" arr[i] "\": \"d'" $1 "\",";
# 	    # 		print      "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 	    # 		print	    "\"An/" arr[i] "\": \"en " $1 "\",";
# 	    # 		print	   "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 	    # 		print         "\"L" arr[i] "\": \"l'" $1 "\",";
# 	    # 		print         "\"K" arr[i] "\": \"qu'" $1 "\",";
# 	    # 		print       "\"T*L" arr[i] "\": \"de l'" $1 "\",";
# 	    # 		print        "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 	    # 		print       "\"KT*" arr[i] "\": \"que d'" $1 "\",";
# 	    # 		print      "\"KT*L" arr[i] "\": \"que de l'" $1 "\",";}
# 	    # 	}

# 	    # 	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/ ){		# si féminin singulier commence avec une voyelle
# 	    # 	    print      "\"UnC/" arr[i] "\": \"une " $1 "\",";
# 	    # 	    print      "\"KUnC/" arr[i] "\": \"qu'une " $1 "\",";
# 	    # 	    print        "\"ST" arr[i] "\": \"cette " $1 "\",";
# 	    # 	    print       "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 	    # 	    if ($1 !~ /[^i][^t]ée$/ ){
# 	    # 		print        "\"T*" arr[i] "\": \"d'" $1 "\",";
# 	    # 		print      "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 	    # 		print	    "\"An/" arr[i] "\": \"en " $1 "\",";
# 	    # 		print	   "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 	    # 		print         "\"L" arr[i] "\": \"l'" $1 "\",";
# 	    # 		print         "\"K" arr[i] "\": \"qu'" $1 "\",";
# 	    # 		print       "\"T*L" arr[i] "\": \"de l'" $1 "\",";
# 	    # 		print        "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 	    # 		print       "\"KT*" arr[i] "\": \"que d'" $1 "\",";
# 	    # 		print      "\"KT*L" arr[i] "\": \"que de l'" $1 "\",";}
# 	    # 	}


## ** fin du script
    }
}



## * ADJECTIFS()
function adjectifs(){
    gsub(/-/, "/", $2);
    if ($3 ~ /ADJ/)
    {
## ** Masculin  singulier
    	if ($5 ~ /s/ && $4 ~ /m/)
    	{
    	    if ($1 !~ /é$/ ){
    	    print "\"" $2 "\": \"" $1 "\",";
    	    # for (i in arr){
	    # 	print "\"" arr[i] "\": \"" $1 "\",";}

    	    }
    	    print "\"SE/" $2 "\": \"c'est " $1 "\",";
    	    # print "\"Il/E/" $2 "\": \"il est " $1 "\",";
    	    # print "\"KI/E/" $2 "\": \"qui est " $1 "\",";
    	    if ($1 ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
    		print "\"L" $2 "\": \"l'" $1 "\",";
    		print "\"T*" $2 "\": \"d'" $1 "\",";
    		print "\"KL" $2 "\": \"que l'" $1 "\",";
    		print "\"T*L" $2 "\": \"de l'" $1 "\",";
    	    }
    	    # if ($1 ~ /^[^aeiouéàâêïîô]/ && $1 !~ /é$/){
    	    # 	print "\"L/" $2 "\": \"le " $1 "\",";
    	    # 	print "\"T*/" $2 "\": \"de " $1 "\",";
    	    # 	print "\"KL/" $2 "\": \"que le " $1 "\",";
    	    # }
    	    # for (i in arr){
    	    # 	print "\"SE/" arr[i] "\": \"c'est " $1 "\",";
    	    # 	# print "\"Il/E/" arr[i] "\": \"il est " $1 "\",";
	    # 	# print "\"KI/E/" arr[i] "\": \"qui est " $1 "\",";
    	    # 	if (arr[i] ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
    	    # 	    print "\"L" arr[i] "\": \"l'" $1 "\",";
	    # 	    print "\"T*" $2 "\": \"d'" $1 "\",";
    	    # 	    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
    	    # 	}
	    # if (arr[i] ~ /^[^aeiouéàâêïîôh]/ && arr[i] !~ /é$/){
	    #     print "\"L/" arr[i] "\": \"le " $1 "\",";
	    #     print "\"T*/" $2 "\": \"de " $1 "\",";
	    #     print "\"KL/" arr[i] "\": \"que le " $1 "\",";
	    # }
	    # }
	}
## ** Singulier indéfini
    	if ($5 ~ /s/ && $4 ~ /^$/)
    	{
    	    if ($1 !~ /é$/ ){
    	    print "\"" $2 "\": \"" $1 "\",";
    	    # for (i in arr){
	    # 	print "\"" arr[i] "\": \"" $1 "\",";}

    	    }
    	    print "\"SE/" $2 "\": \"c'est " $1 "\",";
    	    # print "\"Il/E/" $2 "\": \"il est " $1 "\",";
    	    # print "\"KI/E/" $2 "\": \"qui est " $1 "\",";
    	    if ($1 ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
    		print "\"L" $2 "\": \"l'" $1 "\",";
    		print "\"T*" $2 "\": \"d'" $1 "\",";
    		print "\"KL" $2 "\": \"que l'" $1 "\",";
    	    }
    	    # if ($1 ~ /^[^aeiouéàâêïîôh]/ && $1 !~ /é$/){
    	    # 	print "\"L/" $2 "\": \"le " $1 "\",";
    	    # 	print "\"T*/" $2 "\": \"de " $1 "\",";
    	    # 	print "\"KL/" $2 "\": \"que le " $1 "\",";
    	    # }
    	    # for (i in arr){
    	    # 	print "\"SE/" arr[i] "\": \"c'est " $1 "\",";
    	    # 	# print "\"Il/E/" arr[i] "\": \"il est " $1 "\",";
	    # 	# print "\"KI/E/" arr[i] "\": \"qui est " $1 "\",";
    	    # 	if (arr[i] ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
    	    # 	    print "\"L" arr[i] "\": \"l'" $1 "\",";
	    # 	    print "\"T*" $2 "\": \"d'" $1 "\",";
    	    # 	    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
    	    # 	}
    	    # 	# if (arr[i] ~ /^[^aeiouéàâêïîôh]/ && arr[i] !~ /é$/){
    	    # 	#     print "\"L/" arr[i] "\": \"le " $1 "\",";
	    # 	#     print "\"T*/" $2 "\": \"de " $1 "\",";
    	    # 	#     print "\"KL/" arr[i] "\": \"que le " $1 "\",";
    	    # 	# }
    	    # }
    	}

## ** Masculin  pluriel
    	if ($5 ~ /p/ && $4 ~ /m/)
    	{
    	    if ($1 !~ /és$/ ){
		print "\"" $2 "\": \"" $1 "\",";
		# for (i in arr){
		# 	print "\"" arr[i] "\": \"" $1 "\",";}
    	    }

    	    # print "\"Il/SOn/" $2 "\": \"ils sont " $1 "\",";
    	    # print "\"KI/SOn/" $2 "\": \"qui sont " $1 "\",";
    	    # print "\"LE/" $2 "\": \"les " $1 "\",";
    	    # print "\"KLE/" $2 "\": \"que les " $1 "\",";
    	    # for (i in arr){
    	    # 	# print "\"Il/SOn/" arr[i] "\": \"ils sont " $1 "\",";
	    # 	# print "\"KI/SOn/" arr[i] "\": \"qui sont " $1 "\",";
    	    # 	# print "\"LE/" arr[i] "\": \"les " $1 "\",";
    	    # 	# print "\"KLE/" arr[i] "\": \"que les " $1 "\",";
    	    # }
    	}
## ** Féminin   pluriel
    	if ($5 ~ /p/ && $4 ~ /f/)
    	{
    	    if ($1 !~ /ées$/ ){
    	    print "\"" $2 "\": \"" $1 "\",";
    	    # for (i in arr){
	    # 	print "\"" arr[i] "\": \"" $1 "\",";}

    	    }

    	    # print "\"El/SOn/" $2 "\": \"elles sont " $1 "\",";
    	    # print "\"LE/" $2 "\": \"les " $1 "\",";
    	    # print "\"KLE/" $2 "\": \"que les " $1 "\",";
    	    # for (i in arr){
    	    # 	print "\"El/SOn/" arr[i] "\": \"elles sont " $1 "\",";
    	    # 	print "\"LE/" arr[i] "\": \"les " $1 "\",";
    	    # 	print "\"KLE/" $2 "\": \"que les " $1 "\",";
    	    # }
    	}
## ** Féminin   singulier
    	if ($5 ~ /s/ && $4 ~ /f/)
    	{
    	    if ($1 !~ /ée$/ ){
    	    print "\"" $2 "\": \"" $1 "\",";
    	    # for (i in arr){
	    # 	print "\"" arr[i] "\": \"" $1 "\",";}

    	    }

    	    # print "\"SE/" $2 "\": \"c'est " $1 "\",";
    	    # print "\"El/E/" $2 "\": \"elle est " $1 "\",";
    	    if ($1 ~ /^[aeiouéàâêïîô]/ && $1 !~ /ée$/){
    		print "\"L" $2 "\": \"l'" $1 "\",";
    		print "\"KL" $2 "\": \"que l'" $1 "\",";
    	    }
    	    # if ($1 ~ /^[^aeiouéàâêïîôh]/ && $1 !~ /ée$/){
    	    # 	print "\"LA/" $2 "\": \"la " $1 "\",";
    	    # 	print "\"KLA/" $2 "\": \"que la " $1 "\",";
    	    # }
    	    for (i in arr){
    		# print "\"SE/" arr[i] "\": \"c'est " $1 "\",";
    		# print "\"El/E/" arr[i] "\": \"elle est " $1 "\",";
    		if (arr[i] ~ /^[aeiouéàâêïîô]/ && $1 !~ /ée$/){
    		    print "\"L" arr[i] "\": \"l'" $1 "\",";
    		    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
    		}
    		# if (arr[i] ~ /^[^aeiouéàâêïîôh]/ && arr[i] !~ /ée$/){
    		#     print "\"LA/" arr[i] "\": \"la " $1 "\",";
    		#     print "\"KLA/" arr[i] "\": \"que la " $1 "\",";
    		# }
    	    }
    	}

## ** Contractions de base
	sub(/SYOn$/, "C", $2);
	sub(/KO\/MO/, "KMO", $2);
	sub(/^KO\/MI/, "KMI", $2);
	sub(/^KO\/MU/, "KMU", $2);
	sub(/^KO\/ME/, "KME", $2);
	if ($11 > 2){
	    sub(/P\*L$/, "D", $2);
	    sub(/P\*R$/, "D", $2);
	    sub(/T\*R$/, "D", $2);
	    sub(/T\*L$/, "D", $2);
	    sub(/\/KL$/, "/C", $2);
	    sub(/I\/TE$/, "ID", $2);
	    if ($2 !~ /[DC]\/D$/ ){
		sub(/\/D$/, "D", $2);
	    }
	    if ($2 !~ /[DC]\/C$/ ){
		sub(/\/C$/, "C", $2);
	    }
	}

## ** Deuxième moulinage
## ** Masculin  singulier
    	if ($5 ~ /s/ && $4 ~ /m/)
    	{
    	    if ($1 !~ /é$/ ){
    	    print "\"" $2 "\": \"" $1 "\",";
    	    # for (i in arr){
	    # 	print "\"" arr[i] "\": \"" $1 "\",";}

    	    }
    	    print "\"SE/" $2 "\": \"c'est " $1 "\",";
    	    # print "\"Il/E/" $2 "\": \"il est " $1 "\",";
    	    # print "\"KI/E/" $2 "\": \"qui est " $1 "\",";
    	    if ($1 ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
    		print "\"L" $2 "\": \"l'" $1 "\",";
    		print "\"T*" $2 "\": \"d'" $1 "\",";
    		print "\"KL" $2 "\": \"que l'" $1 "\",";
    		print "\"T*L" $2 "\": \"de l'" $1 "\",";
    	    }
    	    # if ($1 ~ /^[^aeiouéàâêïîô]/ && $1 !~ /é$/){
    	    # 	print "\"L/" $2 "\": \"le " $1 "\",";
    	    # 	print "\"T*/" $2 "\": \"de " $1 "\",";
    	    # 	print "\"KL/" $2 "\": \"que le " $1 "\",";
    	    # }
    	    # for (i in arr){
    	    # 	print "\"SE/" arr[i] "\": \"c'est " $1 "\",";
    	    # 	# print "\"Il/E/" arr[i] "\": \"il est " $1 "\",";
	    # 	# print "\"KI/E/" arr[i] "\": \"qui est " $1 "\",";
    	    # 	if (arr[i] ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
    	    # 	    print "\"L" arr[i] "\": \"l'" $1 "\",";
	    # 	    print "\"T*" $2 "\": \"d'" $1 "\",";
    	    # 	    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
    	    # 	}
	    # if (arr[i] ~ /^[^aeiouéàâêïîôh]/ && arr[i] !~ /é$/){
	    #     print "\"L/" arr[i] "\": \"le " $1 "\",";
	    #     print "\"T*/" $2 "\": \"de " $1 "\",";
	    #     print "\"KL/" arr[i] "\": \"que le " $1 "\",";
	    # }
	    # }
	}
## ** Singulier indéfini
    	if ($5 ~ /s/ && $4 ~ /^$/)
    	{
    	    if ($1 !~ /é$/ ){
    	    print "\"" $2 "\": \"" $1 "\",";
    	    # for (i in arr){
	    # 	print "\"" arr[i] "\": \"" $1 "\",";}

    	    }
    	    print "\"SE/" $2 "\": \"c'est " $1 "\",";
    	    # print "\"Il/E/" $2 "\": \"il est " $1 "\",";
    	    # print "\"KI/E/" $2 "\": \"qui est " $1 "\",";
    	    if ($1 ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
    		print "\"L" $2 "\": \"l'" $1 "\",";
    		print "\"T*" $2 "\": \"d'" $1 "\",";
    		print "\"KL" $2 "\": \"que l'" $1 "\",";
    	    }
    	    # if ($1 ~ /^[^aeiouéàâêïîôh]/ && $1 !~ /é$/){
    	    # 	print "\"L/" $2 "\": \"le " $1 "\",";
    	    # 	print "\"T*/" $2 "\": \"de " $1 "\",";
    	    # 	print "\"KL/" $2 "\": \"que le " $1 "\",";
    	    # }
    	    # for (i in arr){
    	    # 	print "\"SE/" arr[i] "\": \"c'est " $1 "\",";
    	    # 	# print "\"Il/E/" arr[i] "\": \"il est " $1 "\",";
	    # 	# print "\"KI/E/" arr[i] "\": \"qui est " $1 "\",";
    	    # 	if (arr[i] ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
    	    # 	    print "\"L" arr[i] "\": \"l'" $1 "\",";
	    # 	    print "\"T*" $2 "\": \"d'" $1 "\",";
    	    # 	    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
    	    # 	}
    	    # 	# if (arr[i] ~ /^[^aeiouéàâêïîôh]/ && arr[i] !~ /é$/){
    	    # 	#     print "\"L/" arr[i] "\": \"le " $1 "\",";
	    # 	#     print "\"T*/" $2 "\": \"de " $1 "\",";
    	    # 	#     print "\"KL/" arr[i] "\": \"que le " $1 "\",";
    	    # 	# }
    	    # }
    	}

## ** Masculin  pluriel
    	if ($5 ~ /p/ && $4 ~ /m/)
    	{
    	    if ($1 !~ /és$/ ){
		print "\"" $2 "\": \"" $1 "\",";
		# for (i in arr){
		# 	print "\"" arr[i] "\": \"" $1 "\",";}
    	    }

    	    # print "\"Il/SOn/" $2 "\": \"ils sont " $1 "\",";
    	    # print "\"KI/SOn/" $2 "\": \"qui sont " $1 "\",";
    	    # print "\"LE/" $2 "\": \"les " $1 "\",";
    	    # print "\"KLE/" $2 "\": \"que les " $1 "\",";
    	    # for (i in arr){
    	    # 	# print "\"Il/SOn/" arr[i] "\": \"ils sont " $1 "\",";
	    # 	# print "\"KI/SOn/" arr[i] "\": \"qui sont " $1 "\",";
    	    # 	# print "\"LE/" arr[i] "\": \"les " $1 "\",";
    	    # 	# print "\"KLE/" arr[i] "\": \"que les " $1 "\",";
    	    # }
    	}
## ** Féminin   pluriel
    	if ($5 ~ /p/ && $4 ~ /f/)
    	{
    	    if ($1 !~ /ées$/ ){
    	    print "\"" $2 "\": \"" $1 "\",";
    	    # for (i in arr){
	    # 	print "\"" arr[i] "\": \"" $1 "\",";}

    	    }

    	    # print "\"El/SOn/" $2 "\": \"elles sont " $1 "\",";
    	    # print "\"LE/" $2 "\": \"les " $1 "\",";
    	    # print "\"KLE/" $2 "\": \"que les " $1 "\",";
    	    # for (i in arr){
    	    # 	print "\"El/SOn/" arr[i] "\": \"elles sont " $1 "\",";
    	    # 	print "\"LE/" arr[i] "\": \"les " $1 "\",";
    	    # 	print "\"KLE/" $2 "\": \"que les " $1 "\",";
    	    # }
    	}
## ** Féminin   singulier
    	if ($5 ~ /s/ && $4 ~ /f/)
    	{
    	    if ($1 !~ /ée$/ ){
    	    print "\"" $2 "\": \"" $1 "\",";
    	    # for (i in arr){
	    # 	print "\"" arr[i] "\": \"" $1 "\",";}

    	    }

    	    # print "\"SE/" $2 "\": \"c'est " $1 "\",";
    	    # print "\"El/E/" $2 "\": \"elle est " $1 "\",";
    	    if ($1 ~ /^[aeiouéàâêïîô]/ && $1 !~ /ée$/){
    		print "\"L" $2 "\": \"l'" $1 "\",";
    		print "\"KL" $2 "\": \"que l'" $1 "\",";
    	    }
    	    # if ($1 ~ /^[^aeiouéàâêïîôh]/ && $1 !~ /ée$/){
    	    # 	print "\"LA/" $2 "\": \"la " $1 "\",";
    	    # 	print "\"KLA/" $2 "\": \"que la " $1 "\",";
    	    # }
    	    for (i in arr){
    		# print "\"SE/" arr[i] "\": \"c'est " $1 "\",";
    		# print "\"El/E/" arr[i] "\": \"elle est " $1 "\",";
    		if (arr[i] ~ /^[aeiouéàâêïîô]/ && $1 !~ /ée$/){
    		    print "\"L" arr[i] "\": \"l'" $1 "\",";
    		    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
    		}
    		# if (arr[i] ~ /^[^aeiouéàâêïîôh]/ && arr[i] !~ /ée$/){
    		#     print "\"LA/" arr[i] "\": \"la " $1 "\",";
    		#     print "\"KLA/" arr[i] "\": \"que la " $1 "\",";
    		# }
    	    }
    	}

## ** ancien deuxième moulinage
## *** Masculin  singulier
#     	if ($5 ~ /s/ && $4 ~ /m/)
#     	{
#     	    if ($1 !~ /é$/ ){
#     	    print "\"" $2 "\": \"" $1 "\",";
#     	    for (i in arr){
# 		print "\"" arr[i] "\": \"" $1 "\",";}

#     	    }
#     	    print "\"SE/" $2 "\": \"c'est " $1 "\",";
#     	    print "\"Il/E/" $2 "\": \"il est " $1 "\",";
#     	    print "\"KI/E/" $2 "\": \"qui est " $1 "\",";
#     	    if ($1 ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
#     		print "\"L" $2 "\": \"l'" $1 "\",";
#     		print "\"T*" $2 "\": \"d'" $1 "\",";
#     		print "\"KL" $2 "\": \"que l'" $1 "\",";
#     	    }
#     	    if ($1 ~ /^[^aeiouéàâêïîôh]/ && $1 !~ /é$/){
#     		print "\"L/" $2 "\": \"le " $1 "\",";
#     		print "\"T*/" $2 "\": \"de " $1 "\",";
#     		print "\"KL/" $2 "\": \"que le " $1 "\",";
#     	    }
#     	    for (i in arr){
#     		print "\"SE/" arr[i] "\": \"c'est " $1 "\",";
#     		print "\"Il/E/" arr[i] "\": \"il est " $1 "\",";
# 		print "\"KI/E/" arr[i] "\": \"qui est " $1 "\",";
#     		if (arr[i] ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
#     		    print "\"L" arr[i] "\": \"l'" $1 "\",";
# 		    print "\"T*" $2 "\": \"d'" $1 "\",";
#     		    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
#     		}
#     		if (arr[i] ~ /^[^aeiouéàâêïîôh]/ && arr[i] !~ /é$/){
#     		    print "\"L/" arr[i] "\": \"le " $1 "\",";
# 		    print "\"T*/" $2 "\": \"de " $1 "\",";
#     		    print "\"KL/" arr[i] "\": \"que le " $1 "\",";
#     		}
#     	    }
#     	}
## *** Singulier indéfini
#     	if ($5 ~ /s/ && $4 ~ /^$/)
#     	{
#     	    if ($1 !~ /é$/ ){
#     	    print "\"" $2 "\": \"" $1 "\",";
#     	    for (i in arr){
# 		print "\"" arr[i] "\": \"" $1 "\",";}

#     	    }
#     	    print "\"SE/" $2 "\": \"c'est " $1 "\",";
#     	    print "\"Il/E/" $2 "\": \"il est " $1 "\",";
#     	    print "\"KI/E/" $2 "\": \"qui est " $1 "\",";
#     	    if ($1 ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
#     		print "\"L" $2 "\": \"l'" $1 "\",";
#     		print "\"T*" $2 "\": \"d'" $1 "\",";
#     		print "\"KL" $2 "\": \"que l'" $1 "\",";
#     	    }
#     	    if ($1 ~ /^[^aeiouéàâêïîôh]/ && $1 !~ /é$/){
#     		print "\"L/" $2 "\": \"le " $1 "\",";
#     		print "\"T*/" $2 "\": \"de " $1 "\",";
#     		print "\"KL/" $2 "\": \"que le " $1 "\",";
#     	    }
#     	    for (i in arr){
#     		print "\"SE/" arr[i] "\": \"c'est " $1 "\",";
#     		print "\"Il/E/" arr[i] "\": \"il est " $1 "\",";
# 		print "\"KI/E/" arr[i] "\": \"qui est " $1 "\",";
#     		if (arr[i] ~ /^[aeiouéàâêïîô]/ && $1 !~ /é$/){
#     		    print "\"L" arr[i] "\": \"l'" $1 "\",";
# 		    print "\"T*" $2 "\": \"d'" $1 "\",";
#     		    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
#     		}
#     		if (arr[i] ~ /^[^aeiouéàâêïîôh]/ && arr[i] !~ /é$/){
#     		    print "\"L/" arr[i] "\": \"le " $1 "\",";
# 		    print "\"T*/" $2 "\": \"de " $1 "\",";
#     		    print "\"KL/" arr[i] "\": \"que le " $1 "\",";
#     		}
#     	    }
#     	}

## *** Masculin  pluriel
#     	if ($5 ~ /p/ && $4 ~ /m/)
#     	{
#     	    if ($1 !~ /és$/ ){
#     	    print "\"" $2 "\": \"" $1 "\",";
#     	    for (i in arr){
# 		print "\"" arr[i] "\": \"" $1 "\",";}
#     	    }

#     	    print "\"Il/SOn/" $2 "\": \"ils sont " $1 "\",";
#     	    print "\"KI/SOn/" $2 "\": \"qui sont " $1 "\",";
#     	    print "\"LE/" $2 "\": \"les " $1 "\",";
#     	    print "\"KLE/" $2 "\": \"que les " $1 "\",";
#     	    for (i in arr){
#     		print "\"Il/SOn/" arr[i] "\": \"ils sont " $1 "\",";
# 		print "\"KI/SOn/" arr[i] "\": \"qui sont " $1 "\",";
#     		print "\"LE/" arr[i] "\": \"les " $1 "\",";
#     		print "\"KLE/" arr[i] "\": \"que les " $1 "\",";
#     	    }
#     	}
## *** Féminin   pluriel
#     	if ($5 ~ /p/ && $4 ~ /f/)
#     	{
#     	    if ($1 !~ /ées$/ ){
#     	    print "\"" $2 "\": \"" $1 "\",";
#     	    for (i in arr){
# 		print "\"" arr[i] "\": \"" $1 "\",";}

#     	    }

#     	    print "\"El/SOn/" $2 "\": \"elles sont " $1 "\",";
#     	    print "\"LE/" $2 "\": \"les " $1 "\",";
#     	    print "\"KLE/" $2 "\": \"que les " $1 "\",";
#     	    for (i in arr){
#     		print "\"El/SOn/" arr[i] "\": \"elles sont " $1 "\",";
#     		print "\"LE/" arr[i] "\": \"les " $1 "\",";
#     		print "\"KLE/" $2 "\": \"que les " $1 "\",";
#     	    }
#     	}
## *** Féminin   singulier
#     	if ($5 ~ /s/ && $4 ~ /f/)
#     	{
#     	    if ($1 !~ /ée$/ ){
#     	    print "\"" $2 "\": \"" $1 "\",";
#     	    for (i in arr){
# 		print "\"" arr[i] "\": \"" $1 "\",";}

#     	    }

#     	    print "\"SE/" $2 "\": \"c'est " $1 "\",";
#     	    print "\"El/E/" $2 "\": \"elle est " $1 "\",";
#     	    if ($1 ~ /^[aeiouéàâêïîô]/ && $1 !~ /ée$/){
#     		print "\"L" $2 "\": \"l'" $1 "\",";
#     		print "\"KL" $2 "\": \"que l'" $1 "\",";
#     	    }
#     	    if ($1 ~ /^[^aeiouéàâêïîôh]/ && $1 !~ /ée$/){
#     		print "\"LA/" $2 "\": \"la " $1 "\",";
#     		print "\"KLA/" $2 "\": \"que la " $1 "\",";
#     	    }
#     	    for (i in arr){
#     		print "\"SE/" arr[i] "\": \"c'est " $1 "\",";
#     		print "\"El/E/" arr[i] "\": \"elle est " $1 "\",";
#     		if (arr[i] ~ /^[aeiouéàâêïîô]/ && $1 !~ /ée$/){
#     		    print "\"L" arr[i] "\": \"l'" $1 "\",";
#     		    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
#     		}
#     		if (arr[i] ~ /^[^aeiouéàâêïîôh]/ && arr[i] !~ /ée$/){
#     		    print "\"LA/" arr[i] "\": \"la " $1 "\",";
#     		    print "\"KLA/" arr[i] "\": \"que la " $1 "\",";
#     		}
#     	    }
#     	}



## ** fin du script
    }
}
## * Uniq
#BEGIN{FS=":"}{x[$1] = $0; temoin[$1]++;}END{for (unique in x)if ( temoin[unique] == 1){print x[unique];}}
## * Uniq Ulexique500

# BEGIN{FS="\t"}
# {
#     if ($3 ~ /NOM/)
#     {
# 	x[$2] = $0;
# 	temoin[$2]++;
# 	print $0  >> "Ulexique500_Noms.txt";
#     }

# }
# END{
#     for (unique in x)
# 	if ( temoin[unique] == 1)
# 	{print x[unique] >> "Ulexique500_Noms_Uniq.txt";}
# }
## * Doublons
#BEGIN{FS=":"}{if (x[$1]) {doublon[$1]++;print $0;if (doublon[$1] == 1){print x[$1]}}x[$1] = $0}
# BEGIN{
#     FS=":";
#     OFS=":";}
# {
#     if (x[$1])
#     {
# 	compteur[$1]++;
# 	print compteur[$1],$0;#,compteur[$1];
# 	if (compteur[$1] == 1)
# 	{
# 	    print compteur[$1],x[$1];
# 	}
# 	# if (compteur[$1] > 1)
# 	# {
# 	#     print compteur[$1],x[$1];
# 	# }

#     }
#     x[$1]=$0;
#     # compteur[$1]++;
# }
## * Doublons Ulexique500

# BEGIN{
#     FS="\t";
#     OFS="\t";}
# {
#     if (x[$2])
#     {
# 	compteur[$2]++;
# 	print $0;#,compteur[$1];
# 	if (compteur[$2] == 1)
# 	{
# 	    print x[$2];
# 	}
# 	# if (compteur[$1] > 1)
# 	# {
# 	#     print compteur[$1],x[$1];
# 	# }

#     }
#     x[$2]=$0;
#     # compteur[$1]++;
# }

#$2 ~ /abaisse/ {print $0}
## * Tentatives
    # if ($3 ~ /ADV/)
    # {
    # 	print "\"" $2 "\": \"" $1 "\",";
    # 	for (i in arr){print "\"" arr[i] "\": \"" $1 "\",";}
    # 	if ($1 ~ /ement$/ && $1 ~ /^[aeiouéàâêïîô]/)
    # 	{
    # 	    print "\"K" $2 "\": \"qu'" $1 "\",";
    # 	    print "\"T*" $2 "\": \"d'" $1 "\",";
    # 	    for (i in arr){
    # 		print "\"T*" arr[i] "\": \"d'" $1 "\",";
    # 		print "\"K" arr[i] "\": \"qu'" $1 "\",";
    # 	    }
    # 	}
    # 	sub(/MAn/, "DC", $2);		#print "\"" $2 "\": \"" $1 "\",";
    # 	sub(/KO\/MO/, "KMO", $2);	#print "\"" $2 "\": \"" $1 "\",";
    # 	sub(/^KO\/MI/, "KMI", $2);	#print "\"" $2 "\": \"" $1 "\",";
    # 	sub(/^KO\/MU/, "KMU", $2);	#print "\"" $2 "\": \"" $1 "\",";
    # 	sub(/^KO\/ME/, "KME", $2);	#print "\"" $2 "\": \"" $1 "\",";
    # 	print "\"" $2 "\": \"" $1 "\",";
    # 	for (i in arr){print "\"" arr[i] "\": \"" $1 "\",";}
    # 	if ($1 ~ /ement$/ && $1 ~ /^[aeiouéàâêïîô]/)
    # 	{
    # 	    print "\"K" $2 "\": \"qu'" $1 "\",";
    # 	    print "\"T*" $2 "\": \"d'" $1 "\",";
    # 	    for (i in arr){
    # 		print "\"T*" arr[i] "\": \"d'" $1 "\",";
    # 		print "\"K" arr[i] "\": \"qu'" $1 "\",";}
    # 	}
    # }


# {
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /s/ && $1 ~ /^[^aeiouéàâêïîôhy]/ && $11 > 2 )	# nom m s ^C >2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /s/ && $1 ~ /^[^aeiouéàâêïîôhy]/ && $11 <= 2 )	# nom m s ^C <2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /p/ && $1 ~ /^[^aeiouéàâêïîôhy]/ && $11 > 2 ) # nom m p ^C >2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /p/ && $1 ~ /^[^aeiouéàâêïîôhy]/ && $11 <= 2 )	# nom m p ^C <2
    #if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /s/ && $1 ~ /^[aeiouéàâêïîô]/ && $11 > 2 )	# nom m s ^V >2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /s/ && $1 ~ /^[aeiouéàâêïîô]/ && $11 <= 2 )	# nom m s ^V <2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /p/ && $1 ~ /^[aeiouéàâêïîô]/ && $11 > 2 )	# nom m p ^V >2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /p/ && $1 ~ /^[aeiouéàâêïîô]/ && $11 <= 2 )	# nom m p ^V <2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /s/ && $1 ~ /^[h]/ && $11 <= 2 )		# nom m s ^H <2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /s/ && $1 ~ /^[h]/ && $11 > 2 )			# nom m s ^H >2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /p/ && $1 ~ /^[h]/ && $11 <= 2 )		# nom m p ^H <2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /p/ && $1 ~ /^[h]/ && $11 > 2 )			# nom m p ^H >2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /s/ && $1 ~ /^[y]/ && $11 <= 2 )		# nom m s ^y <2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /s/ && $1 ~ /^[y]/ && $11 > 2 )			# nom m s ^y >2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /p/ && $1 ~ /^[y]/ && $11 <= 2 )		# nom m p ^y <2
    # if ( $3 ~ /NOM/ && $4 ~ /m/ && $5 ~ /p/ && $1 ~ /^[y]/ && $11 > 2 )			# nom m p ^y >2
	# ### FÉMININ
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /s/ && $1 ~ /^[^aeiouéàâêïîôhy]/ && $11 > 2 )	# nom f s ^C >2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /s/ && $1 ~ /^[^aeiouéàâêïîôhy]/ && $11 <= 2 )	# nom f s ^C <2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /p/ && $1 ~ /^[^aeiouéàâêïîôhy]/ && $11 > 2 )	# nom f p ^C >2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /p/ && $1 ~ /^[^aeiouéàâêïîôhy]/ && $11 <= 2 )	# nom f p ^C <2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /s/ && $1 ~ /^[aeiouéàâêïîô]/ && $11 > 2 )	# nom f s ^V >2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /s/ && $1 ~ /^[aeiouéàâêïîô]/ && $11 <= 2 )	# nom f s ^V <2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /p/ && $1 ~ /^[aeiouéàâêïîô]/ && $11 > 2 )	# nom f p ^V >2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /p/ && $1 ~ /^[aeiouéàâêïîô]/ && $11 <= 2 )	# nom f p ^V <2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /s/ && $1 ~ /^[h]/ && $11 <= 2 )		# nom f s ^H <2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /s/ && $1 ~ /^[h]/ && $11 > 2 )			# nom f s ^H >2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /p/ && $1 ~ /^[h]/ && $11 <= 2 )		# nom f p ^H <2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /p/ && $1 ~ /^[h]/ && $11 > 2 )			# nom f p ^H >2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /s/ && $1 ~ /^[y]/ && $11 <= 2 )		# nom f s ^y <2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /s/ && $1 ~ /^[y]/ && $11 > 2 )			# nom f s ^y >2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /p/ && $1 ~ /^[y]/ && $11 <= 2 )		# nom f p ^y <2
    # if ( $3 ~ /NOM/ && $4 ~ /f/ && $5 ~ /p/ && $1 ~ /^[y]/ && $11 > 2 )			# nom f p ^y >2



# uniques seulement
# BEGIN{FS=":"}
# {
#     x[$1] = $0;
#     temoin[$1]++;
# }
# END{
#     for (nimporte in x)
# 	if ( temoin[nimporte] == 1)
# 	{print x[nimporte];}
# }

# doublons
# BEGIN{FS=":"}
# {
#     if (x[$1])
#     {
# 	temoin[$1]++;
# 	print $0;
# 	if (temoin[$1] == 1)
# 	{print x[$1]}
#     }
#     x[$1] = $0
# }
	# if ($5 ~ /p/){
	# print "\"LE/" $2 "\": \"les " $1 "\",";
	# print "\"T*E/" $2 "\": \"des " $1 "\",";
	# print "\"KLE/" $2 "\": \"que les " $1 "\",";
	# print "\"K/T*E/" $2 "\": \"que des " $1 "\",";
	# print "\"KT*E/" $2 "\": \"que des " $1 "\",";}
	# if ($1  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /m/){
	#     print "\"T*U/" $2 "\": \"du " $1 "\",";
	#     print "\"S/" $2 "\": \"ce " $1 "\",";
	#     print "\"K/" $2 "\": \"que " $1 "\",";
	#     print "\"T*/" $2 "\": \"de " $1 "\",";
	#     print "\"L/" $2 "\": \"le " $1 "\",";
	#     print "\"Un/" $2 "\": \"un " $1 "\",";
	#     print "\"An/" $2 "\": \"en " $1 "\",";
	#     if ($2 ~ /^[KPMTFNLR]/){ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);print "\"" ssone "\": \"ce " $1 "\",";}
	#     if ($2 ~ /^[PMTFNLR]/) {ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	#     if ($2 ~ /^[LR]/)	   {ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	#     if ($2 ~ /^[FN]/)	   {tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}}
	# if ($A  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /f/){
	#     print "\"T*U/" $2 "\": \"du " $1 "\",";
	#     print "\"ST/" $2 "\": \"cette " $1 "\",";
	#     print "\"K/" $2 "\": \"que " $1 "\",";
	#     print "\"T*/" $2 "\": \"de " $1 "\",";
	#     print "\"An/" $2 "\": \"en " $1 "\",";
	#     if ($2 ~ /^[PMTFNLR]/) {ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	#     if ($2 ~ /^[LR]/)	   {ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	#     if ($2 ~ /^[FN]/)	   {tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	#     if ($2 ~ /^[FN]/)      {ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2);print "\"" ssone "\": \"cette " $1 "\",";}}
	# if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $ 4 ~ /m/ ){
	# print         "\"L" $2 "\": \"l'" $1 "\",";
	# print       "\"Un/" $2 "\": \"un " $1 "\",";
	# print         "\"K" $2 "\": \"qu'" $1 "\",";
	# print      "\"KUn/" $2 "\": \"qu'un " $1 "\",";
	# print        "\"ST" $2 "\": \"cet " $1 "\",";
	# print       "\"ST/" $2 "\": \"cet " $1 "\",";
	# print        "\"T*" $2 "\": \"d'" $1 "\",";
	# print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	# print        "\"KL" $2 "\": \"que l'" $1 "\",";
	# print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	# print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";
        # print	    "\"An/" $2 "\": \"en " $1 "\",";}
	# if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $ 4 ~ /f/ ){
	# print         "\"L" $2 "\": \"l'" $1 "\",";
	# print      "\"UnC/" $2 "\": \"une " $1 "\",";
	# print         "\"K" $2 "\": \"qu'" $1 "\",";
	# print      "\"KUn/" $2 "\": \"qu'une " $1 "\",";
	# print        "\"ST" $2 "\": \"cette " $1 "\",";
	# print       "\"ST/" $2 "\": \"cette " $1 "\",";
	# print        "\"T*" $2 "\": \"d'" $1 "\",";
	# print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	# print        "\"KL" $2 "\": \"que l'" $1 "\",";
	# print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	# print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";
	# print	    "\"An/" $2 "\": \"en " $1 "\",";}


#     if ($3 ~ /NOM/ && $1 !~ /^h/)
#     {


# 	if ($5 ~ /s/){							# Si singulier
# 	    if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
# 		print "\"" $2 "\": \"" $1 "\",";}			# le sortir sans article
# 	}

# # ### Premier moulinage

# 	if ($5 ~ /p/){							# Si pluriel
# 	    print "\"LE/" $2 "\": \"les " $1 "\",";
# 	    print "\"T*E/" $2 "\": \"des " $1 "\",";
# 	    print "\"KLE/" $2 "\": \"que les " $1 "\",";
# 	    print "\"K/T*E/" $2 "\": \"que des " $1 "\",";
# 	    print "\"KT*E/" $2 "\": \"que des " $1 "\",";
# 	}
# 	if ($1  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /m/){		# si masclin singulier et ne commence pas avec une voyelle
# 	    print "\"T*U/" $2 "\": \"du " $1 "\",";
# 	    print "\"Un/" $2 "\": \"un " $1 "\",";
# 	    if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
# 		print "\"L/" $2 "\": \"le " $1 "\",";
# 		print "\"T*/" $2 "\": \"de " $1 "\",";
# 		print "\"An/" $2 "\": \"en " $1 "\",";
# 		print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
# 		print "\"K/" $2 "\": \"que " $1 "\",";
# 		print "\"S/" $2 "\": \"ce " $1 "\",";
# 	    }								# S'il y a moyen de faire élision avec CE QUE DE
# 	    if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
# 	    if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
# 	    if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]é$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
# 	    if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]é$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
# 	}
# 	if ($A  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /f/){		# si féminin singulier et ne commence pas avec une voyelle
# 	    print "\"LA/" $2 "\": \"la " $1 "\",";
# 	    print "\"UnC/" $2 "\": \"une " $1 "\",";
# 	    print "\"ST/" $2 "\": \"cette " $1 "\",";
# 	    if ($1 !~ /[^i][^t]ée$/ ){
# 		print "\"T*/" $2 "\": \"de " $1 "\",";
# 		print "\"An/" $2 "\": \"en " $1 "\",";
# 		print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
# 		print "\"K/" $2 "\": \"que " $1 "\",";
# 	    }
# 	    if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
# 	    if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]ée$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
# 	    if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]ée$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
# 	    if ($2 ~ /^[FN]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2); print "\"" ssone "\": \"cette " $1 "\",";}
# 	}
# 	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/ ){		# si masclin singulier commence avec une voyelle
# 	    print       "\"Un/" $2 "\": \"un " $1 "\",";
# 	    print      "\"KUn/" $2 "\": \"qu'un " $1 "\",";
# 	    print        "\"ST" $2 "\": \"cet " $1 "\",";
# 	    print       "\"ST/" $2 "\": \"cet " $1 "\",";
# 	    if ($1 !~ /[^i][^t]é$/ ){
# 		print        "\"T*" $2 "\": \"d'" $1 "\",";
# 		print	    "\"An/" $2 "\": \"en " $1 "\",";
# 		print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
# 		print         "\"L" $2 "\": \"l'" $1 "\",";
# 		print         "\"K" $2 "\": \"qu'" $1 "\",";
# 		print       "\"T*L" $2 "\": \"de l'" $1 "\",";
# 		print        "\"KL" $2 "\": \"que l'" $1 "\",";
# 		print       "\"KT*" $2 "\": \"que d'" $1 "\",";
# 		print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
# 	}
# 	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/ ){		# si féminin singulier commence avec une voyelle
# 	    print      "\"UnC/" $2 "\": \"une " $1 "\",";
# 	    print      "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
# 	    print        "\"ST" $2 "\": \"cette " $1 "\",";
# 	    print       "\"ST/" $2 "\": \"cette " $1 "\",";
# 	    if ($1 !~ /[^i][^t]ée$/ ){
# 		print        "\"T*" $2 "\": \"d'" $1 "\",";
# 		print	    "\"An/" $2 "\": \"en " $1 "\",";
# 		print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
# 		print         "\"L" $2 "\": \"l'" $1 "\",";
# 		print         "\"K" $2 "\": \"qu'" $1 "\",";
# 		print       "\"T*L" $2 "\": \"de l'" $1 "\",";
# 		print        "\"KL" $2 "\": \"que l'" $1 "\",";
# 		print       "\"KT*" $2 "\": \"que d'" $1 "\",";
# 		print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
# 	}

# # ###									# Les contraction de base : D ID C KM			NOM GENERAL
# 	sub(/SYOn$/, "C", $2);		#print "\"" $2 "\": \"" $1 "\",";
# 	sub(/KO\/MO/, "KMO", $2);	#print "\"" $2 "\": \"" $1 "\",";
# 	sub(/^KO\/MI/, "KMI", $2);	#print "\"" $2 "\": \"" $1 "\",";
# 	sub(/^KO\/MU/, "KMU", $2);	#print "\"" $2 "\": \"" $1 "\",";
# 	sub(/^KO\/ME/, "KME", $2);	#print "\"" $2 "\": \"" $1 "\",";
# 	if ($11 > 2){
# 	    sub(/\/P\*L$/, "D", $2);	#print "\"" $2 "\": \"" $1 "\",";
# 	    sub(/\/P\*R$/, "D", $2);	#print "\"" $2 "\": \"" $1 "\",";
# 	    sub(/\/T\*R$/, "D", $2);	#print "\"" $2 "\": \"" $1 "\",";
# 	    sub(/\/T\*L$/, "D", $2);	#print "\"" $2 "\": \"" $1 "\",";
# 	    sub(/I\/TE$/, "ID", $2);	#print "\"" $2 "\": \"" $1 "\",";
# 	    if ($2 !~ /[DC]\/D$/ ){
# 		sub(/\/D$/, "D", $2);}	#print "\"" $2 "\": \"" $1 "\",";}
# 	    if ($2 !~ /[DC]\/C$/ ){
# 		sub(/\/C$/, "C", $2);}	#print "\"" $2 "\": \"" $1 "\",";}

# 	}

# # ### Deuxième moulinage
# 	if ($5 ~ /s/){							# Si singulier
# 	    if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
# 		print "\"" $2 "\": \"" $1 "\",";}			# le sortir sans article
# 	}
# 	if ($5 ~ /p/){							# Si pluriel
# 	    print "\"LE/" $2 "\": \"les " $1 "\",";
# 	    print "\"T*E/" $2 "\": \"des " $1 "\",";
# 	    print "\"KLE/" $2 "\": \"que les " $1 "\",";
# 	    print "\"K/T*E/" $2 "\": \"que des " $1 "\",";
# 	    print "\"KT*E/" $2 "\": \"que des " $1 "\",";
# 	}
# 	if ($1  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /m/){		# si masclin singulier et ne commence pas avec une voyelle
# 	    print "\"T*U/" $2 "\": \"du " $1 "\",";
# 	    print "\"Un/" $2 "\": \"un " $1 "\",";
# 	    if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
# 		print "\"L/" $2 "\": \"le " $1 "\",";
# 		print "\"T*/" $2 "\": \"de " $1 "\",";
# 		print "\"An/" $2 "\": \"en " $1 "\",";
# 		print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
# 		print "\"K/" $2 "\": \"que " $1 "\",";
# 		print "\"S/" $2 "\": \"ce " $1 "\",";
# 	    }								# S'il y a moyen de faire élision avec CE QUE DE
# 	    if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
# 	    if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
# 	    if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]é$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
# 	    if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]é$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
# 	}
# 	if ($A  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /f/){		# si féminin singulier et ne commence pas avec une voyelle
# 	    print "\"LA/" $2 "\": \"la " $1 "\",";
# 	    print "\"UnC/" $2 "\": \"une " $1 "\",";
# 	    print "\"ST/" $2 "\": \"cette " $1 "\",";
# 	    if ($1 !~ /[^i][^t]ée$/ ){
# 		print "\"T*/" $2 "\": \"de " $1 "\",";
# 		print "\"An/" $2 "\": \"en " $1 "\",";
# 		print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
# 		print "\"K/" $2 "\": \"que " $1 "\",";
# 	    }
# 	    if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
# 	    if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]ée$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
# 	    if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]ée$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
# 	    if ($2 ~ /^[FN]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2); print "\"" ssone "\": \"cette " $1 "\",";}
# 	}
# 	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/ ){		# si masclin singulier commence avec une voyelle
# 	    print       "\"Un/" $2 "\": \"un " $1 "\",";
# 	    print      "\"KUn/" $2 "\": \"qu'un " $1 "\",";
# 	    print        "\"ST" $2 "\": \"cet " $1 "\",";
# 	    print       "\"ST/" $2 "\": \"cet " $1 "\",";
# 	    if ($1 !~ /[^i][^t]é$/ ){
# 		print        "\"T*" $2 "\": \"d'" $1 "\",";
# 		print	    "\"An/" $2 "\": \"en " $1 "\",";
# 		print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
# 		print         "\"L" $2 "\": \"l'" $1 "\",";
# 		print         "\"K" $2 "\": \"qu'" $1 "\",";
# 		print       "\"T*L" $2 "\": \"de l'" $1 "\",";
# 		print        "\"KL" $2 "\": \"que l'" $1 "\",";
# 		print       "\"KT*" $2 "\": \"que d'" $1 "\",";
# 		print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
# 	}
# 	if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/ ){		# si féminin singulier commence avec une voyelle
# 	    print      "\"UnC/" $2 "\": \"une " $1 "\",";
# 	    print      "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
# 	    print        "\"ST" $2 "\": \"cette " $1 "\",";
# 	    print       "\"ST/" $2 "\": \"cette " $1 "\",";
# 	    if ($1 !~ /[^i][^t]ée$/ ){
# 		print        "\"T*" $2 "\": \"d'" $1 "\",";
# 		print	    "\"An/" $2 "\": \"en " $1 "\",";
# 		print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
# 		print         "\"L" $2 "\": \"l'" $1 "\",";
# 		print         "\"K" $2 "\": \"qu'" $1 "\",";
# 		print       "\"T*L" $2 "\": \"de l'" $1 "\",";
# 		print        "\"KL" $2 "\": \"que l'" $1 "\",";
# 		print       "\"KT*" $2 "\": \"que d'" $1 "\",";
# 		print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
# 	}

# # ### Tableau des contractions
# 	if ($11 > 2){
# 	    for (i in arr)
# 	    {

# 		if ($5 ~ /s/){
# 		    if ($1 !~ /[^i][^t]ée*$/){
# 			print "\"" arr[i] "\": \"" $1 "\",";}
# 		}
# 		if ($5 ~ /p/){							# Si pluriel
# 		    print "\"LE/" arr[i] "\": \"les " $1 "\",";
# 		    print "\"T*E/" arr[i] "\": \"des " $1 "\",";
# 		    print "\"KLE/" arr[i] "\": \"que les " $1 "\",";
# 		    print "\"K/T*E/" arr[i] "\": \"que des " $1 "\",";
# 		    print "\"KT*E/" arr[i] "\": \"que des " $1 "\",";
# 		}
# 		if ($1  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /m/){		# si masclin singulier et ne commence pas avec une voyelle
# 		    print "\"T*U/" arr[i] "\": \"du " $1 "\",";
# 		    print "\"Un/" arr[i] "\": \"un " $1 "\",";
# 		    if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
# 			print "\"L/" arr[i] "\": \"le " $1 "\",";
# 			print "\"T*/" arr[i] "\": \"de " $1 "\",";
# 			print "\"An/" arr[i] "\": \"en " $1 "\",";
# 			print "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 			print "\"K/" arr[i] "\": \"que " $1 "\",";
# 			print "\"S/" arr[i] "\": \"ce " $1 "\",";
# 		    }								# S'il y a moyen de faire élision avec CE QUE DE
# 		    if (arr[i] ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,arr[i]);  print "\"" ssone "\": \"ce " $1 "\",";}
# 		    if (arr[i] ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, arr[i]);  print "\"" ksone "\": \"que " $1 "\",";}
# 		    if (arr[i] ~ /^[LR]/ && $1 !~ /[^i][^t]é$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, arr[i]);	print "\"" ttsone "\": \"de " $1 "\",";}
# 		    if (arr[i] ~ /^[FN]/ && $1 !~ /[^i][^t]é$/)		{tsone = gensub(/([FN])/, "T\\1", 1, arr[i]);	print "\"" tsone "\": \"de " $1 "\",";}
# 		}
# 		if ($A  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /f/){		# si féminin singulier et ne commence pas avec une voyelle
# 		    print "\"LA/" arr[i] "\": \"la " $1 "\",";
# 		    print "\"UnC/" arr[i] "\": \"une " $1 "\",";
# 		    print "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 		    if ($1 !~ /[^i][^t]ée$/ ){
# 			print "\"T*/" arr[i] "\": \"de " $1 "\",";
# 			print "\"An/" arr[i] "\": \"en " $1 "\",";
# 			print "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 			print "\"K/" arr[i] "\": \"que " $1 "\",";
# 		    }
# 		    if (arr[i] ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, arr[i]);  print "\"" ksone "\": \"que " $1 "\",";}
# 		    if (arr[i] ~ /^[LR]/ && $1 !~ /[^i][^t]ée$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, arr[i]);	print "\"" ttsone "\": \"de " $1 "\",";}
# 		    if (arr[i] ~ /^[FN]/ && $1 !~ /[^i][^t]ée$/)		{tsone = gensub(/([FN])/, "T\\1", 1, arr[i]);	print "\"" tsone "\": \"de " $1 "\",";}
# 		    if (arr[i] ~ /^[FN]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,arr[i]); print "\"" ssone "\": \"cette " $1 "\",";}
# 		}
# 		if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/ ){		# si masclin singulier commence avec une voyelle
# 		    print       "\"Un/" arr[i] "\": \"un " $1 "\",";
# 		    print      "\"KUn/" arr[i] "\": \"qu'un " $1 "\",";
# 		    print        "\"ST" arr[i] "\": \"cet " $1 "\",";
# 		    print       "\"ST/" arr[i] "\": \"cet " $1 "\",";
# 		    if ($1 !~ /[^i][^t]é$/ ){
# 			print        "\"T*" arr[i] "\": \"d'" $1 "\",";
# 			print	    "\"An/" arr[i] "\": \"en " $1 "\",";
# 			print	   "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 			print         "\"L" arr[i] "\": \"l'" $1 "\",";
# 			print         "\"K" arr[i] "\": \"qu'" $1 "\",";
# 			print       "\"T*L" arr[i] "\": \"de l'" $1 "\",";
# 			print        "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 			print       "\"KT*" arr[i] "\": \"que d'" $1 "\",";
# 			print      "\"KT*L" arr[i] "\": \"que de l'" $1 "\",";}
# 		}
# 		if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/ ){		# si féminin singulier commence avec une voyelle
# 		    print      "\"UnC/" arr[i] "\": \"une " $1 "\",";
# 		    print      "\"KUnC/" arr[i] "\": \"qu'une " $1 "\",";
# 		    print        "\"ST" arr[i] "\": \"cette " $1 "\",";
# 		    print       "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 		    if ($1 !~ /[^i][^t]ée$/ ){
# 			print        "\"T*" arr[i] "\": \"d'" $1 "\",";
# 			print	    "\"An/" arr[i] "\": \"en " $1 "\",";
# 			print	   "\"KAn/" arr[i] "\": \"qu'en " $1 "\",";
# 			print         "\"L" arr[i] "\": \"l'" $1 "\",";
# 			print         "\"K" arr[i] "\": \"qu'" $1 "\",";
# 			print       "\"T*L" arr[i] "\": \"de l'" $1 "\",";
# 			print        "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 			print       "\"KT*" arr[i] "\": \"que d'" $1 "\",";
# 			print      "\"KT*L" arr[i] "\": \"que de l'" $1 "\",";}
# 		}
# 	    }
# 	}
#     }




	# if ($5 ~ /s/){							# Si singulier
	#     if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
	# 	print "\"" $2 "\": \"" $1 "\",";}			# le sortir sans article
	# }
	# if ($5 ~ /p/){							# Si pluriel
	#     print "\"LE/" $2 "\": \"les " $1 "\",";
	#     print "\"T*E/" $2 "\": \"des " $1 "\",";
	#     print "\"KLE/" $2 "\": \"que les " $1 "\",";
	#     print "\"K/T*E/" $2 "\": \"que des " $1 "\",";
	#     print "\"KT*E/" $2 "\": \"que des " $1 "\",";
	# }
	# if ($1  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /m/){		# si masclin singulier et ne commence pas avec une voyelle
	#     print "\"T*U/" $2 "\": \"du " $1 "\",";
	#     print "\"Un/" $2 "\": \"un " $1 "\",";
	#     if ($1 !~ /[^i][^t]é$/ ){					# Si se termine avec é mais n'est pas ité
	# 	print "\"L/" $2 "\": \"le " $1 "\",";
	# 	print "\"T*/" $2 "\": \"de " $1 "\",";
	# 	print "\"An/" $2 "\": \"en " $1 "\",";
	# 	print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	# 	print "\"K/" $2 "\": \"que " $1 "\",";
	# 	print "\"S/" $2 "\": \"ce " $1 "\",";
	#     }								# S'il y a moyen de faire élision avec CE QUE DE
	#     if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
	#     if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	#     if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]é$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	#     if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]é$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	# }
	# if ($A  ~ /^[^aeiouéàâêïîôh]/ && $5 ~ /s/ && $4 ~ /f/){		# si féminin singulier et ne commence pas avec une voyelle
	#     print "\"LA/" $2 "\": \"la " $1 "\",";
	#     print "\"UnC/" $2 "\": \"une " $1 "\",";
	#     print "\"ST/" $2 "\": \"cette " $1 "\",";
	#     if ($1 !~ /[^i][^t]ée$/ ){
	# 	print "\"T*/" $2 "\": \"de " $1 "\",";
	# 	print "\"An/" $2 "\": \"en " $1 "\",";
	# 	print "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	# 	print "\"K/" $2 "\": \"que " $1 "\",";
	#     }
	#     if ($2 ~ /^[PMTFNLR]/)				{ksone = gensub(/([PMTFNLR])/, "K\\1", 1, $2);  print "\"" ksone "\": \"que " $1 "\",";}
	#     if ($2 ~ /^[LR]/ && $1 !~ /[^i][^t]ée$/)		{ttsone = gensub(/([LR])/, "T*\\1", 1, $2);	print "\"" ttsone "\": \"de " $1 "\",";}
	#     if ($2 ~ /^[FN]/ && $1 !~ /[^i][^t]ée$/)		{tsone = gensub(/([FN])/, "T\\1", 1, $2);	print "\"" tsone "\": \"de " $1 "\",";}
	#     if ($2 ~ /^[FN]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2); print "\"" ssone "\": \"cette " $1 "\",";}
	# }
	# if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /m/ ){		# si masclin singulier commence avec une voyelle
	#     print       "\"Un/" $2 "\": \"un " $1 "\",";
	#     print      "\"KUn/" $2 "\": \"qu'un " $1 "\",";
	#     print        "\"ST" $2 "\": \"cet " $1 "\",";
	#     print       "\"ST/" $2 "\": \"cet " $1 "\",";
	#     if ($1 !~ /[^i][^t]é$/ ){
	# 	print        "\"T*" $2 "\": \"d'" $1 "\",";
	# 	print	    "\"An/" $2 "\": \"en " $1 "\",";
	# 	print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	# 	print         "\"L" $2 "\": \"l'" $1 "\",";
	# 	print         "\"K" $2 "\": \"qu'" $1 "\",";
	# 	print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	# 	print        "\"KL" $2 "\": \"que l'" $1 "\",";
	# 	print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	# 	print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
	# }
	# if ($1 ~ /^[aeiouéàâêïîô]/ && $5 ~ /s/ && $4 ~ /f/ ){		# si féminin singulier commence avec une voyelle
	#     print      "\"UnC/" $2 "\": \"une " $1 "\",";
	#     print      "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	#     print        "\"ST" $2 "\": \"cette " $1 "\",";
	#     print       "\"ST/" $2 "\": \"cette " $1 "\",";
	#     if ($1 !~ /[^i][^t]ée$/ ){
	# 	print        "\"T*" $2 "\": \"d'" $1 "\",";
	# 	print	    "\"An/" $2 "\": \"en " $1 "\",";
	# 	print	   "\"KAn/" $2 "\": \"qu'en " $1 "\",";
	# 	print         "\"L" $2 "\": \"l'" $1 "\",";
	# 	print         "\"K" $2 "\": \"qu'" $1 "\",";
	# 	print       "\"T*L" $2 "\": \"de l'" $1 "\",";
	# 	print        "\"KL" $2 "\": \"que l'" $1 "\",";
	# 	print       "\"KT*" $2 "\": \"que d'" $1 "\",";
	# 	print      "\"KT*L" $2 "\": \"que de l'" $1 "\",";}
	# }
## * Catégories
# 4_cgram
# ADJ
# ADJ:dem
# ADJ:ind
# ADJ:int

#  1_ortho
#  2_steno
#  3_cgram
#  4_genre
#  5_nombre
#  6_infover
#  7_cgramortho
#  8_lemme
#  9_syll
#  10_orthosyll
#  11_nbsyll
#  12_freqlemfilms2
#  13_freqlemlivres
#  14_freqfilms2
#  15_freqlivres


# ADJ:num
# ADJ:pos
# ADV
# ART:def
# ART:ind
# AUX
# CON
# LIA
# NOM
# ONO
# PRE
# PRO:dem
# PRO:ind
# PRO:int
# PRO:per
# PRO:pos
# PRO:rel
# VER
