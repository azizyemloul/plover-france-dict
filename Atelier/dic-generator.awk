#!/usr/bin/awk -f
## * Appels de fonction
#brute();
#verbes();
#noms();

#adjectifs();
## * BEGINS
#BEGIN{FS="\t";OFS="\t"}
#BEGIN{FS="\t";}

# BEGIN{
#     FS="\t";
#     # ### Les contractions CV1/CV2 = CCV2 quand V2 = V1 pour les mots de	       > 2 syll
# }
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
		print "\"POUl/" $2 "\": \"pour " $1 "\",";
		print "\"A/F*OIl/P*O/" $2 "\": \"avoir beau" $1 "\",";
		print "\"T*" $2 "\": \"d'" $1 "\",";
		print "\"A/FIn/T*" $2 "\": \"afin d'" $1 "\",";
		print "\"A/F*An/T*" $2 "\": \"avant d'" $1 "\",";
		print "\"L" $2 "\": \"l'" $1 "\",";
		print "\"N" $2 "\": \"n'" $1 "\",";
		print "\"S" $2 "\": \"s'" $1 "\",";
		print "\"M" $2 "\": \"m'" $1 "\",";
		print "\"T" $2 "\": \"t'" $1 "\",";

		print "\"KL" $2 "\": \"que l'" $1 "\",";
		print "\"T*L" $2 "\": \"de l'" $1 "\",";
		print "\"T*LE/" $2 "\": \"de les " $1 "\",";
		print "\"T*/LE/" $2 "\": \"de les " $1 "\",";
		print "\"NL" $2 "\": \"ne l'" $1 "\",";
		print "\"KT*" $2 "\": \"que d'" $1 "\",";
		print "\"TN" $2 "\": \"de n'" $1 "\",";
		print "\"TN/PA" $2 "\": \"de ne pas " $1 "\",";
		print "\"KN" $2 "\": \"que n'" $1 "\",";
		print "\"KT" $2 "\": \"que t'" $1 "\",";
		print "\"KM" $2 "\": \"que m'" $1 "\",";
		print "\"A/" $2 "\": \"à " $1 "\",";

	    }

	    if ($1 ~/^[^aeiouéàâêïîô]/){
		print "\"" $2 "\": \"" $1 "\",";
		print "\"POUl/" $2 "\": \"pour " $1 "\",";
		print "\"A/F*OIl/P*O/" $2 "\": \"avoir beau" $1 "\",";

		print "\"T*/" $2 "\": \"de " $1 "\",";
		print "\"A/FIn/T*/" $2 "\": \"afin de " $1 "\",";
		print "\"A/F*An/T*/" $2 "\": \"avant de " $1 "\",";
		print "\"L/" $2 "\": \"le " $1 "\",";
		print "\"N/" $2 "\": \"ne " $1 "\",";
		print "\"M/" $2 "\": \"me " $1 "\",";
		print "\"T/" $2 "\": \"te " $1 "\",";

		print "\"KL/" $2 "\": \"que le " $1 "\",";
		print "\"T*L/" $2 "\": \"de le " $1 "\",";
		print "\"T*LE/" $2 "\": \"de les " $1 "\",";
		print "\"T*/LE/" $2 "\": \"de les " $1 "\",";
		print "\"KT*/" $2 "\": \"que de " $1 "\",";
		print "\"TN/" $2 "\": \"de ne " $1 "\",";
		print "\"KN/" $2 "\": \"que ne " $1 "\",";
		print "\"A/" $2 "\": \"à " $1 "\",";
		print "\"S/" $2 "\": \"se " $1 "\",";
		print "\"M/" $2 "\": \"me " $1 "\",";
		print "\"T/" $2 "\": \"te " $1 "\",";

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
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Y/" $2 "\": \"je " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KY" $2 "\": \"que j'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KY/" $2 "\": \"que je " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKY" $2 "\": \"ce que j'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKY/" $2 "\": \"ce que je " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"Y/N" $2 "\": \"je n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Y/N/" $2 "\": \"je ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KY/N" $2 "\": \"que je n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KY/N/" $2 "\": \"que je ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKY/N" $2 "\": \"ce que je n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKY/N/" $2 "\": \"ce que je ne " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"Y/N" $2 "/PA\": \"je n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Y/N/" $2 "/PA\": \"je ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KY/N" $2 "/PA\": \"que je n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KY/N/" $2 "/PA\": \"que je ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKY/N" $2 "/PA\": \"ce que je n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKY/N/" $2 "/PA\": \"ce que je ne " $1 " pas\",";}
	}


## ** Tu
	if ($6 ~ /2s/){
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"TU/" $2 "\": \"tu " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîô]/){print "\"TU/" $2 "\": \"tu " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/TU\": \"" $1 "-tu\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/TU\": \"" $1 "-tu\",";}


	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KTU/" $2 "\": \"que tu " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KTU/" $2 "\": \"que tu " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKTU/" $2 "\": \"ce que tu " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKTU/" $2 "\": \"ce que tu " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"TU/N" $2 "\": \"tu n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"TU/N/" $2 "\": \"tu ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KTU/N" $2 "\": \"que tu n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KTU/N/" $2 "\": \"que tu ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKTU/N" $2 "\": \"ce que tu n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKTU/N/" $2 "\": \"ce que tu ne " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"TU/N" $2 "/PA\": \"tu n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"TU/N/" $2 "/PA\": \"tu ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KTU/N" $2 "/PA\": \"que tu n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KTU/N/" $2 "/PA\": \"que tu ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKTU/N" $2 "/PA\": \"ce que tu n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKTU/N/" $2 "/PA\": \"ce que tu ne " $1 " pas\",";}
	}
## ** Il, On, Ça
	if ($6 ~ /3s/){
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/" $2 "\": \"il " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/" $2 "\": \"il " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/TIl\": \"" $1 "-t-il\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/TIl\": \"" $1 "-t-il\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/" $2 "\": \"qu'il " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/" $2 "\": \"qu'il " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/" $2 "\": \"ce qu'il " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/" $2 "\": \"ce qu'il " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/N" $2 "\": \"il n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/N/" $2 "\": \"il ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/N" $2 "\": \"qu'il n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/N/" $2 "\": \"qu'il ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/N" $2 "\": \"ce qu'il n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/N/" $2 "\": \"ce qu'il ne " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/N" $2 "/PA\": \"il n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/N/" $2 "/PA\": \"il ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/N" $2 "/PA\": \"qu'il n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/N/" $2 "/PA\": \"qu'il ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/N" $2 "/PA\": \"ce qu'il n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/N/" $2 "/PA\": \"ce qu'il ne " $1 " pas\",";}


	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"On/" $2 "\": \"on " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîô]/){print "\"On/" $2 "\": \"on " $1 "\",";}


	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/TOn\": \"" $1 "-t-on\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/TOn\": \"" $1 "-t-on\",";}


	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KOn/" $2 "\": \"qu'on " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KOn/" $2 "\": \"qu'on " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKOn/" $2 "\": \"ce qu'on " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKOn/" $2 "\": \"ce qu'on " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"On/N" $2 "\": \"on n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"On/N/" $2 "\": \"on ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KOn/N" $2 "\": \"qu'on n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KOn/N/" $2 "\": \"qu'on ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKOn/N" $2 "\": \"ce qu'on n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKOn/N/" $2 "\": \"ce qu'on ne " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"On/N" $2 "/PA\": \"on n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"On/N/" $2 "/PA\": \"on ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KOn/N" $2 "/PA\": \"qu'on n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KOn/N/" $2 "/PA\": \"qu'on ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKOn/N" $2 "/PA\": \"ce qu'on n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKOn/N/" $2 "/PA\": \"ce qu'on ne " $1 " pas\",";}


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

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/NOU\": \"" $1 "-nous\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/NOU\": \"" $1 "-nous\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KNOU/" $2 "\": \"que nous " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KNOU/" $2 "\": \"que nous " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKNOU/" $2 "\": \"ce que nous " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKNOU/" $2 "\": \"ce que nous " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"NOU/N" $2 "\": \"nous n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"NOU/N/" $2 "\": \"nous ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KNOU/N" $2 "\": \"que nous n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KNOU/N/" $2 "\": \"que nous ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKNOU/N" $2 "\": \"ce que nous n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKNOU/N/" $2 "\": \"ce que nous ne " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"NOU/N" $2 "/PA\": \"nous n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"NOU/N/" $2 "/PA\": \"nous ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KNOU/N" $2 "/PA\": \"que nous n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KNOU/N/" $2 "/PA\": \"que nous ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKNOU/N" $2 "/PA\": \"ce que nous n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKNOU/N/" $2 "/PA\": \"ce que nous ne " $1 " pas\",";}
	}
## ** Vous
	if ($6 ~ /2p/){

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"F*OU/" $2 "\": \"vous " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîô]/){print "\"F*OU/" $2 "\": \"vous " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/F*OU\": \"" $1 "-vous\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/F*OU\": \"" $1 "-vous\",";}


	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KF*OU/" $2 "\": \"que vous " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KF*OU/" $2 "\": \"que vous " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKF*OU/" $2 "\": \"ce que vous " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKF*OU/" $2 "\": \"ce que vous " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"F*OU/N" $2 "\": \"vous n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"F*OU/N/" $2 "\": \"vous ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KF*OU/N" $2 "\": \"que vous n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KF*OU/N/" $2 "\": \"que vous ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKF*OU/N" $2 "\": \"ce que vous n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKF*OU/" $2 "\": \"ce que vous ne " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"F*OU/N" $2 "/PA\": \"vous n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"F*OU/N/" $2 "/PA\": \"vous ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KF*OU/N" $2 "/PA\": \"que vous n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KF*OU/N/" $2 "/PA\": \"que vous ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKF*OU/N" $2 "/PA\": \"ce que vous n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKF*OU/" $2 "/PA\": \"ce que vous ne " $1 " pas\",";}
	}
## ** Ils
	if ($6 ~ /3p/){
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/" $2 "/$\": \"ils " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/" $2 "/$\": \"ils " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"" $2 "/Il$\": \"" $1 "-ils\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"" $2 "/Il$\": \"" $1 "-ils\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/" $2 "/$\": \"qu'ils " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/" $2 "/$\": \"qu'ils " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/" $2 "\": \"ce qu'ils " $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/" $2 "/$\": \"ce qu'ils " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/N" $2 "/$\": \"ils n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/N/" $2 "/$\": \"ils ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/N" $2 "/$\": \"qu'ils n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/N/" $2 "/$\": \"qu'ils ne " $1 "\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/N" $2 "/$\": \"ce qu'ils n'" $1 "\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/N/" $2 "/$\": \"ce qu'ils ne " $1 "\",";}

	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"Il/N" $2 "/PA\": \"ils n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"Il/N/" $2 "/PA\": \"ils ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"KIl/N" $2 "/PA\": \"qu'ils n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"KIl/N/" $2 "/PA\": \"qu'ils ne " $1 " pas\",";}
	    if ($1 ~/^[aeiouéàâêïîô]/){print "\"SKIl/N" $2 "/PA\": \"ce qu'ils n'" $1 " pas\",";}
	    if ($1 ~/^[^aeiouéàâêïîôh]/){print "\"SKIl/N/" $2 "/PA\": \"ce qu'ils ne " $1 " pas\",";}
	}
    }
}
## * NOMS()
function noms(){
    if ($3 ~ /^NOM$/ && $7 ~ /^ADJ,NOM$/)
    {
## ** 1e moulinage
## *** Pluriel
	if ($5 ~ /p/){
	    print "\"" $2 "/$\": \"" $1 "\",";
	    # print "\"LE/" $2 "\": \"les " $1 "\",";
	    # print "\"T*E/" $2 "\": \"des " $1 "\",";
	    print "\"SE/" $2 "\": \"ces " $1 "\",";
	    print "\"SE/" $2 "/LA\": \"ces " $1 "-là\",";
	    print "\"SE/" $2 "/*\": \"ses " $1 "\",";
	    print "\"ME/" $2 "\": \"mes " $1 "\",";
	    # print "\"TE/" $2 "\": \"tes " $1 "\",";
	    # print "\"NO/" $2 "\": \"nos " $1 "\",";
	    # print "\"F*O/" $2 "\": \"vos " $1 "\",";
	    print "\"LEUl/" $2 "/$\": \"leurs " $1 "\",";

	    # print "\"KElC/" $2 "\": \"quelques " $1 "\",";
	    # print "\"KLE/" $2 "\": \"que les " $1 "\",";
	    # print "\"KT*E/" $2 "\": \"que des " $1 "\",";
	    # print "\"KME/" $2 "\": \"que mes " $1 "\",";
	    # print "\"KTE/" $2 "\": \"que tes " $1 "\",";
	    # print "\"KNO/" $2 "\": \"que nos " $1 "\",";
	    # print "\"KF*O/" $2 "\": \"que vos " $1 "\",";
	    print "\"KLEUl/" $2 "/$\": \"que leurs " $1 "\",";

	    if ($4 ~ /m/){
		print "\"KEl/" $2 "/$\": \"quels " $1 "\",";
		print "\"TEl/" $2 "/$\": \"tels " $1 "\",";
		print "\"NUl/" $2 "/$\": \"nuls " $1 "\",";
		print "\"TOU/" $2 "/$\": \"tous " $1 "\",";
		print "\"KTOU/" $2 "/$\": \"que tous " $1 "\",";
	    }

	    if ($4 ~ /f/){
		print "\"KEl/" $2 "/$\": \"quelles " $1 "\",";
		print "\"TEl/" $2 "/$\": \"telles " $1 "\",";
		print "\"NUl/" $2 "/$\": \"nulles " $1 "\",";
		print "\"TOUD/" $2 "/$\": \"toutes " $1 "\",";
		print "\"KTOUD/" $2 "/$\": \"que toutes " $1 "\",";

	    }
	}
## *** Masculin singulier
	if ($4 ~ /m/ && $5 ~ /s/){
	    print "\"" $2 "\": \"" $1 "\",";
	    # print "\"Un/" $2 "\": \"un " $1 "\",";
	    # print "\"SOn/" $2 "\": \"son " $1 "\",";
	    # print "\"MOn/" $2 "\": \"mon " $1 "\",";
	    # print "\"TOn/" $2 "\": \"ton " $1 "\",";
	    # print "\"NO/TR/" $2 "\": \"notre " $1 "\",";
	    # print "\"F*O/TR/" $2 "\": \"votre " $1 "\",";
	    # print "\"LEUl/" $2 "\": \"leur " $1 "\",";
	    # print "\"KEl/" $2 "\": \"quel " $1 "\",";
	    # print "\"TEl/" $2 "\": \"tel " $1 "\",";
	    # print "\"NUl/" $2 "\": \"nul " $1 "\",";
	    # print "\"TOU/" $2 "\": \"tout " $1 "\",";
								# que
	    # print "\"KTOU/" $2 "\": \"que tout " $1 "\",";
	    # print "\"KUn/" $2 "\": \"qu'un " $1 "\",";
	    # print "\"KMOn/" $2 "\": \"que mon " $1 "\",";
	    # print "\"KTOn/" $2 "\": \"que ton " $1 "\",";
	    # print "\"KNO/TR/" $2 "\": \"que notre " $1 "\",";
	    # print "\"KF*O/TR/" $2 "\": \"que votre " $1 "\",";
	    # print "\"KLEUl/" $2 "\": \"que leur " $1 "\",";

	    if ($1  ~ /^[^aeiouéàâêïîôh]/){
		# print "\"L/" $2 "\": \"le " $1 "\",";
		# print "\"KL/" $2 "\": \"que le " $1 "\",";
		print "\"S/" $2 "\": \"ce " $1 "\",";
		print "\"S/" $2 "/LA\": \"ce " $1 "-là\",";
		if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
	    }


	    if ($1 ~ /^h/)
	    {
		if ( $1 !~ /^hâblerie$/  &&  $1 !~ /^hâbleur$/ &&  $1 !~ /^hâbleuse$/ &&  $1 !~ /^hachage$/ &&  $1 !~ /^hache$/ &&  $1 !~ /^haché$/ &&  $1 !~ /^hachée$/ &&  $1 !~ /^hache-légumes$/ &&  $1 !~ /^hachement$/ &&  $1 !~ /^hache-paille$/ &&  $1 !~ /^hacher$/ &&  $1 !~ /^hachette$/ &&  $1 !~ /^hacheur$/ &&  $1 !~ /^hache-viande$/ &&  $1 !~ /^hachis$/ &&  $1 !~ /^hachisch$/ &&  $1 !~ /^hachoir$/ &&  $1 !~ /^hachure$/ &&  $1 !~ /^hachurer$/ &&  $1 !~ /^hackle$/ &&  $1 !~ /^hadal$/ &&  $1 !~ /^hadale$/ &&  $1 !~ /^hadaux$/ &&  $1 !~ /^haddock$/ &&  $1 !~ /^haflinger$/ &&  $1 !~ /^hafnium$/ &&  $1 !~ /^hagard$/ &&  $1 !~ /^haggis$/ &&  $1 !~ /^haie$/ &&  $1 !~ /^haillon$/ &&  $1 !~ /^haillonneuse$/ &&  $1 !~ /^haillonneux$/ &&  $1 !~ /^haine$/ &&  $1 !~ /^haineuse$/ &&  $1 !~ /^haineusement$/ &&  $1 !~ /^haineux$/ &&  $1 !~ /^haïr$/ &&  $1 !~ /^haire$/ &&  $1 !~ /^haïssable$/ &&  $1 !~ /^Haïtien$/ &&  $1 !~ /^Haïtienne$/ &&  $1 !~ /^halage$/ &&  $1 !~ /^hâlage$/ &&  $1 !~ /^halal$/ &&  $1 !~ /^halbi$/ &&  $1 !~ /^halbran$/ &&  $1 !~ /^halbrené$/ &&  $1 !~ /^halbrenée$/ &&  $1 !~ /^halde$/ &&  $1 !~ /^hâle$/ &&  $1 !~ /^hâlé$/ &&  $1 !~ /^hale-bas$/ &&  $1 !~ /^hale-breu$/ &&  $1 !~ /^hale-croc$/ &&  $1 !~ /^hâlée$/ &&  $1 !~ /^halefis$/ &&  $1 !~ /^hâle-haut$/ &&  $1 !~ /^haler$/ &&  $1 !~ /^hâler$/ &&  $1 !~ /^haletant$/ &&  $1 !~ /^halètement$/ &&  $1 !~ /^haleter$/ &&  $1 !~ /^haleur$/ &&  $1 !~ /^haleuse$/ &&  $1 !~ /^half-track$/ &&  $1 !~ /^hall$/ &&  $1 !~ /^halle$/ &&  $1 !~ /^hallebarde$/ &&  $1 !~ /^hallux$/ &&  $1 !~ /^halo$/ &&  $1 !~ /^halte$/ &&  $1 !~ /^halte-garderie$/ &&  $1 !~ /^hamac$/ &&  $1 !~ /^hamada$/ &&  $1 !~ /^hamburger$/ &&  $1 !~ /^hameau$/ &&  $1 !~ /^hamman$/ &&  $1 !~ /^hampe$/ &&  $1 !~ /^hamster$/ &&  $1 !~ /^hanche$/ &&  $1 !~ /^hanchement$/ &&  $1 !~ /^hancher$/ &&  $1 !~ /^hand-ball$/ &&  $1 !~ /^handballeur$/ &&  $1 !~ /^handballeuse$/ &&  $1 !~ /^handicap$/ &&  $1 !~ /^handicapant$/ &&  $1 !~ /^handicapante$/ &&  $1 !~ /^handicapé$/ &&  $1 !~ /^handicapée$/ &&  $1 !~ /^handicaper$/ &&  $1 !~ /^handicapeur$/ &&  $1 !~ /^handisport$/ &&  $1 !~ /^hangar$/ &&  $1 !~ /^hanneton$/ &&  $1 !~ /^hanon$/ &&  $1 !~ /^hanse$/ &&  $1 !~ /^hanter$/ &&  $1 !~ /^hantise$/ &&  $1 !~ /^happement$/ &&  $1 !~ /^happening$/ &&  $1 !~ /^happer$/ &&  $1 !~ /^happy end$/ &&  $1 !~ /^haque$/ &&  $1 !~ /^haquenée$/ &&  $1 !~ /^haquet$/ &&  $1 !~ /^hara-kiri$/ &&  $1 !~ /^harangue$/ &&  $1 !~ /^haranguer$/ &&  $1 !~ /^harangueur$/ &&  $1 !~ /^harangueuse$/ &&  $1 !~ /^haras$/ &&  $1 !~ /^harassant$/ &&  $1 !~ /^harassante$/ &&  $1 !~ /^harassé$/ &&  $1 !~ /^harassée$/ &&  $1 !~ /^harassement$/ &&  $1 !~ /^harasser$/ &&  $1 !~ /^harcelant$/ &&  $1 !~ /^harcelante$/ &&  $1 !~ /^harcèlement$/ &&  $1 !~ /^harceler$/ &&  $1 !~ /^hard$/ &&  $1 !~ /^hard-bop$/ &&  $1 !~ /^hard-core$/ &&  $1 !~ /^harde$/ &&  $1 !~ /^hardé$/ &&  $1 !~ /^hard-edge$/ &&  $1 !~ /^harder$/ &&  $1 !~ /^hardes$/ &&  $1 !~ /^hard ground$/ &&  $1 !~ /^hardi$/ &&  $1 !~ /^hardie$/ &&  $1 !~ /^hardiesse$/ &&  $1 !~ /^hardiment$/ &&  $1 !~ /^hard-rock$/ &&  $1 !~ /^hard-top$/ &&  $1 !~ /^hardware$/ &&  $1 !~ /^harem$/ &&  $1 !~ /^hareng$/ &&  $1 !~ /^harengade$/ &&  $1 !~ /^harengaison$/ &&  $1 !~ /^harengère$/ &&  $1 !~ /^harenguet$/ &&  $1 !~ /^harengueux$/ &&  $1 !~ /^harenguier$/ &&  $1 !~ /^harenguière$/ &&  $1 !~ /^haret$/ &&  $1 !~ /^harfang$/ &&  $1 !~ /^hargne$/ &&  $1 !~ /^hargneuse$/ &&  $1 !~ /^hargneusement$/ &&  $1 !~ /^hargneux$/ &&  $1 !~ /^haricot$/ &&  $1 !~ /^haridelle$/ &&  $1 !~ /^harissa$/ &&  $1 !~ /^harka$/ &&  $1 !~ /^harki$/ &&  $1 !~ /^harnachement$/ &&  $1 !~ /^harnacher$/ &&  $1 !~ /^harnais$/ &&  $1 !~ /^harnat$/ &&  $1 !~ /^harnois$/ &&  $1 !~ /^haro$/ &&  $1 !~ /^harouelle$/ &&  $1 !~ /^harpail$/ &&  $1 !~ /^harpaye$/ &&  $1 !~ /^harpe$/ &&  $1 !~ /^harpe-cithare$/ &&  $1 !~ /^harpe-luth$/ &&  $1 !~ /^harpette$/ &&  $1 !~ /^harpie$/ &&  $1 !~ /^harpiste$/ &&  $1 !~ /^harpocéras$/ &&  $1 !~ /^harpodon$/ &&  $1 !~ /^harpoise$/ &&  $1 !~ /^harpon$/ &&  $1 !~ /^harponnage$/ &&  $1 !~ /^harponnement$/ &&  $1 !~ /^harponner$/ &&  $1 !~ /^harponneur$/ &&  $1 !~ /^harpye$/ &&  $1 !~ /^harrier$/ &&  $1 !~ /^hart$/ &&  $1 !~ /^hasard$/ &&  $1 !~ /^hasarder$/ &&  $1 !~ /^hasardeuse$/ &&  $1 !~ /^hasardeusement$/ &&  $1 !~ /^hasardeux$/ &&  $1 !~ /^has been$/ &&  $1 !~ /^hasch$/ &&  $1 !~ /^haschich$/ &&  $1 !~ /^haschisch$/ &&  $1 !~ /^hase$/ &&  $1 !~ /^hâte$/ &&  $1 !~ /^hâter$/ &&  $1 !~ /^hatha-yoga$/ &&  $1 !~ /^hâtier$/ &&  $1 !~ /^hâtif$/ &&  $1 !~ /^hâtive$/ &&  $1 !~ /^hattéria$/ &&  $1 !~ /^hauban$/ &&  $1 !~ /^haubanage$/ &&  $1 !~ /^haubaner$/ &&  $1 !~ /^haubert$/ &&  $1 !~ /^hausse$/ &&  $1 !~ /^hausse-col$/ &&  $1 !~ /^haussement$/ &&  $1 !~ /^hausser$/ &&  $1 !~ /^hausse-repère$/ &&  $1 !~ /^haussier$/ &&  $1 !~ /^haussière$/ &&  $1 !~ /^haut$/ &&  $1 !~ /^hautain$/ &&  $1 !~ /^hautaine$/ &&  $1 !~ /^haut-bar$/ &&  $1 !~ /^hautbois$/ &&  $1 !~ /^hautboïste$/ &&  $1 !~ /^haut-commissaire$/ &&  $1 !~ /^haut-commissariat$/ &&  $1 !~ /^haut-de-chausse(s)$/ &&  $1 !~ /^haut-de-côtelettes$/ &&  $1 !~ /^haut-de-côtes$/ &&  $1 !~ /^haut-de-forme$/ &&  $1 !~ /^haute$/ &&  $1 !~ /^haute-contre$/ &&  $1 !~ /^hautement$/ &&  $1 !~ /^haute-tige$/ &&  $1 !~ /^hauteur$/ &&  $1 !~ /^haut-fond$/ &&  $1 !~ /^haut-fourneau$/ &&  $1 !~ /^hautin$/ &&  $1 !~ /^haut-jointé$/ &&  $1 !~ /^haut-jointée$/ &&  $1 !~ /^haut-le-cœur$/ &&  $1 !~ /^haut-le-corps$/ &&  $1 !~ /^haut-le-pied$/ &&  $1 !~ /^haut-parc$/ &&  $1 !~ /^haut-parleur$/ &&  $1 !~ /^haut-relief$/ &&  $1 !~ /^hauturier$/ &&  $1 !~ /^hauturière$/ &&  $1 !~ /^havage$/ &&  $1 !~ /^havane$/ &&  $1 !~ /^hâve$/ &&  $1 !~ /^havée$/ &&  $1 !~ /^haveneau$/ &&  $1 !~ /^havenet$/ &&  $1 !~ /^haver$/ &&  $1 !~ /^haveur$/ &&  $1 !~ /^haveuse$/ &&  $1 !~ /^havre$/ &&  $1 !~ /^havresac$/ &&  $1 !~ /^havrit$/ &&  $1 !~ /^haylage$/ &&  $1 !~ /^hayon$/ &&  $1 !~ /^hé !$/ &&  $1 !~ /^heat-set$/ &&  $1 !~ /^heaume$/ &&  $1 !~ /^hein !$/ &&  $1 !~ /^héler$/ &&  $1 !~ /^hem !$/ &&  $1 !~ /^henné$/ &&  $1 !~ /^hennin$/ &&  $1 !~ /^hennir$/ &&  $1 !~ /^hennissant$/ &&  $1 !~ /^hennissante$/ &&  $1 !~ /^hennissement$/ &&  $1 !~ /^hennuyer$/ &&  $1 !~ /^hep !$/ &&  $1 !~ /^héraut$/ &&  $1 !~ /^hère$/ &&  $1 !~ /^hérissé$/ &&  $1 !~ /^hérissée$/ &&  $1 !~ /^hérissement$/ &&  $1 !~ /^hérisser$/ &&  $1 !~ /^hérisson$/ &&  $1 !~ /^hérissonne$/ &&  $1 !~ /^herniaire$/ &&  $1 !~ /^hernie$/ &&  $1 !~ /^hernié$/ &&  $1 !~ /^herniée$/ &&  $1 !~ /^hernieuse$/ &&  $1 !~ /^hernieux$/ &&  $1 !~ /^héroïne$/ &&  $1 !~ /^héron$/ &&  $1 !~ /^héronneau$/ &&  $1 !~ /^héronnier$/ &&  $1 !~ /^héronnière$/ &&  $1 !~ /^héros$/ &&  $1 !~ /^hersage$/ &&  $1 !~ /^herse$/ &&  $1 !~ /^herser$/ &&  $1 !~ /^hersillon$/ &&  $1 !~ /^hêtraie$/ &&  $1 !~ /^hêtre$/ &&  $1 !~ /^heu !$/ &&  $1 !~ /^heurt$/ &&  $1 !~ /^heurter$/ &&  $1 !~ /^heurtoir$/ &&  $1 !~ /^hibou$/ &&  $1 !~ /^hic$/ &&  $1 !~ /^hickory$/ &&  $1 !~ /^hideur$/ &&  $1 !~ /^hideuse$/ &&  $1 !~ /^hideusement$/ &&  $1 !~ /^hideux$/ &&  $1 !~ /^hidjab$/ &&  $1 !~ /^hiement$/ &&  $1 !~ /^hiérarchie$/ &&  $1 !~ /^hiérarchique$/ &&  $1 !~ /^hiérarchiquement$/ &&  $1 !~ /^hiérarchisation$/ &&  $1 !~ /^hiérarchiser$/ &&  $1 !~ /^hiérarque$/ &&  $1 !~ /^hi-fi$/ &&  $1 !~ /^high bulk$/ &&  $1 !~ /^high-tech$/ &&  $1 !~ /^hilaire$/ &&  $1 !~ /^hile$/ &&  $1 !~ /^hindi$/ &&  $1 !~ /^hip !$/ &&  $1 !~ /^hip-hop$/ &&  $1 !~ /^hippie$/ &&  $1 !~ /^hippy$/ &&  $1 !~ /^hissage$/ &&  $1 !~ /^hit$/ &&  $1 !~ /^hit-parade$/ &&  $1 !~ /^ho !$/ &&  $1 !~ /^hobby$/ &&  $1 !~ /^hobbyste$/ &&  $1 !~ /^hobereau$/ &&  $1 !~ /^hochement$/ &&  $1 !~ /^hochepot$/ &&  $1 !~ /^hochequeue$/ &&  $1 !~ /^hocher$/ &&  $1 !~ /^hochet$/ &&  $1 !~ /^hockey$/ &&  $1 !~ /^hockeyeur$/ &&  $1 !~ /^hockeyeuse$/ &&  $1 !~ /^ho! hisse!$/ &&  $1 !~ /^holà !$/ &&  $1 !~ /^holding$/ &&  $1 !~ /^hold-up$/ &&  $1 !~ /^Hollande$/ &&  $1 !~ /^hollandite$/ &&  $1 !~ /^hollywoodien$/ &&  $1 !~ /^hollywoodienne$/ &&  $1 !~ /^homard$/ &&  $1 !~ /^homarderie$/ &&  $1 !~ /^homardier$/ &&  $1 !~ /^home$/ &&  $1 !~ /^home-trainer$/ &&  $1 !~ /^hongre$/ &&  $1 !~ /^hongrer$/ &&  $1 !~ /^hongreur$/ &&  $1 !~ /^hongreuse$/ &&  $1 !~ /^Hongrie$/ &&  $1 !~ /^hongroierie$/ &&  $1 !~ /^hongroyage$/ &&  $1 !~ /^hongroyer$/ &&  $1 !~ /^hongroyeur$/ &&  $1 !~ /^honning$/ &&  $1 !~ /^honnir$/ &&  $1 !~ /^honoris causa$/ &&  $1 !~ /^honte$/ &&  $1 !~ /^honteuse$/ &&  $1 !~ /^honteusement$/ &&  $1 !~ /^honteux$/ &&  $1 !~ /^hooligan$/ &&  $1 !~ /^hooliganisme$/ &&  $1 !~ /^hop !$/ &&  $1 !~ /^hop-je$/ &&  $1 !~ /^hoquet$/ &&  $1 !~ /^hoqueter$/ &&  $1 !~ /^hoqueton$/ &&  $1 !~ /^horde$/ &&  $1 !~ /^horion$/ &&  $1 !~ /^hormis$/ &&  $1 !~ /^hornblende$/ &&  $1 !~ /^hors$/ &&  $1 !~ /^horsain$/ &&  $1 !~ /^hors-bord$/ &&  $1 !~ /^hors-cote$/ &&  $1 !~ /^hors de$/ &&  $1 !~ /^hors-de-cour$/ &&  $1 !~ /^hors-d'œuvre$/ &&  $1 !~ /^horse-guard$/ &&  $1 !~ /^horse power$/ &&  $1 !~ /^horsin$/ &&  $1 !~ /^hors-jeu$/ &&  $1 !~ /^hors-la-loi$/ &&  $1 !~ /^hors-ligne$/ &&  $1 !~ /^hors-marché$/ &&  $1 !~ /^hors-piste$/ &&  $1 !~ /^hors-pistes$/ &&  $1 !~ /^hors-statut$/ &&  $1 !~ /^horst$/ &&  $1 !~ /^hors-texte$/ &&  $1 !~ /^hot$/ &&  $1 !~ /^hot dog$/ &&  $1 !~ /^hot-flue$/ &&  $1 !~ /^hotinus$/ &&  $1 !~ /^hot money$/ &&  $1 !~ /^hotte$/ &&  $1 !~ /^hottée$/ &&  $1 !~ /^hotu$/ &&  $1 !~ /^hou !$/ &&  $1 !~ /^houache$/ &&  $1 !~ /^houage$/ &&  $1 !~ /^houaiche$/ &&  $1 !~ /^houblon$/ &&  $1 !~ /^houe$/ &&  $1 !~ /^houer$/ &&  $1 !~ /^houille$/ &&  $1 !~ /^houiller$/ &&  $1 !~ /^houillère$/ &&  $1 !~ /^houle$/ &&  $1 !~ /^houlette$/ &&  $1 !~ /^houleuse$/ &&  $1 !~ /^houleux$/ &&  $1 !~ /^houligan$/ &&  $1 !~ /^houliganisme$/ &&  $1 !~ /^houlque$/ &&  $1 !~ /^houp !$/ &&  $1 !~ /^houppe$/ &&  $1 !~ /^houppelande$/ &&  $1 !~ /^houppette$/ &&  $1 !~ /^houppier$/ &&  $1 !~ /^hourd$/ &&  $1 !~ /^hourdage$/ &&  $1 !~ /^hourder$/ &&  $1 !~ /^hourdir$/ &&  $1 !~ /^hourdis$/ &&  $1 !~ /^houri$/ &&  $1 !~ /^hourque$/ &&  $1 !~ /^hourra !$/ &&  $1 !~ /^hourri$/ &&  $1 !~ /^hourrite$/ &&  $1 !~ /^hourvari$/ &&  $1 !~ /^housche$/ &&  $1 !~ /^houseau$/ &&  $1 !~ /^house-boat$/ &&  $1 !~ /^houspiller$/ &&  $1 !~ /^houssage$/ &&  $1 !~ /^housse$/ &&  $1 !~ /^housser$/ &&  $1 !~ /^housset$/ &&  $1 !~ /^houssière$/ &&  $1 !~ /^houst !$/ &&  $1 !~ /^houx$/ &&  $1 !~ /^hovéa$/ &&  $1 !~ /^hoyau$/ &&  $1 !~ /^hoyé$/ &&  $1 !~ /^hoyée$/ &&  $1 !~ /^huard$/ &&  $1 !~ /^huart$/ &&  $1 !~ /^hublot$/ &&  $1 !~ /^huche$/ &&  $1 !~ /^hucher$/ &&  $1 !~ /^huchier$/ &&  $1 !~ /^hue !$/ &&  $1 !~ /^huée$/ &&  $1 !~ /^huer$/ &&  $1 !~ /^huerta$/ &&  $1 !~ /^huguenot$/ &&  $1 !~ /^huipil$/ &&  $1 !~ /^huir$/ &&  $1 !~ /^huis clos$/ &&  $1 !~ /^huit$/ &&  $1 !~ /^huitain$/ &&  $1 !~ /^huitaine$/ &&  $1 !~ /^huitante$/ &&  $1 !~ /^huit-en-huit$/ &&  $1 !~ /^huitième$/ &&  $1 !~ /^huitièmement$/ &&  $1 !~ /^huit-reflets$/ &&  $1 !~ /^hulotte$/ &&  $1 !~ /^hululation$/ &&  $1 !~ /^hululement$/ &&  $1 !~ /^hululer$/ &&  $1 !~ /^humer$/ &&  $1 !~ /^hum ! $/ &&  $1 !~ /^humantin$/ &&  $1 !~ /^hune$/ &&  $1 !~ /^hunier$/ &&  $1 !~ /^hunter$/ &&  $1 !~ /^huppe$/ &&  $1 !~ /^huppé$/ &&  $1 !~ /^huppée$/ &&  $1 !~ /^huque$/ &&  $1 !~ /^hurdler$/ &&  $1 !~ /^hure$/ &&  $1 !~ /^hurlant$/ &&  $1 !~ /^hurlement$/ &&  $1 !~ /^hurler$/ &&  $1 !~ /^hurleur$/ &&  $1 !~ /^hurleuse$/ &&  $1 !~ /^huron$/ &&  $1 !~ /^Huron$/ &&  $1 !~ /^huronne$/ &&  $1 !~ /^hurrah !$/ &&  $1 !~ /^hurricane$/ &&  $1 !~ /^husky$/ &&  $1 !~ /^hussard$/ &&  $1 !~ /^hussarde$/ &&  $1 !~ /^hutinet$/ &&  $1 !~ /^hutte$/ &&  $1 !~ /^hutteau$/ &&  $1 !~ /^hack$/ &&  $1 !~ /^hacker$/ &&  $1 !~ /^haïk$/ &&  $1 !~ /^hadj$/ &&  $1 !~ /^havanaise$/ &&  $1 !~ /^havanais$/ &&  $1 !~ /^high/ &&  $1 !~ /^haï/ && $1 !~ /^haka$/ && $1 !~ /^hakka$/ &&  $1 !~ /^handball$/ &&  $1 !~ /^house/ &&  $1 !~ /^hadith$/)

		{
		    print "\"L" $2 "\": \"l'" $1 "\",";
		    print "\"KL" $2 "\": \"que l'" $1 "\",";
		    print "\"ST" $2 "\": \"cet " $1 "\",";
		    print "\"ST/" $2 "\": \"cet " $1 "\",";
		    print "\"ST" $2 "/LA\": \"cet " $1 "-là\",";
		    print "\"ST/" $2 "/LA\": \"cet " $1 "-là\",";

		}
		else
		{
		print "\"S/" $2 "\": \"ce " $1 "\",";
		print "\"S/" $2 "/LA\": \"ce " $1 "-là\",";
		}
	    }


	    if ($1 ~ /^[aeiouéàâêïîô]/){
		print "\"L" $2 "\": \"l'" $1 "\",";
		print "\"KL" $2 "\": \"que l'" $1 "\",";
		print "\"ST" $2 "\": \"cet " $1 "\",";
		print "\"ST/" $2 "\": \"cet " $1 "\",";
		print "\"ST" $2 "/LA\": \"cet " $1 "-là\",";
		print "\"ST/" $2 "/LA\": \"cet " $1 "-là\",";

		# print "\"NO/TR" $2 "\": \"notre " $1 "\",";
		# print "\"F*O/TR" $2 "\": \"votre " $1 "\",";
	    }

	}
## *** Féminin  singulier
	if ($4 ~ /f/ && $5 ~ /s/){
	    print "\"" $2 "\": \"" $1 "\",";
	    # print "\"UnC/" $2 "\": \"une " $1 "\",";
	    print "\"ST/" $2 "\": \"cette " $1 "\",";
	    print "\"ST/" $2 "/LA\": \"cette " $1 "-là\",";
	    # print "\"NO/TR/" $2 "\": \"notre " $1 "\",";
	    # print "\"F*O/TR/" $2 "\": \"votre " $1 "\",";
	    # print "\"LEUl/" $2 "\": \"leur " $1 "\",";
	    print "\"KEl/" $2 "\": \"quelle " $1 "\",";
	    print "\"TEl/" $2 "\": \"telle " $1 "\",";
	    print "\"NUl/" $2 "\": \"nulle " $1 "\",";
	    # print "\"TOUD/" $2 "\": \"toute " $1 "\",";
	    # print "\"KTOUD/" $2 "\": \"que toute " $1 "\",";
	    # print "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	    # print "\"KNO/TR/" $2 "\": \"que notre " $1 "\",";
	    # print "\"KF*O/TR/" $2 "\": \"que votre " $1 "\",";
	    # print "\"KLEUl/" $2 "\": \"que leur " $1 "\",";

	    if ($1  ~ /^[^aeiouéàâêïîôh]/){
		# print "\"LA/" $2 "\": \"la " $1 "\",";
		print "\"ST/" $2 "\": \"cette " $1 "\",";
		print "\"ST/" $2 "/LA\": \"cette " $1 "-là\",";
		# print "\"MA/" $2 "\": \"ma " $1 "\",";
		# print "\"TA/" $2 "\": \"ta " $1 "\",";
		# print "\"SA/" $2 "\": \"sa " $1 "\",";
		# print "\"KLA/" $2 "\": \"que la " $1 "\",";
		# print "\"KMA/" $2 "\": \"que ma " $1 "\",";
		# print "\"KTA/" $2 "\": \"que ta " $1 "\",";
		if ($2 ~ /^[FRNL]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2); print "\"" ssone "\": \"cette " $1 "\",";}
	    }

	    if ($1 ~ /^h/){
		if ( $1 !~ /^hâblerie$/  &&  $1 !~ /^hâbleur$/ &&  $1 !~ /^hâbleuse$/ &&  $1 !~ /^hachage$/ &&  $1 !~ /^hache$/ &&  $1 !~ /^haché$/ &&  $1 !~ /^hachée$/ &&  $1 !~ /^hache-légumes$/ &&  $1 !~ /^hachement$/ &&  $1 !~ /^hache-paille$/ &&  $1 !~ /^hacher$/ &&  $1 !~ /^hachette$/ &&  $1 !~ /^hacheur$/ &&  $1 !~ /^hache-viande$/ &&  $1 !~ /^hachis$/ &&  $1 !~ /^hachisch$/ &&  $1 !~ /^hachoir$/ &&  $1 !~ /^hachure$/ &&  $1 !~ /^hachurer$/ &&  $1 !~ /^hackle$/ &&  $1 !~ /^hadal$/ &&  $1 !~ /^hadale$/ &&  $1 !~ /^hadaux$/ &&  $1 !~ /^haddock$/ &&  $1 !~ /^haflinger$/ &&  $1 !~ /^hafnium$/ &&  $1 !~ /^hagard$/ &&  $1 !~ /^haggis$/ &&  $1 !~ /^haie$/ &&  $1 !~ /^haillon$/ &&  $1 !~ /^haillonneuse$/ &&  $1 !~ /^haillonneux$/ &&  $1 !~ /^haine$/ &&  $1 !~ /^haineuse$/ &&  $1 !~ /^haineusement$/ &&  $1 !~ /^haineux$/ &&  $1 !~ /^haïr$/ &&  $1 !~ /^haire$/ &&  $1 !~ /^haïssable$/ &&  $1 !~ /^Haïtien$/ &&  $1 !~ /^Haïtienne$/ &&  $1 !~ /^halage$/ &&  $1 !~ /^hâlage$/ &&  $1 !~ /^halal$/ &&  $1 !~ /^halbi$/ &&  $1 !~ /^halbran$/ &&  $1 !~ /^halbrené$/ &&  $1 !~ /^halbrenée$/ &&  $1 !~ /^halde$/ &&  $1 !~ /^hâle$/ &&  $1 !~ /^hâlé$/ &&  $1 !~ /^hale-bas$/ &&  $1 !~ /^hale-breu$/ &&  $1 !~ /^hale-croc$/ &&  $1 !~ /^hâlée$/ &&  $1 !~ /^halefis$/ &&  $1 !~ /^hâle-haut$/ &&  $1 !~ /^haler$/ &&  $1 !~ /^hâler$/ &&  $1 !~ /^haletant$/ &&  $1 !~ /^halètement$/ &&  $1 !~ /^haleter$/ &&  $1 !~ /^haleur$/ &&  $1 !~ /^haleuse$/ &&  $1 !~ /^half-track$/ &&  $1 !~ /^hall$/ &&  $1 !~ /^halle$/ &&  $1 !~ /^hallebarde$/ &&  $1 !~ /^hallux$/ &&  $1 !~ /^halo$/ &&  $1 !~ /^halte$/ &&  $1 !~ /^halte-garderie$/ &&  $1 !~ /^hamac$/ &&  $1 !~ /^hamada$/ &&  $1 !~ /^hamburger$/ &&  $1 !~ /^hameau$/ &&  $1 !~ /^hamman$/ &&  $1 !~ /^hampe$/ &&  $1 !~ /^hamster$/ &&  $1 !~ /^hanche$/ &&  $1 !~ /^hanchement$/ &&  $1 !~ /^hancher$/ &&  $1 !~ /^hand-ball$/ &&  $1 !~ /^handballeur$/ &&  $1 !~ /^handballeuse$/ &&  $1 !~ /^handicap$/ &&  $1 !~ /^handicapant$/ &&  $1 !~ /^handicapante$/ &&  $1 !~ /^handicapé$/ &&  $1 !~ /^handicapée$/ &&  $1 !~ /^handicaper$/ &&  $1 !~ /^handicapeur$/ &&  $1 !~ /^handisport$/ &&  $1 !~ /^hangar$/ &&  $1 !~ /^hanneton$/ &&  $1 !~ /^hanon$/ &&  $1 !~ /^hanse$/ &&  $1 !~ /^hanter$/ &&  $1 !~ /^hantise$/ &&  $1 !~ /^happement$/ &&  $1 !~ /^happening$/ &&  $1 !~ /^happer$/ &&  $1 !~ /^happy end$/ &&  $1 !~ /^haque$/ &&  $1 !~ /^haquenée$/ &&  $1 !~ /^haquet$/ &&  $1 !~ /^hara-kiri$/ &&  $1 !~ /^harangue$/ &&  $1 !~ /^haranguer$/ &&  $1 !~ /^harangueur$/ &&  $1 !~ /^harangueuse$/ &&  $1 !~ /^haras$/ &&  $1 !~ /^harassant$/ &&  $1 !~ /^harassante$/ &&  $1 !~ /^harassé$/ &&  $1 !~ /^harassée$/ &&  $1 !~ /^harassement$/ &&  $1 !~ /^harasser$/ &&  $1 !~ /^harcelant$/ &&  $1 !~ /^harcelante$/ &&  $1 !~ /^harcèlement$/ &&  $1 !~ /^harceler$/ &&  $1 !~ /^hard$/ &&  $1 !~ /^hard-bop$/ &&  $1 !~ /^hard-core$/ &&  $1 !~ /^harde$/ &&  $1 !~ /^hardé$/ &&  $1 !~ /^hard-edge$/ &&  $1 !~ /^harder$/ &&  $1 !~ /^hardes$/ &&  $1 !~ /^hard ground$/ &&  $1 !~ /^hardi$/ &&  $1 !~ /^hardie$/ &&  $1 !~ /^hardiesse$/ &&  $1 !~ /^hardiment$/ &&  $1 !~ /^hard-rock$/ &&  $1 !~ /^hard-top$/ &&  $1 !~ /^hardware$/ &&  $1 !~ /^harem$/ &&  $1 !~ /^hareng$/ &&  $1 !~ /^harengade$/ &&  $1 !~ /^harengaison$/ &&  $1 !~ /^harengère$/ &&  $1 !~ /^harenguet$/ &&  $1 !~ /^harengueux$/ &&  $1 !~ /^harenguier$/ &&  $1 !~ /^harenguière$/ &&  $1 !~ /^haret$/ &&  $1 !~ /^harfang$/ &&  $1 !~ /^hargne$/ &&  $1 !~ /^hargneuse$/ &&  $1 !~ /^hargneusement$/ &&  $1 !~ /^hargneux$/ &&  $1 !~ /^haricot$/ &&  $1 !~ /^haridelle$/ &&  $1 !~ /^harissa$/ &&  $1 !~ /^harka$/ &&  $1 !~ /^harki$/ &&  $1 !~ /^harnachement$/ &&  $1 !~ /^harnacher$/ &&  $1 !~ /^harnais$/ &&  $1 !~ /^harnat$/ &&  $1 !~ /^harnois$/ &&  $1 !~ /^haro$/ &&  $1 !~ /^harouelle$/ &&  $1 !~ /^harpail$/ &&  $1 !~ /^harpaye$/ &&  $1 !~ /^harpe$/ &&  $1 !~ /^harpe-cithare$/ &&  $1 !~ /^harpe-luth$/ &&  $1 !~ /^harpette$/ &&  $1 !~ /^harpie$/ &&  $1 !~ /^harpiste$/ &&  $1 !~ /^harpocéras$/ &&  $1 !~ /^harpodon$/ &&  $1 !~ /^harpoise$/ &&  $1 !~ /^harpon$/ &&  $1 !~ /^harponnage$/ &&  $1 !~ /^harponnement$/ &&  $1 !~ /^harponner$/ &&  $1 !~ /^harponneur$/ &&  $1 !~ /^harpye$/ &&  $1 !~ /^harrier$/ &&  $1 !~ /^hart$/ &&  $1 !~ /^hasard$/ &&  $1 !~ /^hasarder$/ &&  $1 !~ /^hasardeuse$/ &&  $1 !~ /^hasardeusement$/ &&  $1 !~ /^hasardeux$/ &&  $1 !~ /^has been$/ &&  $1 !~ /^hasch$/ &&  $1 !~ /^haschich$/ &&  $1 !~ /^haschisch$/ &&  $1 !~ /^hase$/ &&  $1 !~ /^hâte$/ &&  $1 !~ /^hâter$/ &&  $1 !~ /^hatha-yoga$/ &&  $1 !~ /^hâtier$/ &&  $1 !~ /^hâtif$/ &&  $1 !~ /^hâtive$/ &&  $1 !~ /^hattéria$/ &&  $1 !~ /^hauban$/ &&  $1 !~ /^haubanage$/ &&  $1 !~ /^haubaner$/ &&  $1 !~ /^haubert$/ &&  $1 !~ /^hausse$/ &&  $1 !~ /^hausse-col$/ &&  $1 !~ /^haussement$/ &&  $1 !~ /^hausser$/ &&  $1 !~ /^hausse-repère$/ &&  $1 !~ /^haussier$/ &&  $1 !~ /^haussière$/ &&  $1 !~ /^haut$/ &&  $1 !~ /^hautain$/ &&  $1 !~ /^hautaine$/ &&  $1 !~ /^haut-bar$/ &&  $1 !~ /^hautbois$/ &&  $1 !~ /^hautboïste$/ &&  $1 !~ /^haut-commissaire$/ &&  $1 !~ /^haut-commissariat$/ &&  $1 !~ /^haut-de-chausse(s)$/ &&  $1 !~ /^haut-de-côtelettes$/ &&  $1 !~ /^haut-de-côtes$/ &&  $1 !~ /^haut-de-forme$/ &&  $1 !~ /^haute$/ &&  $1 !~ /^haute-contre$/ &&  $1 !~ /^hautement$/ &&  $1 !~ /^haute-tige$/ &&  $1 !~ /^hauteur$/ &&  $1 !~ /^haut-fond$/ &&  $1 !~ /^haut-fourneau$/ &&  $1 !~ /^hautin$/ &&  $1 !~ /^haut-jointé$/ &&  $1 !~ /^haut-jointée$/ &&  $1 !~ /^haut-le-cœur$/ &&  $1 !~ /^haut-le-corps$/ &&  $1 !~ /^haut-le-pied$/ &&  $1 !~ /^haut-parc$/ &&  $1 !~ /^haut-parleur$/ &&  $1 !~ /^haut-relief$/ &&  $1 !~ /^hauturier$/ &&  $1 !~ /^hauturière$/ &&  $1 !~ /^havage$/ &&  $1 !~ /^havane$/ &&  $1 !~ /^hâve$/ &&  $1 !~ /^havée$/ &&  $1 !~ /^haveneau$/ &&  $1 !~ /^havenet$/ &&  $1 !~ /^haver$/ &&  $1 !~ /^haveur$/ &&  $1 !~ /^haveuse$/ &&  $1 !~ /^havre$/ &&  $1 !~ /^havresac$/ &&  $1 !~ /^havrit$/ &&  $1 !~ /^haylage$/ &&  $1 !~ /^hayon$/ &&  $1 !~ /^hé !$/ &&  $1 !~ /^heat-set$/ &&  $1 !~ /^heaume$/ &&  $1 !~ /^hein !$/ &&  $1 !~ /^héler$/ &&  $1 !~ /^hem !$/ &&  $1 !~ /^henné$/ &&  $1 !~ /^hennin$/ &&  $1 !~ /^hennir$/ &&  $1 !~ /^hennissant$/ &&  $1 !~ /^hennissante$/ &&  $1 !~ /^hennissement$/ &&  $1 !~ /^hennuyer$/ &&  $1 !~ /^hep !$/ &&  $1 !~ /^héraut$/ &&  $1 !~ /^hère$/ &&  $1 !~ /^hérissé$/ &&  $1 !~ /^hérissée$/ &&  $1 !~ /^hérissement$/ &&  $1 !~ /^hérisser$/ &&  $1 !~ /^hérisson$/ &&  $1 !~ /^hérissonne$/ &&  $1 !~ /^herniaire$/ &&  $1 !~ /^hernie$/ &&  $1 !~ /^hernié$/ &&  $1 !~ /^herniée$/ &&  $1 !~ /^hernieuse$/ &&  $1 !~ /^hernieux$/ &&  $1 !~ /^héroïne$/ &&  $1 !~ /^héron$/ &&  $1 !~ /^héronneau$/ &&  $1 !~ /^héronnier$/ &&  $1 !~ /^héronnière$/ &&  $1 !~ /^héros$/ &&  $1 !~ /^hersage$/ &&  $1 !~ /^herse$/ &&  $1 !~ /^herser$/ &&  $1 !~ /^hersillon$/ &&  $1 !~ /^hêtraie$/ &&  $1 !~ /^hêtre$/ &&  $1 !~ /^heu !$/ &&  $1 !~ /^heurt$/ &&  $1 !~ /^heurter$/ &&  $1 !~ /^heurtoir$/ &&  $1 !~ /^hibou$/ &&  $1 !~ /^hic$/ &&  $1 !~ /^hickory$/ &&  $1 !~ /^hideur$/ &&  $1 !~ /^hideuse$/ &&  $1 !~ /^hideusement$/ &&  $1 !~ /^hideux$/ &&  $1 !~ /^hidjab$/ &&  $1 !~ /^hiement$/ &&  $1 !~ /^hiérarchie$/ &&  $1 !~ /^hiérarchique$/ &&  $1 !~ /^hiérarchiquement$/ &&  $1 !~ /^hiérarchisation$/ &&  $1 !~ /^hiérarchiser$/ &&  $1 !~ /^hiérarque$/ &&  $1 !~ /^hi-fi$/ &&  $1 !~ /^high bulk$/ &&  $1 !~ /^high-tech$/ &&  $1 !~ /^hilaire$/ &&  $1 !~ /^hile$/ &&  $1 !~ /^hindi$/ &&  $1 !~ /^hip !$/ &&  $1 !~ /^hip-hop$/ &&  $1 !~ /^hippie$/ &&  $1 !~ /^hippy$/ &&  $1 !~ /^hissage$/ &&  $1 !~ /^hit$/ &&  $1 !~ /^hit-parade$/ &&  $1 !~ /^ho !$/ &&  $1 !~ /^hobby$/ &&  $1 !~ /^hobbyste$/ &&  $1 !~ /^hobereau$/ &&  $1 !~ /^hochement$/ &&  $1 !~ /^hochepot$/ &&  $1 !~ /^hochequeue$/ &&  $1 !~ /^hocher$/ &&  $1 !~ /^hochet$/ &&  $1 !~ /^hockey$/ &&  $1 !~ /^hockeyeur$/ &&  $1 !~ /^hockeyeuse$/ &&  $1 !~ /^ho! hisse!$/ &&  $1 !~ /^holà !$/ &&  $1 !~ /^holding$/ &&  $1 !~ /^hold-up$/ &&  $1 !~ /^Hollande$/ &&  $1 !~ /^hollandite$/ &&  $1 !~ /^hollywoodien$/ &&  $1 !~ /^hollywoodienne$/ &&  $1 !~ /^homard$/ &&  $1 !~ /^homarderie$/ &&  $1 !~ /^homardier$/ &&  $1 !~ /^home$/ &&  $1 !~ /^home-trainer$/ &&  $1 !~ /^hongre$/ &&  $1 !~ /^hongrer$/ &&  $1 !~ /^hongreur$/ &&  $1 !~ /^hongreuse$/ &&  $1 !~ /^Hongrie$/ &&  $1 !~ /^hongroierie$/ &&  $1 !~ /^hongroyage$/ &&  $1 !~ /^hongroyer$/ &&  $1 !~ /^hongroyeur$/ &&  $1 !~ /^honning$/ &&  $1 !~ /^honnir$/ &&  $1 !~ /^honoris causa$/ &&  $1 !~ /^honte$/ &&  $1 !~ /^honteuse$/ &&  $1 !~ /^honteusement$/ &&  $1 !~ /^honteux$/ &&  $1 !~ /^hooligan$/ &&  $1 !~ /^hooliganisme$/ &&  $1 !~ /^hop !$/ &&  $1 !~ /^hop-je$/ &&  $1 !~ /^hoquet$/ &&  $1 !~ /^hoqueter$/ &&  $1 !~ /^hoqueton$/ &&  $1 !~ /^horde$/ &&  $1 !~ /^horion$/ &&  $1 !~ /^hormis$/ &&  $1 !~ /^hornblende$/ &&  $1 !~ /^hors$/ &&  $1 !~ /^horsain$/ &&  $1 !~ /^hors-bord$/ &&  $1 !~ /^hors-cote$/ &&  $1 !~ /^hors de$/ &&  $1 !~ /^hors-de-cour$/ &&  $1 !~ /^hors-d'œuvre$/ &&  $1 !~ /^horse-guard$/ &&  $1 !~ /^horse power$/ &&  $1 !~ /^horsin$/ &&  $1 !~ /^hors-jeu$/ &&  $1 !~ /^hors-la-loi$/ &&  $1 !~ /^hors-ligne$/ &&  $1 !~ /^hors-marché$/ &&  $1 !~ /^hors-piste$/ &&  $1 !~ /^hors-pistes$/ &&  $1 !~ /^hors-statut$/ &&  $1 !~ /^horst$/ &&  $1 !~ /^hors-texte$/ &&  $1 !~ /^hot$/ &&  $1 !~ /^hot dog$/ &&  $1 !~ /^hot-flue$/ &&  $1 !~ /^hotinus$/ &&  $1 !~ /^hot money$/ &&  $1 !~ /^hotte$/ &&  $1 !~ /^hottée$/ &&  $1 !~ /^hotu$/ &&  $1 !~ /^hou !$/ &&  $1 !~ /^houache$/ &&  $1 !~ /^houage$/ &&  $1 !~ /^houaiche$/ &&  $1 !~ /^houblon$/ &&  $1 !~ /^houe$/ &&  $1 !~ /^houer$/ &&  $1 !~ /^houille$/ &&  $1 !~ /^houiller$/ &&  $1 !~ /^houillère$/ &&  $1 !~ /^houle$/ &&  $1 !~ /^houlette$/ &&  $1 !~ /^houleuse$/ &&  $1 !~ /^houleux$/ &&  $1 !~ /^houligan$/ &&  $1 !~ /^houliganisme$/ &&  $1 !~ /^houlque$/ &&  $1 !~ /^houp !$/ &&  $1 !~ /^houppe$/ &&  $1 !~ /^houppelande$/ &&  $1 !~ /^houppette$/ &&  $1 !~ /^houppier$/ &&  $1 !~ /^hourd$/ &&  $1 !~ /^hourdage$/ &&  $1 !~ /^hourder$/ &&  $1 !~ /^hourdir$/ &&  $1 !~ /^hourdis$/ &&  $1 !~ /^houri$/ &&  $1 !~ /^hourque$/ &&  $1 !~ /^hourra !$/ &&  $1 !~ /^hourri$/ &&  $1 !~ /^hourrite$/ &&  $1 !~ /^hourvari$/ &&  $1 !~ /^housche$/ &&  $1 !~ /^houseau$/ &&  $1 !~ /^house-boat$/ &&  $1 !~ /^houspiller$/ &&  $1 !~ /^houssage$/ &&  $1 !~ /^housse$/ &&  $1 !~ /^housser$/ &&  $1 !~ /^housset$/ &&  $1 !~ /^houssière$/ &&  $1 !~ /^houst !$/ &&  $1 !~ /^houx$/ &&  $1 !~ /^hovéa$/ &&  $1 !~ /^hoyau$/ &&  $1 !~ /^hoyé$/ &&  $1 !~ /^hoyée$/ &&  $1 !~ /^huard$/ &&  $1 !~ /^huart$/ &&  $1 !~ /^hublot$/ &&  $1 !~ /^huche$/ &&  $1 !~ /^hucher$/ &&  $1 !~ /^huchier$/ &&  $1 !~ /^hue !$/ &&  $1 !~ /^huée$/ &&  $1 !~ /^huer$/ &&  $1 !~ /^huerta$/ &&  $1 !~ /^huguenot$/ &&  $1 !~ /^huipil$/ &&  $1 !~ /^huir$/ &&  $1 !~ /^huis clos$/ &&  $1 !~ /^huit$/ &&  $1 !~ /^huitain$/ &&  $1 !~ /^huitaine$/ &&  $1 !~ /^huitante$/ &&  $1 !~ /^huit-en-huit$/ &&  $1 !~ /^huitième$/ &&  $1 !~ /^huitièmement$/ &&  $1 !~ /^huit-reflets$/ &&  $1 !~ /^hulotte$/ &&  $1 !~ /^hululation$/ &&  $1 !~ /^hululement$/ &&  $1 !~ /^hululer$/ &&  $1 !~ /^humer$/ &&  $1 !~ /^hum ! $/ &&  $1 !~ /^humantin$/ &&  $1 !~ /^hune$/ &&  $1 !~ /^hunier$/ &&  $1 !~ /^hunter$/ &&  $1 !~ /^huppe$/ &&  $1 !~ /^huppé$/ &&  $1 !~ /^huppée$/ &&  $1 !~ /^huque$/ &&  $1 !~ /^hurdler$/ &&  $1 !~ /^hure$/ &&  $1 !~ /^hurlant$/ &&  $1 !~ /^hurlement$/ &&  $1 !~ /^hurler$/ &&  $1 !~ /^hurleur$/ &&  $1 !~ /^hurleuse$/ &&  $1 !~ /^huron$/ &&  $1 !~ /^Huron$/ &&  $1 !~ /^huronne$/ &&  $1 !~ /^hurrah !$/ &&  $1 !~ /^hurricane$/ &&  $1 !~ /^husky$/ &&  $1 !~ /^hussard$/ &&  $1 !~ /^hussarde$/ &&  $1 !~ /^hutinet$/ &&  $1 !~ /^hutte$/ &&  $1 !~ /^hutteau$/ &&  $1 !~ /^hack$/ &&  $1 !~ /^hacker$/ &&  $1 !~ /^haïk$/ &&  $1 !~ /^hadj$/ &&  $1 !~ /^havanaise$/ &&  $1 !~ /^havanais$/ &&  $1 !~ /^high/ &&  $1 !~ /^haï/ && $1 !~ /^haka$/ && $1 !~ /^hakka$/ &&  $1 !~ /^handball$/ &&  $1 !~ /^house/ &&  $1 !~ /^hadith$/)
		{
		    print "\"L" $2 "\": \"l'" $1 "\",";
		    print "\"KL" $2 "\": \"que l'" $1 "\",";
		    # print "\"ST" $2 "\": \"cette " $1 "\",";
		    print "\"ST/" $2 "\": \"cette " $1 "\",";
		    print "\"ST/" $2 "/LA\": \"cette " $1 "-là\",";
		}
	    }


	    if ($1 ~ /^[aeiouéàâêïîô]/){
		print "\"L" $2 "\": \"l'" $1 "\",";
		print "\"ST" $2 "\": \"cette " $1 "\",";
		print "\"ST/" $2 "/LA\": \"cette " $1 "-là\",";
		print "\"KL" $2 "\": \"que l'" $1 "\",";
 		# print "\"SOn/" $2 "\": \"son " $1 "\",";
		# print "\"MOn/" $2 "\": \"mon " $1 "\",";
		# print "\"TOn/" $2 "\": \"ton " $1 "\",";
		# print "\"NO/TR" $2 "\": \"notre " $1 "\",";
		# print "\"F*O/TR" $2 "\": \"votre " $1 "\",";
		# print "\"KMOn/" $2 "\": \"que mon " $1 "\",";
		# print "\"KTOn/" $2 "\": \"que ton " $1 "\",";
		# print "\"KNO/TR" $2 "\": \"que notre " $1 "\",";
		# print "\"KF*O/TR" $2 "\": \"que votre " $1 "\",";
	    }
	}

## *** Mixte singulier

	if($4 ~ /^$/ && $5 ~ /s/)
	{
	    if ($1  ~ /^[^aeiouéàâêïîôh]/){
		# print "\"L/" $2 "\": \"le " $1 "\",";
		# print "\"KL/" $2 "\": \"que le " $1 "\",";
		print "\"S/" $2 "\": \"ce " $1 "\",";
		print "\"S/" $2 "/LA\": \"ce " $1 "-là\",";
		print "\"ST/" $2 "\": \"cette " $1 "\",";
		print "\"ST/" $2 "/LA\": \"cette " $1 "-là\",";
		if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
		if ($2 ~ /^[FNLR]/)				{stsone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2);  print "\"" stsone "\": \"cette " $1 "\",";}
	    }

	    if ($1 ~ /^h/){
		if ( $1 !~ /^hâblerie$/  &&  $1 !~ /^hâbleur$/ &&  $1 !~ /^hâbleuse$/ &&  $1 !~ /^hachage$/ &&  $1 !~ /^hache$/ &&  $1 !~ /^haché$/ &&  $1 !~ /^hachée$/ &&  $1 !~ /^hache-légumes$/ &&  $1 !~ /^hachement$/ &&  $1 !~ /^hache-paille$/ &&  $1 !~ /^hacher$/ &&  $1 !~ /^hachette$/ &&  $1 !~ /^hacheur$/ &&  $1 !~ /^hache-viande$/ &&  $1 !~ /^hachis$/ &&  $1 !~ /^hachisch$/ &&  $1 !~ /^hachoir$/ &&  $1 !~ /^hachure$/ &&  $1 !~ /^hachurer$/ &&  $1 !~ /^hackle$/ &&  $1 !~ /^hadal$/ &&  $1 !~ /^hadale$/ &&  $1 !~ /^hadaux$/ &&  $1 !~ /^haddock$/ &&  $1 !~ /^haflinger$/ &&  $1 !~ /^hafnium$/ &&  $1 !~ /^hagard$/ &&  $1 !~ /^haggis$/ &&  $1 !~ /^haie$/ &&  $1 !~ /^haillon$/ &&  $1 !~ /^haillonneuse$/ &&  $1 !~ /^haillonneux$/ &&  $1 !~ /^haine$/ &&  $1 !~ /^haineuse$/ &&  $1 !~ /^haineusement$/ &&  $1 !~ /^haineux$/ &&  $1 !~ /^haïr$/ &&  $1 !~ /^haire$/ &&  $1 !~ /^haïssable$/ &&  $1 !~ /^Haïtien$/ &&  $1 !~ /^Haïtienne$/ &&  $1 !~ /^halage$/ &&  $1 !~ /^hâlage$/ &&  $1 !~ /^halal$/ &&  $1 !~ /^halbi$/ &&  $1 !~ /^halbran$/ &&  $1 !~ /^halbrené$/ &&  $1 !~ /^halbrenée$/ &&  $1 !~ /^halde$/ &&  $1 !~ /^hâle$/ &&  $1 !~ /^hâlé$/ &&  $1 !~ /^hale-bas$/ &&  $1 !~ /^hale-breu$/ &&  $1 !~ /^hale-croc$/ &&  $1 !~ /^hâlée$/ &&  $1 !~ /^halefis$/ &&  $1 !~ /^hâle-haut$/ &&  $1 !~ /^haler$/ &&  $1 !~ /^hâler$/ &&  $1 !~ /^haletant$/ &&  $1 !~ /^halètement$/ &&  $1 !~ /^haleter$/ &&  $1 !~ /^haleur$/ &&  $1 !~ /^haleuse$/ &&  $1 !~ /^half-track$/ &&  $1 !~ /^hall$/ &&  $1 !~ /^halle$/ &&  $1 !~ /^hallebarde$/ &&  $1 !~ /^hallux$/ &&  $1 !~ /^halo$/ &&  $1 !~ /^halte$/ &&  $1 !~ /^halte-garderie$/ &&  $1 !~ /^hamac$/ &&  $1 !~ /^hamada$/ &&  $1 !~ /^hamburger$/ &&  $1 !~ /^hameau$/ &&  $1 !~ /^hamman$/ &&  $1 !~ /^hampe$/ &&  $1 !~ /^hamster$/ &&  $1 !~ /^hanche$/ &&  $1 !~ /^hanchement$/ &&  $1 !~ /^hancher$/ &&  $1 !~ /^hand-ball$/ &&  $1 !~ /^handballeur$/ &&  $1 !~ /^handballeuse$/ &&  $1 !~ /^handicap$/ &&  $1 !~ /^handicapant$/ &&  $1 !~ /^handicapante$/ &&  $1 !~ /^handicapé$/ &&  $1 !~ /^handicapée$/ &&  $1 !~ /^handicaper$/ &&  $1 !~ /^handicapeur$/ &&  $1 !~ /^handisport$/ &&  $1 !~ /^hangar$/ &&  $1 !~ /^hanneton$/ &&  $1 !~ /^hanon$/ &&  $1 !~ /^hanse$/ &&  $1 !~ /^hanter$/ &&  $1 !~ /^hantise$/ &&  $1 !~ /^happement$/ &&  $1 !~ /^happening$/ &&  $1 !~ /^happer$/ &&  $1 !~ /^happy end$/ &&  $1 !~ /^haque$/ &&  $1 !~ /^haquenée$/ &&  $1 !~ /^haquet$/ &&  $1 !~ /^hara-kiri$/ &&  $1 !~ /^harangue$/ &&  $1 !~ /^haranguer$/ &&  $1 !~ /^harangueur$/ &&  $1 !~ /^harangueuse$/ &&  $1 !~ /^haras$/ &&  $1 !~ /^harassant$/ &&  $1 !~ /^harassante$/ &&  $1 !~ /^harassé$/ &&  $1 !~ /^harassée$/ &&  $1 !~ /^harassement$/ &&  $1 !~ /^harasser$/ &&  $1 !~ /^harcelant$/ &&  $1 !~ /^harcelante$/ &&  $1 !~ /^harcèlement$/ &&  $1 !~ /^harceler$/ &&  $1 !~ /^hard$/ &&  $1 !~ /^hard-bop$/ &&  $1 !~ /^hard-core$/ &&  $1 !~ /^harde$/ &&  $1 !~ /^hardé$/ &&  $1 !~ /^hard-edge$/ &&  $1 !~ /^harder$/ &&  $1 !~ /^hardes$/ &&  $1 !~ /^hard ground$/ &&  $1 !~ /^hardi$/ &&  $1 !~ /^hardie$/ &&  $1 !~ /^hardiesse$/ &&  $1 !~ /^hardiment$/ &&  $1 !~ /^hard-rock$/ &&  $1 !~ /^hard-top$/ &&  $1 !~ /^hardware$/ &&  $1 !~ /^harem$/ &&  $1 !~ /^hareng$/ &&  $1 !~ /^harengade$/ &&  $1 !~ /^harengaison$/ &&  $1 !~ /^harengère$/ &&  $1 !~ /^harenguet$/ &&  $1 !~ /^harengueux$/ &&  $1 !~ /^harenguier$/ &&  $1 !~ /^harenguière$/ &&  $1 !~ /^haret$/ &&  $1 !~ /^harfang$/ &&  $1 !~ /^hargne$/ &&  $1 !~ /^hargneuse$/ &&  $1 !~ /^hargneusement$/ &&  $1 !~ /^hargneux$/ &&  $1 !~ /^haricot$/ &&  $1 !~ /^haridelle$/ &&  $1 !~ /^harissa$/ &&  $1 !~ /^harka$/ &&  $1 !~ /^harki$/ &&  $1 !~ /^harnachement$/ &&  $1 !~ /^harnacher$/ &&  $1 !~ /^harnais$/ &&  $1 !~ /^harnat$/ &&  $1 !~ /^harnois$/ &&  $1 !~ /^haro$/ &&  $1 !~ /^harouelle$/ &&  $1 !~ /^harpail$/ &&  $1 !~ /^harpaye$/ &&  $1 !~ /^harpe$/ &&  $1 !~ /^harpe-cithare$/ &&  $1 !~ /^harpe-luth$/ &&  $1 !~ /^harpette$/ &&  $1 !~ /^harpie$/ &&  $1 !~ /^harpiste$/ &&  $1 !~ /^harpocéras$/ &&  $1 !~ /^harpodon$/ &&  $1 !~ /^harpoise$/ &&  $1 !~ /^harpon$/ &&  $1 !~ /^harponnage$/ &&  $1 !~ /^harponnement$/ &&  $1 !~ /^harponner$/ &&  $1 !~ /^harponneur$/ &&  $1 !~ /^harpye$/ &&  $1 !~ /^harrier$/ &&  $1 !~ /^hart$/ &&  $1 !~ /^hasard$/ &&  $1 !~ /^hasarder$/ &&  $1 !~ /^hasardeuse$/ &&  $1 !~ /^hasardeusement$/ &&  $1 !~ /^hasardeux$/ &&  $1 !~ /^has been$/ &&  $1 !~ /^hasch$/ &&  $1 !~ /^haschich$/ &&  $1 !~ /^haschisch$/ &&  $1 !~ /^hase$/ &&  $1 !~ /^hâte$/ &&  $1 !~ /^hâter$/ &&  $1 !~ /^hatha-yoga$/ &&  $1 !~ /^hâtier$/ &&  $1 !~ /^hâtif$/ &&  $1 !~ /^hâtive$/ &&  $1 !~ /^hattéria$/ &&  $1 !~ /^hauban$/ &&  $1 !~ /^haubanage$/ &&  $1 !~ /^haubaner$/ &&  $1 !~ /^haubert$/ &&  $1 !~ /^hausse$/ &&  $1 !~ /^hausse-col$/ &&  $1 !~ /^haussement$/ &&  $1 !~ /^hausser$/ &&  $1 !~ /^hausse-repère$/ &&  $1 !~ /^haussier$/ &&  $1 !~ /^haussière$/ &&  $1 !~ /^haut$/ &&  $1 !~ /^hautain$/ &&  $1 !~ /^hautaine$/ &&  $1 !~ /^haut-bar$/ &&  $1 !~ /^hautbois$/ &&  $1 !~ /^hautboïste$/ &&  $1 !~ /^haut-commissaire$/ &&  $1 !~ /^haut-commissariat$/ &&  $1 !~ /^haut-de-chausse(s)$/ &&  $1 !~ /^haut-de-côtelettes$/ &&  $1 !~ /^haut-de-côtes$/ &&  $1 !~ /^haut-de-forme$/ &&  $1 !~ /^haute$/ &&  $1 !~ /^haute-contre$/ &&  $1 !~ /^hautement$/ &&  $1 !~ /^haute-tige$/ &&  $1 !~ /^hauteur$/ &&  $1 !~ /^haut-fond$/ &&  $1 !~ /^haut-fourneau$/ &&  $1 !~ /^hautin$/ &&  $1 !~ /^haut-jointé$/ &&  $1 !~ /^haut-jointée$/ &&  $1 !~ /^haut-le-cœur$/ &&  $1 !~ /^haut-le-corps$/ &&  $1 !~ /^haut-le-pied$/ &&  $1 !~ /^haut-parc$/ &&  $1 !~ /^haut-parleur$/ &&  $1 !~ /^haut-relief$/ &&  $1 !~ /^hauturier$/ &&  $1 !~ /^hauturière$/ &&  $1 !~ /^havage$/ &&  $1 !~ /^havane$/ &&  $1 !~ /^hâve$/ &&  $1 !~ /^havée$/ &&  $1 !~ /^haveneau$/ &&  $1 !~ /^havenet$/ &&  $1 !~ /^haver$/ &&  $1 !~ /^haveur$/ &&  $1 !~ /^haveuse$/ &&  $1 !~ /^havre$/ &&  $1 !~ /^havresac$/ &&  $1 !~ /^havrit$/ &&  $1 !~ /^haylage$/ &&  $1 !~ /^hayon$/ &&  $1 !~ /^hé !$/ &&  $1 !~ /^heat-set$/ &&  $1 !~ /^heaume$/ &&  $1 !~ /^hein !$/ &&  $1 !~ /^héler$/ &&  $1 !~ /^hem !$/ &&  $1 !~ /^henné$/ &&  $1 !~ /^hennin$/ &&  $1 !~ /^hennir$/ &&  $1 !~ /^hennissant$/ &&  $1 !~ /^hennissante$/ &&  $1 !~ /^hennissement$/ &&  $1 !~ /^hennuyer$/ &&  $1 !~ /^hep !$/ &&  $1 !~ /^héraut$/ &&  $1 !~ /^hère$/ &&  $1 !~ /^hérissé$/ &&  $1 !~ /^hérissée$/ &&  $1 !~ /^hérissement$/ &&  $1 !~ /^hérisser$/ &&  $1 !~ /^hérisson$/ &&  $1 !~ /^hérissonne$/ &&  $1 !~ /^herniaire$/ &&  $1 !~ /^hernie$/ &&  $1 !~ /^hernié$/ &&  $1 !~ /^herniée$/ &&  $1 !~ /^hernieuse$/ &&  $1 !~ /^hernieux$/ &&  $1 !~ /^héroïne$/ &&  $1 !~ /^héron$/ &&  $1 !~ /^héronneau$/ &&  $1 !~ /^héronnier$/ &&  $1 !~ /^héronnière$/ &&  $1 !~ /^héros$/ &&  $1 !~ /^hersage$/ &&  $1 !~ /^herse$/ &&  $1 !~ /^herser$/ &&  $1 !~ /^hersillon$/ &&  $1 !~ /^hêtraie$/ &&  $1 !~ /^hêtre$/ &&  $1 !~ /^heu !$/ &&  $1 !~ /^heurt$/ &&  $1 !~ /^heurter$/ &&  $1 !~ /^heurtoir$/ &&  $1 !~ /^hibou$/ &&  $1 !~ /^hic$/ &&  $1 !~ /^hickory$/ &&  $1 !~ /^hideur$/ &&  $1 !~ /^hideuse$/ &&  $1 !~ /^hideusement$/ &&  $1 !~ /^hideux$/ &&  $1 !~ /^hidjab$/ &&  $1 !~ /^hiement$/ &&  $1 !~ /^hiérarchie$/ &&  $1 !~ /^hiérarchique$/ &&  $1 !~ /^hiérarchiquement$/ &&  $1 !~ /^hiérarchisation$/ &&  $1 !~ /^hiérarchiser$/ &&  $1 !~ /^hiérarque$/ &&  $1 !~ /^hi-fi$/ &&  $1 !~ /^high bulk$/ &&  $1 !~ /^high-tech$/ &&  $1 !~ /^hilaire$/ &&  $1 !~ /^hile$/ &&  $1 !~ /^hindi$/ &&  $1 !~ /^hip !$/ &&  $1 !~ /^hip-hop$/ &&  $1 !~ /^hippie$/ &&  $1 !~ /^hippy$/ &&  $1 !~ /^hissage$/ &&  $1 !~ /^hit$/ &&  $1 !~ /^hit-parade$/ &&  $1 !~ /^ho !$/ &&  $1 !~ /^hobby$/ &&  $1 !~ /^hobbyste$/ &&  $1 !~ /^hobereau$/ &&  $1 !~ /^hochement$/ &&  $1 !~ /^hochepot$/ &&  $1 !~ /^hochequeue$/ &&  $1 !~ /^hocher$/ &&  $1 !~ /^hochet$/ &&  $1 !~ /^hockey$/ &&  $1 !~ /^hockeyeur$/ &&  $1 !~ /^hockeyeuse$/ &&  $1 !~ /^ho! hisse!$/ &&  $1 !~ /^holà !$/ &&  $1 !~ /^holding$/ &&  $1 !~ /^hold-up$/ &&  $1 !~ /^Hollande$/ &&  $1 !~ /^hollandite$/ &&  $1 !~ /^hollywoodien$/ &&  $1 !~ /^hollywoodienne$/ &&  $1 !~ /^homard$/ &&  $1 !~ /^homarderie$/ &&  $1 !~ /^homardier$/ &&  $1 !~ /^home$/ &&  $1 !~ /^home-trainer$/ &&  $1 !~ /^hongre$/ &&  $1 !~ /^hongrer$/ &&  $1 !~ /^hongreur$/ &&  $1 !~ /^hongreuse$/ &&  $1 !~ /^Hongrie$/ &&  $1 !~ /^hongroierie$/ &&  $1 !~ /^hongroyage$/ &&  $1 !~ /^hongroyer$/ &&  $1 !~ /^hongroyeur$/ &&  $1 !~ /^honning$/ &&  $1 !~ /^honnir$/ &&  $1 !~ /^honoris causa$/ &&  $1 !~ /^honte$/ &&  $1 !~ /^honteuse$/ &&  $1 !~ /^honteusement$/ &&  $1 !~ /^honteux$/ &&  $1 !~ /^hooligan$/ &&  $1 !~ /^hooliganisme$/ &&  $1 !~ /^hop !$/ &&  $1 !~ /^hop-je$/ &&  $1 !~ /^hoquet$/ &&  $1 !~ /^hoqueter$/ &&  $1 !~ /^hoqueton$/ &&  $1 !~ /^horde$/ &&  $1 !~ /^horion$/ &&  $1 !~ /^hormis$/ &&  $1 !~ /^hornblende$/ &&  $1 !~ /^hors$/ &&  $1 !~ /^horsain$/ &&  $1 !~ /^hors-bord$/ &&  $1 !~ /^hors-cote$/ &&  $1 !~ /^hors de$/ &&  $1 !~ /^hors-de-cour$/ &&  $1 !~ /^hors-d'œuvre$/ &&  $1 !~ /^horse-guard$/ &&  $1 !~ /^horse power$/ &&  $1 !~ /^horsin$/ &&  $1 !~ /^hors-jeu$/ &&  $1 !~ /^hors-la-loi$/ &&  $1 !~ /^hors-ligne$/ &&  $1 !~ /^hors-marché$/ &&  $1 !~ /^hors-piste$/ &&  $1 !~ /^hors-pistes$/ &&  $1 !~ /^hors-statut$/ &&  $1 !~ /^horst$/ &&  $1 !~ /^hors-texte$/ &&  $1 !~ /^hot$/ &&  $1 !~ /^hot dog$/ &&  $1 !~ /^hot-flue$/ &&  $1 !~ /^hotinus$/ &&  $1 !~ /^hot money$/ &&  $1 !~ /^hotte$/ &&  $1 !~ /^hottée$/ &&  $1 !~ /^hotu$/ &&  $1 !~ /^hou !$/ &&  $1 !~ /^houache$/ &&  $1 !~ /^houage$/ &&  $1 !~ /^houaiche$/ &&  $1 !~ /^houblon$/ &&  $1 !~ /^houe$/ &&  $1 !~ /^houer$/ &&  $1 !~ /^houille$/ &&  $1 !~ /^houiller$/ &&  $1 !~ /^houillère$/ &&  $1 !~ /^houle$/ &&  $1 !~ /^houlette$/ &&  $1 !~ /^houleuse$/ &&  $1 !~ /^houleux$/ &&  $1 !~ /^houligan$/ &&  $1 !~ /^houliganisme$/ &&  $1 !~ /^houlque$/ &&  $1 !~ /^houp !$/ &&  $1 !~ /^houppe$/ &&  $1 !~ /^houppelande$/ &&  $1 !~ /^houppette$/ &&  $1 !~ /^houppier$/ &&  $1 !~ /^hourd$/ &&  $1 !~ /^hourdage$/ &&  $1 !~ /^hourder$/ &&  $1 !~ /^hourdir$/ &&  $1 !~ /^hourdis$/ &&  $1 !~ /^houri$/ &&  $1 !~ /^hourque$/ &&  $1 !~ /^hourra !$/ &&  $1 !~ /^hourri$/ &&  $1 !~ /^hourrite$/ &&  $1 !~ /^hourvari$/ &&  $1 !~ /^housche$/ &&  $1 !~ /^houseau$/ &&  $1 !~ /^house-boat$/ &&  $1 !~ /^houspiller$/ &&  $1 !~ /^houssage$/ &&  $1 !~ /^housse$/ &&  $1 !~ /^housser$/ &&  $1 !~ /^housset$/ &&  $1 !~ /^houssière$/ &&  $1 !~ /^houst !$/ &&  $1 !~ /^houx$/ &&  $1 !~ /^hovéa$/ &&  $1 !~ /^hoyau$/ &&  $1 !~ /^hoyé$/ &&  $1 !~ /^hoyée$/ &&  $1 !~ /^huard$/ &&  $1 !~ /^huart$/ &&  $1 !~ /^hublot$/ &&  $1 !~ /^huche$/ &&  $1 !~ /^hucher$/ &&  $1 !~ /^huchier$/ &&  $1 !~ /^hue !$/ &&  $1 !~ /^huée$/ &&  $1 !~ /^huer$/ &&  $1 !~ /^huerta$/ &&  $1 !~ /^huguenot$/ &&  $1 !~ /^huipil$/ &&  $1 !~ /^huir$/ &&  $1 !~ /^huis clos$/ &&  $1 !~ /^huit$/ &&  $1 !~ /^huitain$/ &&  $1 !~ /^huitaine$/ &&  $1 !~ /^huitante$/ &&  $1 !~ /^huit-en-huit$/ &&  $1 !~ /^huitième$/ &&  $1 !~ /^huitièmement$/ &&  $1 !~ /^huit-reflets$/ &&  $1 !~ /^hulotte$/ &&  $1 !~ /^hululation$/ &&  $1 !~ /^hululement$/ &&  $1 !~ /^hululer$/ &&  $1 !~ /^humer$/ &&  $1 !~ /^hum ! $/ &&  $1 !~ /^humantin$/ &&  $1 !~ /^hune$/ &&  $1 !~ /^hunier$/ &&  $1 !~ /^hunter$/ &&  $1 !~ /^huppe$/ &&  $1 !~ /^huppé$/ &&  $1 !~ /^huppée$/ &&  $1 !~ /^huque$/ &&  $1 !~ /^hurdler$/ &&  $1 !~ /^hure$/ &&  $1 !~ /^hurlant$/ &&  $1 !~ /^hurlement$/ &&  $1 !~ /^hurler$/ &&  $1 !~ /^hurleur$/ &&  $1 !~ /^hurleuse$/ &&  $1 !~ /^huron$/ &&  $1 !~ /^Huron$/ &&  $1 !~ /^huronne$/ &&  $1 !~ /^hurrah !$/ &&  $1 !~ /^hurricane$/ &&  $1 !~ /^husky$/ &&  $1 !~ /^hussard$/ &&  $1 !~ /^hussarde$/ &&  $1 !~ /^hutinet$/ &&  $1 !~ /^hutte$/ &&  $1 !~ /^hutteau$/ &&  $1 !~ /^hack$/ &&  $1 !~ /^hacker$/ &&  $1 !~ /^haïk$/ &&  $1 !~ /^hadj$/ &&  $1 !~ /^havanaise$/ &&  $1 !~ /^havanais$/ &&  $1 !~ /^high/ &&  $1 !~ /^haï/ && $1 !~ /^haka$/ && $1 !~ /^hakka$/ &&  $1 !~ /^handball$/ &&  $1 !~ /^house/ &&  $1 !~ /^hadith$/)

		{
		    print "\"L" $2 "\": \"l'" $1 "\",";
		    print "\"KL" $2 "\": \"que l'" $1 "\",";
		    print "\"ST" $2 "\": \"cet " $1 "\",";
		    print "\"ST/" $2 "/EU\": \"cette " $1 "\",";
		}
		else
		{
		print "\"S/" $2 "\": \"ce " $1 "\",";
		}
	    }

	    if ($1 ~ /^[aeiouéàâêïîô]/){
		print "\"L" $2 "\": \"l'" $1 "\",";
		print "\"KL" $2 "\": \"que l'" $1 "\",";
		print "\"ST/" $2 "\": \"cet " $1 "\",";
		print "\"ST/" $2 "/EU\": \"cette " $1 "\",";
		# print "\"NO/TR" $2 "\": \"notre " $1 "\",";
		# print "\"F*O/TR" $2 "\": \"votre " $1 "\",";
	    }


	}



## ** Les contraction de base : D ID C KM

	sub(/SYOn$/, "C", $2);
	sub(/SYO\/NI/, "SNI", $2);
	sub(/KO\/MO/, "KMO", $2);
	sub(/KO\/MI/, "KMI", $2);
	sub(/KO\/MU/, "KMU", $2);
	sub(/KO\/ME/, "KME", $2);

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

## ** 2e moulinage
## *** Pluriel
	if ($5 ~ /p/){
	    print "\"" $2 "/$\": \"" $1 "\",";
	    # print "\"LE/" $2 "\": \"les " $1 "\",";
	    # print "\"T*E/" $2 "\": \"des " $1 "\",";
	    print "\"SE/" $2 "\": \"ces " $1 "\",";
	    print "\"SE/" $2 "/*\": \"ses " $1 "\",";
	    print "\"ME/" $2 "\": \"mes " $1 "\",";
	    # print "\"TE/" $2 "\": \"tes " $1 "\",";
	    # print "\"NO/" $2 "\": \"nos " $1 "\",";
	    # print "\"F*O/" $2 "\": \"vos " $1 "\",";
	    print "\"LEUl/" $2 "/$\": \"leurs " $1 "\",";

	    # print "\"KElC/" $2 "\": \"quelques " $1 "\",";
	    # print "\"KLE/" $2 "\": \"que les " $1 "\",";
	    # print "\"KT*E/" $2 "\": \"que des " $1 "\",";
	    # print "\"KME/" $2 "\": \"que mes " $1 "\",";
	    # print "\"KTE/" $2 "\": \"que tes " $1 "\",";
	    # print "\"KNO/" $2 "\": \"que nos " $1 "\",";
	    # print "\"KF*O/" $2 "\": \"que vos " $1 "\",";
	    print "\"KLEUl/" $2 "/$\": \"que leurs " $1 "\",";

	    if ($4 ~ /m/){
		print "\"KEl/" $2 "/$\": \"quels " $1 "\",";
		print "\"TEl/" $2 "/$\": \"tels " $1 "\",";
		print "\"NUl/" $2 "/$\": \"nuls " $1 "\",";
		print "\"TOU/" $2 "/$\": \"tous " $1 "\",";
		print "\"KTOU/" $2 "/$\": \"que tous " $1 "\",";
	    }

	    if ($4 ~ /f/){
		print "\"KEl/" $2 "/$\": \"quelles " $1 "\",";
		print "\"TEl/" $2 "/$\": \"telles " $1 "\",";
		print "\"NUl/" $2 "/$\": \"nulles " $1 "\",";
		print "\"TOUD/" $2 "/$\": \"toutes " $1 "\",";
		print "\"KTOUD/" $2 "/$\": \"que toutes " $1 "\",";

	    }
	}
## *** Masculin singulier
	if ($4 ~ /m/ && $5 ~ /s/){
	    print "\"" $2 "\": \"" $1 "\",";
	    # print "\"Un/" $2 "\": \"un " $1 "\",";
	    # print "\"SOn/" $2 "\": \"son " $1 "\",";
	    # print "\"MOn/" $2 "\": \"mon " $1 "\",";
	    # print "\"TOn/" $2 "\": \"ton " $1 "\",";
	    # print "\"NO/TR/" $2 "\": \"notre " $1 "\",";
	    # print "\"F*O/TR/" $2 "\": \"votre " $1 "\",";
	    # print "\"LEUl/" $2 "\": \"leur " $1 "\",";
	    # print "\"KEl/" $2 "\": \"quel " $1 "\",";
	    # print "\"TEl/" $2 "\": \"tel " $1 "\",";
	    # print "\"NUl/" $2 "\": \"nul " $1 "\",";
	    # print "\"TOU/" $2 "\": \"tout " $1 "\",";
								# que
	    # print "\"KTOU/" $2 "\": \"que tout " $1 "\",";
	    # print "\"KUn/" $2 "\": \"qu'un " $1 "\",";
	    # print "\"KMOn/" $2 "\": \"que mon " $1 "\",";
	    # print "\"KTOn/" $2 "\": \"que ton " $1 "\",";
	    # print "\"KNO/TR/" $2 "\": \"que notre " $1 "\",";
	    # print "\"KF*O/TR/" $2 "\": \"que votre " $1 "\",";
	    # print "\"KLEUl/" $2 "\": \"que leur " $1 "\",";

	    if ($1  ~ /^[^aeiouéàâêïîôh]/){
		# print "\"L/" $2 "\": \"le " $1 "\",";
		# print "\"KL/" $2 "\": \"que le " $1 "\",";
		print "\"S/" $2 "\": \"ce " $1 "\",";
		if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
	    }

	    if ($1 ~ /^h/){
		if ( $1 !~ /^hâblerie$/  &&  $1 !~ /^hâbleur$/ &&  $1 !~ /^hâbleuse$/ &&  $1 !~ /^hachage$/ &&  $1 !~ /^hache$/ &&  $1 !~ /^haché$/ &&  $1 !~ /^hachée$/ &&  $1 !~ /^hache-légumes$/ &&  $1 !~ /^hachement$/ &&  $1 !~ /^hache-paille$/ &&  $1 !~ /^hacher$/ &&  $1 !~ /^hachette$/ &&  $1 !~ /^hacheur$/ &&  $1 !~ /^hache-viande$/ &&  $1 !~ /^hachis$/ &&  $1 !~ /^hachisch$/ &&  $1 !~ /^hachoir$/ &&  $1 !~ /^hachure$/ &&  $1 !~ /^hachurer$/ &&  $1 !~ /^hackle$/ &&  $1 !~ /^hadal$/ &&  $1 !~ /^hadale$/ &&  $1 !~ /^hadaux$/ &&  $1 !~ /^haddock$/ &&  $1 !~ /^haflinger$/ &&  $1 !~ /^hafnium$/ &&  $1 !~ /^hagard$/ &&  $1 !~ /^haggis$/ &&  $1 !~ /^haie$/ &&  $1 !~ /^haillon$/ &&  $1 !~ /^haillonneuse$/ &&  $1 !~ /^haillonneux$/ &&  $1 !~ /^haine$/ &&  $1 !~ /^haineuse$/ &&  $1 !~ /^haineusement$/ &&  $1 !~ /^haineux$/ &&  $1 !~ /^haïr$/ &&  $1 !~ /^haire$/ &&  $1 !~ /^haïssable$/ &&  $1 !~ /^Haïtien$/ &&  $1 !~ /^Haïtienne$/ &&  $1 !~ /^halage$/ &&  $1 !~ /^hâlage$/ &&  $1 !~ /^halal$/ &&  $1 !~ /^halbi$/ &&  $1 !~ /^halbran$/ &&  $1 !~ /^halbrené$/ &&  $1 !~ /^halbrenée$/ &&  $1 !~ /^halde$/ &&  $1 !~ /^hâle$/ &&  $1 !~ /^hâlé$/ &&  $1 !~ /^hale-bas$/ &&  $1 !~ /^hale-breu$/ &&  $1 !~ /^hale-croc$/ &&  $1 !~ /^hâlée$/ &&  $1 !~ /^halefis$/ &&  $1 !~ /^hâle-haut$/ &&  $1 !~ /^haler$/ &&  $1 !~ /^hâler$/ &&  $1 !~ /^haletant$/ &&  $1 !~ /^halètement$/ &&  $1 !~ /^haleter$/ &&  $1 !~ /^haleur$/ &&  $1 !~ /^haleuse$/ &&  $1 !~ /^half-track$/ &&  $1 !~ /^hall$/ &&  $1 !~ /^halle$/ &&  $1 !~ /^hallebarde$/ &&  $1 !~ /^hallux$/ &&  $1 !~ /^halo$/ &&  $1 !~ /^halte$/ &&  $1 !~ /^halte-garderie$/ &&  $1 !~ /^hamac$/ &&  $1 !~ /^hamada$/ &&  $1 !~ /^hamburger$/ &&  $1 !~ /^hameau$/ &&  $1 !~ /^hamman$/ &&  $1 !~ /^hampe$/ &&  $1 !~ /^hamster$/ &&  $1 !~ /^hanche$/ &&  $1 !~ /^hanchement$/ &&  $1 !~ /^hancher$/ &&  $1 !~ /^hand-ball$/ &&  $1 !~ /^handballeur$/ &&  $1 !~ /^handballeuse$/ &&  $1 !~ /^handicap$/ &&  $1 !~ /^handicapant$/ &&  $1 !~ /^handicapante$/ &&  $1 !~ /^handicapé$/ &&  $1 !~ /^handicapée$/ &&  $1 !~ /^handicaper$/ &&  $1 !~ /^handicapeur$/ &&  $1 !~ /^handisport$/ &&  $1 !~ /^hangar$/ &&  $1 !~ /^hanneton$/ &&  $1 !~ /^hanon$/ &&  $1 !~ /^hanse$/ &&  $1 !~ /^hanter$/ &&  $1 !~ /^hantise$/ &&  $1 !~ /^happement$/ &&  $1 !~ /^happening$/ &&  $1 !~ /^happer$/ &&  $1 !~ /^happy end$/ &&  $1 !~ /^haque$/ &&  $1 !~ /^haquenée$/ &&  $1 !~ /^haquet$/ &&  $1 !~ /^hara-kiri$/ &&  $1 !~ /^harangue$/ &&  $1 !~ /^haranguer$/ &&  $1 !~ /^harangueur$/ &&  $1 !~ /^harangueuse$/ &&  $1 !~ /^haras$/ &&  $1 !~ /^harassant$/ &&  $1 !~ /^harassante$/ &&  $1 !~ /^harassé$/ &&  $1 !~ /^harassée$/ &&  $1 !~ /^harassement$/ &&  $1 !~ /^harasser$/ &&  $1 !~ /^harcelant$/ &&  $1 !~ /^harcelante$/ &&  $1 !~ /^harcèlement$/ &&  $1 !~ /^harceler$/ &&  $1 !~ /^hard$/ &&  $1 !~ /^hard-bop$/ &&  $1 !~ /^hard-core$/ &&  $1 !~ /^harde$/ &&  $1 !~ /^hardé$/ &&  $1 !~ /^hard-edge$/ &&  $1 !~ /^harder$/ &&  $1 !~ /^hardes$/ &&  $1 !~ /^hard ground$/ &&  $1 !~ /^hardi$/ &&  $1 !~ /^hardie$/ &&  $1 !~ /^hardiesse$/ &&  $1 !~ /^hardiment$/ &&  $1 !~ /^hard-rock$/ &&  $1 !~ /^hard-top$/ &&  $1 !~ /^hardware$/ &&  $1 !~ /^harem$/ &&  $1 !~ /^hareng$/ &&  $1 !~ /^harengade$/ &&  $1 !~ /^harengaison$/ &&  $1 !~ /^harengère$/ &&  $1 !~ /^harenguet$/ &&  $1 !~ /^harengueux$/ &&  $1 !~ /^harenguier$/ &&  $1 !~ /^harenguière$/ &&  $1 !~ /^haret$/ &&  $1 !~ /^harfang$/ &&  $1 !~ /^hargne$/ &&  $1 !~ /^hargneuse$/ &&  $1 !~ /^hargneusement$/ &&  $1 !~ /^hargneux$/ &&  $1 !~ /^haricot$/ &&  $1 !~ /^haridelle$/ &&  $1 !~ /^harissa$/ &&  $1 !~ /^harka$/ &&  $1 !~ /^harki$/ &&  $1 !~ /^harnachement$/ &&  $1 !~ /^harnacher$/ &&  $1 !~ /^harnais$/ &&  $1 !~ /^harnat$/ &&  $1 !~ /^harnois$/ &&  $1 !~ /^haro$/ &&  $1 !~ /^harouelle$/ &&  $1 !~ /^harpail$/ &&  $1 !~ /^harpaye$/ &&  $1 !~ /^harpe$/ &&  $1 !~ /^harpe-cithare$/ &&  $1 !~ /^harpe-luth$/ &&  $1 !~ /^harpette$/ &&  $1 !~ /^harpie$/ &&  $1 !~ /^harpiste$/ &&  $1 !~ /^harpocéras$/ &&  $1 !~ /^harpodon$/ &&  $1 !~ /^harpoise$/ &&  $1 !~ /^harpon$/ &&  $1 !~ /^harponnage$/ &&  $1 !~ /^harponnement$/ &&  $1 !~ /^harponner$/ &&  $1 !~ /^harponneur$/ &&  $1 !~ /^harpye$/ &&  $1 !~ /^harrier$/ &&  $1 !~ /^hart$/ &&  $1 !~ /^hasard$/ &&  $1 !~ /^hasarder$/ &&  $1 !~ /^hasardeuse$/ &&  $1 !~ /^hasardeusement$/ &&  $1 !~ /^hasardeux$/ &&  $1 !~ /^has been$/ &&  $1 !~ /^hasch$/ &&  $1 !~ /^haschich$/ &&  $1 !~ /^haschisch$/ &&  $1 !~ /^hase$/ &&  $1 !~ /^hâte$/ &&  $1 !~ /^hâter$/ &&  $1 !~ /^hatha-yoga$/ &&  $1 !~ /^hâtier$/ &&  $1 !~ /^hâtif$/ &&  $1 !~ /^hâtive$/ &&  $1 !~ /^hattéria$/ &&  $1 !~ /^hauban$/ &&  $1 !~ /^haubanage$/ &&  $1 !~ /^haubaner$/ &&  $1 !~ /^haubert$/ &&  $1 !~ /^hausse$/ &&  $1 !~ /^hausse-col$/ &&  $1 !~ /^haussement$/ &&  $1 !~ /^hausser$/ &&  $1 !~ /^hausse-repère$/ &&  $1 !~ /^haussier$/ &&  $1 !~ /^haussière$/ &&  $1 !~ /^haut$/ &&  $1 !~ /^hautain$/ &&  $1 !~ /^hautaine$/ &&  $1 !~ /^haut-bar$/ &&  $1 !~ /^hautbois$/ &&  $1 !~ /^hautboïste$/ &&  $1 !~ /^haut-commissaire$/ &&  $1 !~ /^haut-commissariat$/ &&  $1 !~ /^haut-de-chausse(s)$/ &&  $1 !~ /^haut-de-côtelettes$/ &&  $1 !~ /^haut-de-côtes$/ &&  $1 !~ /^haut-de-forme$/ &&  $1 !~ /^haute$/ &&  $1 !~ /^haute-contre$/ &&  $1 !~ /^hautement$/ &&  $1 !~ /^haute-tige$/ &&  $1 !~ /^hauteur$/ &&  $1 !~ /^haut-fond$/ &&  $1 !~ /^haut-fourneau$/ &&  $1 !~ /^hautin$/ &&  $1 !~ /^haut-jointé$/ &&  $1 !~ /^haut-jointée$/ &&  $1 !~ /^haut-le-cœur$/ &&  $1 !~ /^haut-le-corps$/ &&  $1 !~ /^haut-le-pied$/ &&  $1 !~ /^haut-parc$/ &&  $1 !~ /^haut-parleur$/ &&  $1 !~ /^haut-relief$/ &&  $1 !~ /^hauturier$/ &&  $1 !~ /^hauturière$/ &&  $1 !~ /^havage$/ &&  $1 !~ /^havane$/ &&  $1 !~ /^hâve$/ &&  $1 !~ /^havée$/ &&  $1 !~ /^haveneau$/ &&  $1 !~ /^havenet$/ &&  $1 !~ /^haver$/ &&  $1 !~ /^haveur$/ &&  $1 !~ /^haveuse$/ &&  $1 !~ /^havre$/ &&  $1 !~ /^havresac$/ &&  $1 !~ /^havrit$/ &&  $1 !~ /^haylage$/ &&  $1 !~ /^hayon$/ &&  $1 !~ /^hé !$/ &&  $1 !~ /^heat-set$/ &&  $1 !~ /^heaume$/ &&  $1 !~ /^hein !$/ &&  $1 !~ /^héler$/ &&  $1 !~ /^hem !$/ &&  $1 !~ /^henné$/ &&  $1 !~ /^hennin$/ &&  $1 !~ /^hennir$/ &&  $1 !~ /^hennissant$/ &&  $1 !~ /^hennissante$/ &&  $1 !~ /^hennissement$/ &&  $1 !~ /^hennuyer$/ &&  $1 !~ /^hep !$/ &&  $1 !~ /^héraut$/ &&  $1 !~ /^hère$/ &&  $1 !~ /^hérissé$/ &&  $1 !~ /^hérissée$/ &&  $1 !~ /^hérissement$/ &&  $1 !~ /^hérisser$/ &&  $1 !~ /^hérisson$/ &&  $1 !~ /^hérissonne$/ &&  $1 !~ /^herniaire$/ &&  $1 !~ /^hernie$/ &&  $1 !~ /^hernié$/ &&  $1 !~ /^herniée$/ &&  $1 !~ /^hernieuse$/ &&  $1 !~ /^hernieux$/ &&  $1 !~ /^héroïne$/ &&  $1 !~ /^héron$/ &&  $1 !~ /^héronneau$/ &&  $1 !~ /^héronnier$/ &&  $1 !~ /^héronnière$/ &&  $1 !~ /^héros$/ &&  $1 !~ /^hersage$/ &&  $1 !~ /^herse$/ &&  $1 !~ /^herser$/ &&  $1 !~ /^hersillon$/ &&  $1 !~ /^hêtraie$/ &&  $1 !~ /^hêtre$/ &&  $1 !~ /^heu !$/ &&  $1 !~ /^heurt$/ &&  $1 !~ /^heurter$/ &&  $1 !~ /^heurtoir$/ &&  $1 !~ /^hibou$/ &&  $1 !~ /^hic$/ &&  $1 !~ /^hickory$/ &&  $1 !~ /^hideur$/ &&  $1 !~ /^hideuse$/ &&  $1 !~ /^hideusement$/ &&  $1 !~ /^hideux$/ &&  $1 !~ /^hidjab$/ &&  $1 !~ /^hiement$/ &&  $1 !~ /^hiérarchie$/ &&  $1 !~ /^hiérarchique$/ &&  $1 !~ /^hiérarchiquement$/ &&  $1 !~ /^hiérarchisation$/ &&  $1 !~ /^hiérarchiser$/ &&  $1 !~ /^hiérarque$/ &&  $1 !~ /^hi-fi$/ &&  $1 !~ /^high bulk$/ &&  $1 !~ /^high-tech$/ &&  $1 !~ /^hilaire$/ &&  $1 !~ /^hile$/ &&  $1 !~ /^hindi$/ &&  $1 !~ /^hip !$/ &&  $1 !~ /^hip-hop$/ &&  $1 !~ /^hippie$/ &&  $1 !~ /^hippy$/ &&  $1 !~ /^hissage$/ &&  $1 !~ /^hit$/ &&  $1 !~ /^hit-parade$/ &&  $1 !~ /^ho !$/ &&  $1 !~ /^hobby$/ &&  $1 !~ /^hobbyste$/ &&  $1 !~ /^hobereau$/ &&  $1 !~ /^hochement$/ &&  $1 !~ /^hochepot$/ &&  $1 !~ /^hochequeue$/ &&  $1 !~ /^hocher$/ &&  $1 !~ /^hochet$/ &&  $1 !~ /^hockey$/ &&  $1 !~ /^hockeyeur$/ &&  $1 !~ /^hockeyeuse$/ &&  $1 !~ /^ho! hisse!$/ &&  $1 !~ /^holà !$/ &&  $1 !~ /^holding$/ &&  $1 !~ /^hold-up$/ &&  $1 !~ /^Hollande$/ &&  $1 !~ /^hollandite$/ &&  $1 !~ /^hollywoodien$/ &&  $1 !~ /^hollywoodienne$/ &&  $1 !~ /^homard$/ &&  $1 !~ /^homarderie$/ &&  $1 !~ /^homardier$/ &&  $1 !~ /^home$/ &&  $1 !~ /^home-trainer$/ &&  $1 !~ /^hongre$/ &&  $1 !~ /^hongrer$/ &&  $1 !~ /^hongreur$/ &&  $1 !~ /^hongreuse$/ &&  $1 !~ /^Hongrie$/ &&  $1 !~ /^hongroierie$/ &&  $1 !~ /^hongroyage$/ &&  $1 !~ /^hongroyer$/ &&  $1 !~ /^hongroyeur$/ &&  $1 !~ /^honning$/ &&  $1 !~ /^honnir$/ &&  $1 !~ /^honoris causa$/ &&  $1 !~ /^honte$/ &&  $1 !~ /^honteuse$/ &&  $1 !~ /^honteusement$/ &&  $1 !~ /^honteux$/ &&  $1 !~ /^hooligan$/ &&  $1 !~ /^hooliganisme$/ &&  $1 !~ /^hop !$/ &&  $1 !~ /^hop-je$/ &&  $1 !~ /^hoquet$/ &&  $1 !~ /^hoqueter$/ &&  $1 !~ /^hoqueton$/ &&  $1 !~ /^horde$/ &&  $1 !~ /^horion$/ &&  $1 !~ /^hormis$/ &&  $1 !~ /^hornblende$/ &&  $1 !~ /^hors$/ &&  $1 !~ /^horsain$/ &&  $1 !~ /^hors-bord$/ &&  $1 !~ /^hors-cote$/ &&  $1 !~ /^hors de$/ &&  $1 !~ /^hors-de-cour$/ &&  $1 !~ /^hors-d'œuvre$/ &&  $1 !~ /^horse-guard$/ &&  $1 !~ /^horse power$/ &&  $1 !~ /^horsin$/ &&  $1 !~ /^hors-jeu$/ &&  $1 !~ /^hors-la-loi$/ &&  $1 !~ /^hors-ligne$/ &&  $1 !~ /^hors-marché$/ &&  $1 !~ /^hors-piste$/ &&  $1 !~ /^hors-pistes$/ &&  $1 !~ /^hors-statut$/ &&  $1 !~ /^horst$/ &&  $1 !~ /^hors-texte$/ &&  $1 !~ /^hot$/ &&  $1 !~ /^hot dog$/ &&  $1 !~ /^hot-flue$/ &&  $1 !~ /^hotinus$/ &&  $1 !~ /^hot money$/ &&  $1 !~ /^hotte$/ &&  $1 !~ /^hottée$/ &&  $1 !~ /^hotu$/ &&  $1 !~ /^hou !$/ &&  $1 !~ /^houache$/ &&  $1 !~ /^houage$/ &&  $1 !~ /^houaiche$/ &&  $1 !~ /^houblon$/ &&  $1 !~ /^houe$/ &&  $1 !~ /^houer$/ &&  $1 !~ /^houille$/ &&  $1 !~ /^houiller$/ &&  $1 !~ /^houillère$/ &&  $1 !~ /^houle$/ &&  $1 !~ /^houlette$/ &&  $1 !~ /^houleuse$/ &&  $1 !~ /^houleux$/ &&  $1 !~ /^houligan$/ &&  $1 !~ /^houliganisme$/ &&  $1 !~ /^houlque$/ &&  $1 !~ /^houp !$/ &&  $1 !~ /^houppe$/ &&  $1 !~ /^houppelande$/ &&  $1 !~ /^houppette$/ &&  $1 !~ /^houppier$/ &&  $1 !~ /^hourd$/ &&  $1 !~ /^hourdage$/ &&  $1 !~ /^hourder$/ &&  $1 !~ /^hourdir$/ &&  $1 !~ /^hourdis$/ &&  $1 !~ /^houri$/ &&  $1 !~ /^hourque$/ &&  $1 !~ /^hourra !$/ &&  $1 !~ /^hourri$/ &&  $1 !~ /^hourrite$/ &&  $1 !~ /^hourvari$/ &&  $1 !~ /^housche$/ &&  $1 !~ /^houseau$/ &&  $1 !~ /^house-boat$/ &&  $1 !~ /^houspiller$/ &&  $1 !~ /^houssage$/ &&  $1 !~ /^housse$/ &&  $1 !~ /^housser$/ &&  $1 !~ /^housset$/ &&  $1 !~ /^houssière$/ &&  $1 !~ /^houst !$/ &&  $1 !~ /^houx$/ &&  $1 !~ /^hovéa$/ &&  $1 !~ /^hoyau$/ &&  $1 !~ /^hoyé$/ &&  $1 !~ /^hoyée$/ &&  $1 !~ /^huard$/ &&  $1 !~ /^huart$/ &&  $1 !~ /^hublot$/ &&  $1 !~ /^huche$/ &&  $1 !~ /^hucher$/ &&  $1 !~ /^huchier$/ &&  $1 !~ /^hue !$/ &&  $1 !~ /^huée$/ &&  $1 !~ /^huer$/ &&  $1 !~ /^huerta$/ &&  $1 !~ /^huguenot$/ &&  $1 !~ /^huipil$/ &&  $1 !~ /^huir$/ &&  $1 !~ /^huis clos$/ &&  $1 !~ /^huit$/ &&  $1 !~ /^huitain$/ &&  $1 !~ /^huitaine$/ &&  $1 !~ /^huitante$/ &&  $1 !~ /^huit-en-huit$/ &&  $1 !~ /^huitième$/ &&  $1 !~ /^huitièmement$/ &&  $1 !~ /^huit-reflets$/ &&  $1 !~ /^hulotte$/ &&  $1 !~ /^hululation$/ &&  $1 !~ /^hululement$/ &&  $1 !~ /^hululer$/ &&  $1 !~ /^humer$/ &&  $1 !~ /^hum ! $/ &&  $1 !~ /^humantin$/ &&  $1 !~ /^hune$/ &&  $1 !~ /^hunier$/ &&  $1 !~ /^hunter$/ &&  $1 !~ /^huppe$/ &&  $1 !~ /^huppé$/ &&  $1 !~ /^huppée$/ &&  $1 !~ /^huque$/ &&  $1 !~ /^hurdler$/ &&  $1 !~ /^hure$/ &&  $1 !~ /^hurlant$/ &&  $1 !~ /^hurlement$/ &&  $1 !~ /^hurler$/ &&  $1 !~ /^hurleur$/ &&  $1 !~ /^hurleuse$/ &&  $1 !~ /^huron$/ &&  $1 !~ /^Huron$/ &&  $1 !~ /^huronne$/ &&  $1 !~ /^hurrah !$/ &&  $1 !~ /^hurricane$/ &&  $1 !~ /^husky$/ &&  $1 !~ /^hussard$/ &&  $1 !~ /^hussarde$/ &&  $1 !~ /^hutinet$/ &&  $1 !~ /^hutte$/ &&  $1 !~ /^hutteau$/ &&  $1 !~ /^hack$/ &&  $1 !~ /^hacker$/ &&  $1 !~ /^haïk$/ &&  $1 !~ /^hadj$/ &&  $1 !~ /^havanaise$/ &&  $1 !~ /^havanais$/ &&  $1 !~ /^high/ &&  $1 !~ /^haï/ && $1 !~ /^haka$/ && $1 !~ /^hakka$/ &&  $1 !~ /^handball$/ &&  $1 !~ /^house/ &&  $1 !~ /^hadith$/)

		{
		    print "\"L" $2 "\": \"l'" $1 "\",";
		    print "\"KL" $2 "\": \"que l'" $1 "\",";
		    print "\"ST" $2 "\": \"cet " $1 "\",";
		    print "\"ST/" $2 "\": \"cet " $1 "\",";
		}
		else
		{
		print "\"S/" $2 "\": \"ce " $1 "\",";
		}
	    }

	    if ($1 ~ /^[aeiouéàâêïîô]/){
		print "\"L" $2 "\": \"l'" $1 "\",";
		print "\"KL" $2 "\": \"que l'" $1 "\",";
		print "\"ST" $2 "\": \"cet " $1 "\",";
		print "\"ST/" $2 "\": \"cet " $1 "\",";
		# print "\"NO/TR" $2 "\": \"notre " $1 "\",";
		# print "\"F*O/TR" $2 "\": \"votre " $1 "\",";
	    }

	}
## *** Féminin  singulier
	if ($4 ~ /f/ && $5 ~ /s/){
	    print "\"" $2 "\": \"" $1 "\",";
	    # print "\"UnC/" $2 "\": \"une " $1 "\",";
	    print "\"ST/" $2 "\": \"cette " $1 "\",";
	    # print "\"NO/TR/" $2 "\": \"notre " $1 "\",";
	    # print "\"F*O/TR/" $2 "\": \"votre " $1 "\",";
	    # print "\"LEUl/" $2 "\": \"leur " $1 "\",";
	    print "\"KEl/" $2 "\": \"quelle " $1 "\",";
	    print "\"TEl/" $2 "\": \"telle " $1 "\",";
	    print "\"NUl/" $2 "\": \"nulle " $1 "\",";
	    # print "\"TOUD/" $2 "\": \"toute " $1 "\",";
	    # print "\"KTOUD/" $2 "\": \"que toute " $1 "\",";
	    # print "\"KUnC/" $2 "\": \"qu'une " $1 "\",";
	    # print "\"KNO/TR/" $2 "\": \"que notre " $1 "\",";
	    # print "\"KF*O/TR/" $2 "\": \"que votre " $1 "\",";
	    # print "\"KLEUl/" $2 "\": \"que leur " $1 "\",";

	    if ($1  ~ /^[^aeiouéàâêïîôh]/){
		# print "\"LA/" $2 "\": \"la " $1 "\",";
		print "\"ST/" $2 "\": \"cette " $1 "\",";
		# print "\"MA/" $2 "\": \"ma " $1 "\",";
		# print "\"TA/" $2 "\": \"ta " $1 "\",";
		# print "\"SA/" $2 "\": \"sa " $1 "\",";
		# print "\"KLA/" $2 "\": \"que la " $1 "\",";
		# print "\"KMA/" $2 "\": \"que ma " $1 "\",";
		# print "\"KTA/" $2 "\": \"que ta " $1 "\",";
		if ($2 ~ /^[FRNL]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2); print "\"" ssone "\": \"cette " $1 "\",";}
	    }

	    if ($1 ~ /^h/){
		if ( $1 !~ /^hâblerie$/  &&  $1 !~ /^hâbleur$/ &&  $1 !~ /^hâbleuse$/ &&  $1 !~ /^hachage$/ &&  $1 !~ /^hache$/ &&  $1 !~ /^haché$/ &&  $1 !~ /^hachée$/ &&  $1 !~ /^hache-légumes$/ &&  $1 !~ /^hachement$/ &&  $1 !~ /^hache-paille$/ &&  $1 !~ /^hacher$/ &&  $1 !~ /^hachette$/ &&  $1 !~ /^hacheur$/ &&  $1 !~ /^hache-viande$/ &&  $1 !~ /^hachis$/ &&  $1 !~ /^hachisch$/ &&  $1 !~ /^hachoir$/ &&  $1 !~ /^hachure$/ &&  $1 !~ /^hachurer$/ &&  $1 !~ /^hackle$/ &&  $1 !~ /^hadal$/ &&  $1 !~ /^hadale$/ &&  $1 !~ /^hadaux$/ &&  $1 !~ /^haddock$/ &&  $1 !~ /^haflinger$/ &&  $1 !~ /^hafnium$/ &&  $1 !~ /^hagard$/ &&  $1 !~ /^haggis$/ &&  $1 !~ /^haie$/ &&  $1 !~ /^haillon$/ &&  $1 !~ /^haillonneuse$/ &&  $1 !~ /^haillonneux$/ &&  $1 !~ /^haine$/ &&  $1 !~ /^haineuse$/ &&  $1 !~ /^haineusement$/ &&  $1 !~ /^haineux$/ &&  $1 !~ /^haïr$/ &&  $1 !~ /^haire$/ &&  $1 !~ /^haïssable$/ &&  $1 !~ /^Haïtien$/ &&  $1 !~ /^Haïtienne$/ &&  $1 !~ /^halage$/ &&  $1 !~ /^hâlage$/ &&  $1 !~ /^halal$/ &&  $1 !~ /^halbi$/ &&  $1 !~ /^halbran$/ &&  $1 !~ /^halbrené$/ &&  $1 !~ /^halbrenée$/ &&  $1 !~ /^halde$/ &&  $1 !~ /^hâle$/ &&  $1 !~ /^hâlé$/ &&  $1 !~ /^hale-bas$/ &&  $1 !~ /^hale-breu$/ &&  $1 !~ /^hale-croc$/ &&  $1 !~ /^hâlée$/ &&  $1 !~ /^halefis$/ &&  $1 !~ /^hâle-haut$/ &&  $1 !~ /^haler$/ &&  $1 !~ /^hâler$/ &&  $1 !~ /^haletant$/ &&  $1 !~ /^halètement$/ &&  $1 !~ /^haleter$/ &&  $1 !~ /^haleur$/ &&  $1 !~ /^haleuse$/ &&  $1 !~ /^half-track$/ &&  $1 !~ /^hall$/ &&  $1 !~ /^halle$/ &&  $1 !~ /^hallebarde$/ &&  $1 !~ /^hallux$/ &&  $1 !~ /^halo$/ &&  $1 !~ /^halte$/ &&  $1 !~ /^halte-garderie$/ &&  $1 !~ /^hamac$/ &&  $1 !~ /^hamada$/ &&  $1 !~ /^hamburger$/ &&  $1 !~ /^hameau$/ &&  $1 !~ /^hamman$/ &&  $1 !~ /^hampe$/ &&  $1 !~ /^hamster$/ &&  $1 !~ /^hanche$/ &&  $1 !~ /^hanchement$/ &&  $1 !~ /^hancher$/ &&  $1 !~ /^hand-ball$/ &&  $1 !~ /^handballeur$/ &&  $1 !~ /^handballeuse$/ &&  $1 !~ /^handicap$/ &&  $1 !~ /^handicapant$/ &&  $1 !~ /^handicapante$/ &&  $1 !~ /^handicapé$/ &&  $1 !~ /^handicapée$/ &&  $1 !~ /^handicaper$/ &&  $1 !~ /^handicapeur$/ &&  $1 !~ /^handisport$/ &&  $1 !~ /^hangar$/ &&  $1 !~ /^hanneton$/ &&  $1 !~ /^hanon$/ &&  $1 !~ /^hanse$/ &&  $1 !~ /^hanter$/ &&  $1 !~ /^hantise$/ &&  $1 !~ /^happement$/ &&  $1 !~ /^happening$/ &&  $1 !~ /^happer$/ &&  $1 !~ /^happy end$/ &&  $1 !~ /^haque$/ &&  $1 !~ /^haquenée$/ &&  $1 !~ /^haquet$/ &&  $1 !~ /^hara-kiri$/ &&  $1 !~ /^harangue$/ &&  $1 !~ /^haranguer$/ &&  $1 !~ /^harangueur$/ &&  $1 !~ /^harangueuse$/ &&  $1 !~ /^haras$/ &&  $1 !~ /^harassant$/ &&  $1 !~ /^harassante$/ &&  $1 !~ /^harassé$/ &&  $1 !~ /^harassée$/ &&  $1 !~ /^harassement$/ &&  $1 !~ /^harasser$/ &&  $1 !~ /^harcelant$/ &&  $1 !~ /^harcelante$/ &&  $1 !~ /^harcèlement$/ &&  $1 !~ /^harceler$/ &&  $1 !~ /^hard$/ &&  $1 !~ /^hard-bop$/ &&  $1 !~ /^hard-core$/ &&  $1 !~ /^harde$/ &&  $1 !~ /^hardé$/ &&  $1 !~ /^hard-edge$/ &&  $1 !~ /^harder$/ &&  $1 !~ /^hardes$/ &&  $1 !~ /^hard ground$/ &&  $1 !~ /^hardi$/ &&  $1 !~ /^hardie$/ &&  $1 !~ /^hardiesse$/ &&  $1 !~ /^hardiment$/ &&  $1 !~ /^hard-rock$/ &&  $1 !~ /^hard-top$/ &&  $1 !~ /^hardware$/ &&  $1 !~ /^harem$/ &&  $1 !~ /^hareng$/ &&  $1 !~ /^harengade$/ &&  $1 !~ /^harengaison$/ &&  $1 !~ /^harengère$/ &&  $1 !~ /^harenguet$/ &&  $1 !~ /^harengueux$/ &&  $1 !~ /^harenguier$/ &&  $1 !~ /^harenguière$/ &&  $1 !~ /^haret$/ &&  $1 !~ /^harfang$/ &&  $1 !~ /^hargne$/ &&  $1 !~ /^hargneuse$/ &&  $1 !~ /^hargneusement$/ &&  $1 !~ /^hargneux$/ &&  $1 !~ /^haricot$/ &&  $1 !~ /^haridelle$/ &&  $1 !~ /^harissa$/ &&  $1 !~ /^harka$/ &&  $1 !~ /^harki$/ &&  $1 !~ /^harnachement$/ &&  $1 !~ /^harnacher$/ &&  $1 !~ /^harnais$/ &&  $1 !~ /^harnat$/ &&  $1 !~ /^harnois$/ &&  $1 !~ /^haro$/ &&  $1 !~ /^harouelle$/ &&  $1 !~ /^harpail$/ &&  $1 !~ /^harpaye$/ &&  $1 !~ /^harpe$/ &&  $1 !~ /^harpe-cithare$/ &&  $1 !~ /^harpe-luth$/ &&  $1 !~ /^harpette$/ &&  $1 !~ /^harpie$/ &&  $1 !~ /^harpiste$/ &&  $1 !~ /^harpocéras$/ &&  $1 !~ /^harpodon$/ &&  $1 !~ /^harpoise$/ &&  $1 !~ /^harpon$/ &&  $1 !~ /^harponnage$/ &&  $1 !~ /^harponnement$/ &&  $1 !~ /^harponner$/ &&  $1 !~ /^harponneur$/ &&  $1 !~ /^harpye$/ &&  $1 !~ /^harrier$/ &&  $1 !~ /^hart$/ &&  $1 !~ /^hasard$/ &&  $1 !~ /^hasarder$/ &&  $1 !~ /^hasardeuse$/ &&  $1 !~ /^hasardeusement$/ &&  $1 !~ /^hasardeux$/ &&  $1 !~ /^has been$/ &&  $1 !~ /^hasch$/ &&  $1 !~ /^haschich$/ &&  $1 !~ /^haschisch$/ &&  $1 !~ /^hase$/ &&  $1 !~ /^hâte$/ &&  $1 !~ /^hâter$/ &&  $1 !~ /^hatha-yoga$/ &&  $1 !~ /^hâtier$/ &&  $1 !~ /^hâtif$/ &&  $1 !~ /^hâtive$/ &&  $1 !~ /^hattéria$/ &&  $1 !~ /^hauban$/ &&  $1 !~ /^haubanage$/ &&  $1 !~ /^haubaner$/ &&  $1 !~ /^haubert$/ &&  $1 !~ /^hausse$/ &&  $1 !~ /^hausse-col$/ &&  $1 !~ /^haussement$/ &&  $1 !~ /^hausser$/ &&  $1 !~ /^hausse-repère$/ &&  $1 !~ /^haussier$/ &&  $1 !~ /^haussière$/ &&  $1 !~ /^haut$/ &&  $1 !~ /^hautain$/ &&  $1 !~ /^hautaine$/ &&  $1 !~ /^haut-bar$/ &&  $1 !~ /^hautbois$/ &&  $1 !~ /^hautboïste$/ &&  $1 !~ /^haut-commissaire$/ &&  $1 !~ /^haut-commissariat$/ &&  $1 !~ /^haut-de-chausse(s)$/ &&  $1 !~ /^haut-de-côtelettes$/ &&  $1 !~ /^haut-de-côtes$/ &&  $1 !~ /^haut-de-forme$/ &&  $1 !~ /^haute$/ &&  $1 !~ /^haute-contre$/ &&  $1 !~ /^hautement$/ &&  $1 !~ /^haute-tige$/ &&  $1 !~ /^hauteur$/ &&  $1 !~ /^haut-fond$/ &&  $1 !~ /^haut-fourneau$/ &&  $1 !~ /^hautin$/ &&  $1 !~ /^haut-jointé$/ &&  $1 !~ /^haut-jointée$/ &&  $1 !~ /^haut-le-cœur$/ &&  $1 !~ /^haut-le-corps$/ &&  $1 !~ /^haut-le-pied$/ &&  $1 !~ /^haut-parc$/ &&  $1 !~ /^haut-parleur$/ &&  $1 !~ /^haut-relief$/ &&  $1 !~ /^hauturier$/ &&  $1 !~ /^hauturière$/ &&  $1 !~ /^havage$/ &&  $1 !~ /^havane$/ &&  $1 !~ /^hâve$/ &&  $1 !~ /^havée$/ &&  $1 !~ /^haveneau$/ &&  $1 !~ /^havenet$/ &&  $1 !~ /^haver$/ &&  $1 !~ /^haveur$/ &&  $1 !~ /^haveuse$/ &&  $1 !~ /^havre$/ &&  $1 !~ /^havresac$/ &&  $1 !~ /^havrit$/ &&  $1 !~ /^haylage$/ &&  $1 !~ /^hayon$/ &&  $1 !~ /^hé !$/ &&  $1 !~ /^heat-set$/ &&  $1 !~ /^heaume$/ &&  $1 !~ /^hein !$/ &&  $1 !~ /^héler$/ &&  $1 !~ /^hem !$/ &&  $1 !~ /^henné$/ &&  $1 !~ /^hennin$/ &&  $1 !~ /^hennir$/ &&  $1 !~ /^hennissant$/ &&  $1 !~ /^hennissante$/ &&  $1 !~ /^hennissement$/ &&  $1 !~ /^hennuyer$/ &&  $1 !~ /^hep !$/ &&  $1 !~ /^héraut$/ &&  $1 !~ /^hère$/ &&  $1 !~ /^hérissé$/ &&  $1 !~ /^hérissée$/ &&  $1 !~ /^hérissement$/ &&  $1 !~ /^hérisser$/ &&  $1 !~ /^hérisson$/ &&  $1 !~ /^hérissonne$/ &&  $1 !~ /^herniaire$/ &&  $1 !~ /^hernie$/ &&  $1 !~ /^hernié$/ &&  $1 !~ /^herniée$/ &&  $1 !~ /^hernieuse$/ &&  $1 !~ /^hernieux$/ &&  $1 !~ /^héroïne$/ &&  $1 !~ /^héron$/ &&  $1 !~ /^héronneau$/ &&  $1 !~ /^héronnier$/ &&  $1 !~ /^héronnière$/ &&  $1 !~ /^héros$/ &&  $1 !~ /^hersage$/ &&  $1 !~ /^herse$/ &&  $1 !~ /^herser$/ &&  $1 !~ /^hersillon$/ &&  $1 !~ /^hêtraie$/ &&  $1 !~ /^hêtre$/ &&  $1 !~ /^heu !$/ &&  $1 !~ /^heurt$/ &&  $1 !~ /^heurter$/ &&  $1 !~ /^heurtoir$/ &&  $1 !~ /^hibou$/ &&  $1 !~ /^hic$/ &&  $1 !~ /^hickory$/ &&  $1 !~ /^hideur$/ &&  $1 !~ /^hideuse$/ &&  $1 !~ /^hideusement$/ &&  $1 !~ /^hideux$/ &&  $1 !~ /^hidjab$/ &&  $1 !~ /^hiement$/ &&  $1 !~ /^hiérarchie$/ &&  $1 !~ /^hiérarchique$/ &&  $1 !~ /^hiérarchiquement$/ &&  $1 !~ /^hiérarchisation$/ &&  $1 !~ /^hiérarchiser$/ &&  $1 !~ /^hiérarque$/ &&  $1 !~ /^hi-fi$/ &&  $1 !~ /^high bulk$/ &&  $1 !~ /^high-tech$/ &&  $1 !~ /^hilaire$/ &&  $1 !~ /^hile$/ &&  $1 !~ /^hindi$/ &&  $1 !~ /^hip !$/ &&  $1 !~ /^hip-hop$/ &&  $1 !~ /^hippie$/ &&  $1 !~ /^hippy$/ &&  $1 !~ /^hissage$/ &&  $1 !~ /^hit$/ &&  $1 !~ /^hit-parade$/ &&  $1 !~ /^ho !$/ &&  $1 !~ /^hobby$/ &&  $1 !~ /^hobbyste$/ &&  $1 !~ /^hobereau$/ &&  $1 !~ /^hochement$/ &&  $1 !~ /^hochepot$/ &&  $1 !~ /^hochequeue$/ &&  $1 !~ /^hocher$/ &&  $1 !~ /^hochet$/ &&  $1 !~ /^hockey$/ &&  $1 !~ /^hockeyeur$/ &&  $1 !~ /^hockeyeuse$/ &&  $1 !~ /^ho! hisse!$/ &&  $1 !~ /^holà !$/ &&  $1 !~ /^holding$/ &&  $1 !~ /^hold-up$/ &&  $1 !~ /^Hollande$/ &&  $1 !~ /^hollandite$/ &&  $1 !~ /^hollywoodien$/ &&  $1 !~ /^hollywoodienne$/ &&  $1 !~ /^homard$/ &&  $1 !~ /^homarderie$/ &&  $1 !~ /^homardier$/ &&  $1 !~ /^home$/ &&  $1 !~ /^home-trainer$/ &&  $1 !~ /^hongre$/ &&  $1 !~ /^hongrer$/ &&  $1 !~ /^hongreur$/ &&  $1 !~ /^hongreuse$/ &&  $1 !~ /^Hongrie$/ &&  $1 !~ /^hongroierie$/ &&  $1 !~ /^hongroyage$/ &&  $1 !~ /^hongroyer$/ &&  $1 !~ /^hongroyeur$/ &&  $1 !~ /^honning$/ &&  $1 !~ /^honnir$/ &&  $1 !~ /^honoris causa$/ &&  $1 !~ /^honte$/ &&  $1 !~ /^honteuse$/ &&  $1 !~ /^honteusement$/ &&  $1 !~ /^honteux$/ &&  $1 !~ /^hooligan$/ &&  $1 !~ /^hooliganisme$/ &&  $1 !~ /^hop !$/ &&  $1 !~ /^hop-je$/ &&  $1 !~ /^hoquet$/ &&  $1 !~ /^hoqueter$/ &&  $1 !~ /^hoqueton$/ &&  $1 !~ /^horde$/ &&  $1 !~ /^horion$/ &&  $1 !~ /^hormis$/ &&  $1 !~ /^hornblende$/ &&  $1 !~ /^hors$/ &&  $1 !~ /^horsain$/ &&  $1 !~ /^hors-bord$/ &&  $1 !~ /^hors-cote$/ &&  $1 !~ /^hors de$/ &&  $1 !~ /^hors-de-cour$/ &&  $1 !~ /^hors-d'œuvre$/ &&  $1 !~ /^horse-guard$/ &&  $1 !~ /^horse power$/ &&  $1 !~ /^horsin$/ &&  $1 !~ /^hors-jeu$/ &&  $1 !~ /^hors-la-loi$/ &&  $1 !~ /^hors-ligne$/ &&  $1 !~ /^hors-marché$/ &&  $1 !~ /^hors-piste$/ &&  $1 !~ /^hors-pistes$/ &&  $1 !~ /^hors-statut$/ &&  $1 !~ /^horst$/ &&  $1 !~ /^hors-texte$/ &&  $1 !~ /^hot$/ &&  $1 !~ /^hot dog$/ &&  $1 !~ /^hot-flue$/ &&  $1 !~ /^hotinus$/ &&  $1 !~ /^hot money$/ &&  $1 !~ /^hotte$/ &&  $1 !~ /^hottée$/ &&  $1 !~ /^hotu$/ &&  $1 !~ /^hou !$/ &&  $1 !~ /^houache$/ &&  $1 !~ /^houage$/ &&  $1 !~ /^houaiche$/ &&  $1 !~ /^houblon$/ &&  $1 !~ /^houe$/ &&  $1 !~ /^houer$/ &&  $1 !~ /^houille$/ &&  $1 !~ /^houiller$/ &&  $1 !~ /^houillère$/ &&  $1 !~ /^houle$/ &&  $1 !~ /^houlette$/ &&  $1 !~ /^houleuse$/ &&  $1 !~ /^houleux$/ &&  $1 !~ /^houligan$/ &&  $1 !~ /^houliganisme$/ &&  $1 !~ /^houlque$/ &&  $1 !~ /^houp !$/ &&  $1 !~ /^houppe$/ &&  $1 !~ /^houppelande$/ &&  $1 !~ /^houppette$/ &&  $1 !~ /^houppier$/ &&  $1 !~ /^hourd$/ &&  $1 !~ /^hourdage$/ &&  $1 !~ /^hourder$/ &&  $1 !~ /^hourdir$/ &&  $1 !~ /^hourdis$/ &&  $1 !~ /^houri$/ &&  $1 !~ /^hourque$/ &&  $1 !~ /^hourra !$/ &&  $1 !~ /^hourri$/ &&  $1 !~ /^hourrite$/ &&  $1 !~ /^hourvari$/ &&  $1 !~ /^housche$/ &&  $1 !~ /^houseau$/ &&  $1 !~ /^house-boat$/ &&  $1 !~ /^houspiller$/ &&  $1 !~ /^houssage$/ &&  $1 !~ /^housse$/ &&  $1 !~ /^housser$/ &&  $1 !~ /^housset$/ &&  $1 !~ /^houssière$/ &&  $1 !~ /^houst !$/ &&  $1 !~ /^houx$/ &&  $1 !~ /^hovéa$/ &&  $1 !~ /^hoyau$/ &&  $1 !~ /^hoyé$/ &&  $1 !~ /^hoyée$/ &&  $1 !~ /^huard$/ &&  $1 !~ /^huart$/ &&  $1 !~ /^hublot$/ &&  $1 !~ /^huche$/ &&  $1 !~ /^hucher$/ &&  $1 !~ /^huchier$/ &&  $1 !~ /^hue !$/ &&  $1 !~ /^huée$/ &&  $1 !~ /^huer$/ &&  $1 !~ /^huerta$/ &&  $1 !~ /^huguenot$/ &&  $1 !~ /^huipil$/ &&  $1 !~ /^huir$/ &&  $1 !~ /^huis clos$/ &&  $1 !~ /^huit$/ &&  $1 !~ /^huitain$/ &&  $1 !~ /^huitaine$/ &&  $1 !~ /^huitante$/ &&  $1 !~ /^huit-en-huit$/ &&  $1 !~ /^huitième$/ &&  $1 !~ /^huitièmement$/ &&  $1 !~ /^huit-reflets$/ &&  $1 !~ /^hulotte$/ &&  $1 !~ /^hululation$/ &&  $1 !~ /^hululement$/ &&  $1 !~ /^hululer$/ &&  $1 !~ /^humer$/ &&  $1 !~ /^hum ! $/ &&  $1 !~ /^humantin$/ &&  $1 !~ /^hune$/ &&  $1 !~ /^hunier$/ &&  $1 !~ /^hunter$/ &&  $1 !~ /^huppe$/ &&  $1 !~ /^huppé$/ &&  $1 !~ /^huppée$/ &&  $1 !~ /^huque$/ &&  $1 !~ /^hurdler$/ &&  $1 !~ /^hure$/ &&  $1 !~ /^hurlant$/ &&  $1 !~ /^hurlement$/ &&  $1 !~ /^hurler$/ &&  $1 !~ /^hurleur$/ &&  $1 !~ /^hurleuse$/ &&  $1 !~ /^huron$/ &&  $1 !~ /^Huron$/ &&  $1 !~ /^huronne$/ &&  $1 !~ /^hurrah !$/ &&  $1 !~ /^hurricane$/ &&  $1 !~ /^husky$/ &&  $1 !~ /^hussard$/ &&  $1 !~ /^hussarde$/ &&  $1 !~ /^hutinet$/ &&  $1 !~ /^hutte$/ &&  $1 !~ /^hutteau$/ &&  $1 !~ /^hack$/ &&  $1 !~ /^hacker$/ &&  $1 !~ /^haïk$/ &&  $1 !~ /^hadj$/ &&  $1 !~ /^havanaise$/ &&  $1 !~ /^havanais$/ &&  $1 !~ /^high/ &&  $1 !~ /^haï/ && $1 !~ /^haka$/ && $1 !~ /^hakka$/ &&  $1 !~ /^handball$/ &&  $1 !~ /^house/ &&  $1 !~ /^hadith$/)
		{
		    print "\"L" $2 "\": \"l'" $1 "\",";
		    print "\"KL" $2 "\": \"que l'" $1 "\",";
		    # print "\"ST" $2 "\": \"cette " $1 "\",";
		    print "\"ST/" $2 "\": \"cette " $1 "\",";
		}
	    }


	    if ($1 ~ /^[aeiouéàâêïîô]/){
		print "\"L" $2 "\": \"l'" $1 "\",";
		print "\"ST" $2 "\": \"cette " $1 "\",";
		print "\"KL" $2 "\": \"que l'" $1 "\",";
 		# print "\"SOn/" $2 "\": \"son " $1 "\",";
		# print "\"MOn/" $2 "\": \"mon " $1 "\",";
		# print "\"TOn/" $2 "\": \"ton " $1 "\",";
		# print "\"NO/TR" $2 "\": \"notre " $1 "\",";
		# print "\"F*O/TR" $2 "\": \"votre " $1 "\",";
		# print "\"KMOn/" $2 "\": \"que mon " $1 "\",";
		# print "\"KTOn/" $2 "\": \"que ton " $1 "\",";
		# print "\"KNO/TR" $2 "\": \"que notre " $1 "\",";
		# print "\"KF*O/TR" $2 "\": \"que votre " $1 "\",";
	    }
	}

## *** Mixte singulier

	if($4 ~ /^$/ && $5 ~ /s/)
	{
	    if ($1  ~ /^[^aeiouéàâêïîôh]/){
		# print "\"L/" $2 "\": \"le " $1 "\",";
		# print "\"KL/" $2 "\": \"que le " $1 "\",";
		print "\"S/" $2 "\": \"ce " $1 "\",";
		print "\"ST/" $2 "\": \"cette " $1 "\",";
		if ($2 ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,$2);  print "\"" ssone "\": \"ce " $1 "\",";}
		if ($2 ~ /^[FNLR]/)				{stsone = gensub(/([KPMTFNLR])/, "ST\\1", 1,$2);  print "\"" stsone "\": \"cette " $1 "\",";}
	    }

	    if ($1 ~ /^h/){
		if ( $1 !~ /^hâblerie$/  &&  $1 !~ /^hâbleur$/ &&  $1 !~ /^hâbleuse$/ &&  $1 !~ /^hachage$/ &&  $1 !~ /^hache$/ &&  $1 !~ /^haché$/ &&  $1 !~ /^hachée$/ &&  $1 !~ /^hache-légumes$/ &&  $1 !~ /^hachement$/ &&  $1 !~ /^hache-paille$/ &&  $1 !~ /^hacher$/ &&  $1 !~ /^hachette$/ &&  $1 !~ /^hacheur$/ &&  $1 !~ /^hache-viande$/ &&  $1 !~ /^hachis$/ &&  $1 !~ /^hachisch$/ &&  $1 !~ /^hachoir$/ &&  $1 !~ /^hachure$/ &&  $1 !~ /^hachurer$/ &&  $1 !~ /^hackle$/ &&  $1 !~ /^hadal$/ &&  $1 !~ /^hadale$/ &&  $1 !~ /^hadaux$/ &&  $1 !~ /^haddock$/ &&  $1 !~ /^haflinger$/ &&  $1 !~ /^hafnium$/ &&  $1 !~ /^hagard$/ &&  $1 !~ /^haggis$/ &&  $1 !~ /^haie$/ &&  $1 !~ /^haillon$/ &&  $1 !~ /^haillonneuse$/ &&  $1 !~ /^haillonneux$/ &&  $1 !~ /^haine$/ &&  $1 !~ /^haineuse$/ &&  $1 !~ /^haineusement$/ &&  $1 !~ /^haineux$/ &&  $1 !~ /^haïr$/ &&  $1 !~ /^haire$/ &&  $1 !~ /^haïssable$/ &&  $1 !~ /^Haïtien$/ &&  $1 !~ /^Haïtienne$/ &&  $1 !~ /^halage$/ &&  $1 !~ /^hâlage$/ &&  $1 !~ /^halal$/ &&  $1 !~ /^halbi$/ &&  $1 !~ /^halbran$/ &&  $1 !~ /^halbrené$/ &&  $1 !~ /^halbrenée$/ &&  $1 !~ /^halde$/ &&  $1 !~ /^hâle$/ &&  $1 !~ /^hâlé$/ &&  $1 !~ /^hale-bas$/ &&  $1 !~ /^hale-breu$/ &&  $1 !~ /^hale-croc$/ &&  $1 !~ /^hâlée$/ &&  $1 !~ /^halefis$/ &&  $1 !~ /^hâle-haut$/ &&  $1 !~ /^haler$/ &&  $1 !~ /^hâler$/ &&  $1 !~ /^haletant$/ &&  $1 !~ /^halètement$/ &&  $1 !~ /^haleter$/ &&  $1 !~ /^haleur$/ &&  $1 !~ /^haleuse$/ &&  $1 !~ /^half-track$/ &&  $1 !~ /^hall$/ &&  $1 !~ /^halle$/ &&  $1 !~ /^hallebarde$/ &&  $1 !~ /^hallux$/ &&  $1 !~ /^halo$/ &&  $1 !~ /^halte$/ &&  $1 !~ /^halte-garderie$/ &&  $1 !~ /^hamac$/ &&  $1 !~ /^hamada$/ &&  $1 !~ /^hamburger$/ &&  $1 !~ /^hameau$/ &&  $1 !~ /^hamman$/ &&  $1 !~ /^hampe$/ &&  $1 !~ /^hamster$/ &&  $1 !~ /^hanche$/ &&  $1 !~ /^hanchement$/ &&  $1 !~ /^hancher$/ &&  $1 !~ /^hand-ball$/ &&  $1 !~ /^handballeur$/ &&  $1 !~ /^handballeuse$/ &&  $1 !~ /^handicap$/ &&  $1 !~ /^handicapant$/ &&  $1 !~ /^handicapante$/ &&  $1 !~ /^handicapé$/ &&  $1 !~ /^handicapée$/ &&  $1 !~ /^handicaper$/ &&  $1 !~ /^handicapeur$/ &&  $1 !~ /^handisport$/ &&  $1 !~ /^hangar$/ &&  $1 !~ /^hanneton$/ &&  $1 !~ /^hanon$/ &&  $1 !~ /^hanse$/ &&  $1 !~ /^hanter$/ &&  $1 !~ /^hantise$/ &&  $1 !~ /^happement$/ &&  $1 !~ /^happening$/ &&  $1 !~ /^happer$/ &&  $1 !~ /^happy end$/ &&  $1 !~ /^haque$/ &&  $1 !~ /^haquenée$/ &&  $1 !~ /^haquet$/ &&  $1 !~ /^hara-kiri$/ &&  $1 !~ /^harangue$/ &&  $1 !~ /^haranguer$/ &&  $1 !~ /^harangueur$/ &&  $1 !~ /^harangueuse$/ &&  $1 !~ /^haras$/ &&  $1 !~ /^harassant$/ &&  $1 !~ /^harassante$/ &&  $1 !~ /^harassé$/ &&  $1 !~ /^harassée$/ &&  $1 !~ /^harassement$/ &&  $1 !~ /^harasser$/ &&  $1 !~ /^harcelant$/ &&  $1 !~ /^harcelante$/ &&  $1 !~ /^harcèlement$/ &&  $1 !~ /^harceler$/ &&  $1 !~ /^hard$/ &&  $1 !~ /^hard-bop$/ &&  $1 !~ /^hard-core$/ &&  $1 !~ /^harde$/ &&  $1 !~ /^hardé$/ &&  $1 !~ /^hard-edge$/ &&  $1 !~ /^harder$/ &&  $1 !~ /^hardes$/ &&  $1 !~ /^hard ground$/ &&  $1 !~ /^hardi$/ &&  $1 !~ /^hardie$/ &&  $1 !~ /^hardiesse$/ &&  $1 !~ /^hardiment$/ &&  $1 !~ /^hard-rock$/ &&  $1 !~ /^hard-top$/ &&  $1 !~ /^hardware$/ &&  $1 !~ /^harem$/ &&  $1 !~ /^hareng$/ &&  $1 !~ /^harengade$/ &&  $1 !~ /^harengaison$/ &&  $1 !~ /^harengère$/ &&  $1 !~ /^harenguet$/ &&  $1 !~ /^harengueux$/ &&  $1 !~ /^harenguier$/ &&  $1 !~ /^harenguière$/ &&  $1 !~ /^haret$/ &&  $1 !~ /^harfang$/ &&  $1 !~ /^hargne$/ &&  $1 !~ /^hargneuse$/ &&  $1 !~ /^hargneusement$/ &&  $1 !~ /^hargneux$/ &&  $1 !~ /^haricot$/ &&  $1 !~ /^haridelle$/ &&  $1 !~ /^harissa$/ &&  $1 !~ /^harka$/ &&  $1 !~ /^harki$/ &&  $1 !~ /^harnachement$/ &&  $1 !~ /^harnacher$/ &&  $1 !~ /^harnais$/ &&  $1 !~ /^harnat$/ &&  $1 !~ /^harnois$/ &&  $1 !~ /^haro$/ &&  $1 !~ /^harouelle$/ &&  $1 !~ /^harpail$/ &&  $1 !~ /^harpaye$/ &&  $1 !~ /^harpe$/ &&  $1 !~ /^harpe-cithare$/ &&  $1 !~ /^harpe-luth$/ &&  $1 !~ /^harpette$/ &&  $1 !~ /^harpie$/ &&  $1 !~ /^harpiste$/ &&  $1 !~ /^harpocéras$/ &&  $1 !~ /^harpodon$/ &&  $1 !~ /^harpoise$/ &&  $1 !~ /^harpon$/ &&  $1 !~ /^harponnage$/ &&  $1 !~ /^harponnement$/ &&  $1 !~ /^harponner$/ &&  $1 !~ /^harponneur$/ &&  $1 !~ /^harpye$/ &&  $1 !~ /^harrier$/ &&  $1 !~ /^hart$/ &&  $1 !~ /^hasard$/ &&  $1 !~ /^hasarder$/ &&  $1 !~ /^hasardeuse$/ &&  $1 !~ /^hasardeusement$/ &&  $1 !~ /^hasardeux$/ &&  $1 !~ /^has been$/ &&  $1 !~ /^hasch$/ &&  $1 !~ /^haschich$/ &&  $1 !~ /^haschisch$/ &&  $1 !~ /^hase$/ &&  $1 !~ /^hâte$/ &&  $1 !~ /^hâter$/ &&  $1 !~ /^hatha-yoga$/ &&  $1 !~ /^hâtier$/ &&  $1 !~ /^hâtif$/ &&  $1 !~ /^hâtive$/ &&  $1 !~ /^hattéria$/ &&  $1 !~ /^hauban$/ &&  $1 !~ /^haubanage$/ &&  $1 !~ /^haubaner$/ &&  $1 !~ /^haubert$/ &&  $1 !~ /^hausse$/ &&  $1 !~ /^hausse-col$/ &&  $1 !~ /^haussement$/ &&  $1 !~ /^hausser$/ &&  $1 !~ /^hausse-repère$/ &&  $1 !~ /^haussier$/ &&  $1 !~ /^haussière$/ &&  $1 !~ /^haut$/ &&  $1 !~ /^hautain$/ &&  $1 !~ /^hautaine$/ &&  $1 !~ /^haut-bar$/ &&  $1 !~ /^hautbois$/ &&  $1 !~ /^hautboïste$/ &&  $1 !~ /^haut-commissaire$/ &&  $1 !~ /^haut-commissariat$/ &&  $1 !~ /^haut-de-chausse(s)$/ &&  $1 !~ /^haut-de-côtelettes$/ &&  $1 !~ /^haut-de-côtes$/ &&  $1 !~ /^haut-de-forme$/ &&  $1 !~ /^haute$/ &&  $1 !~ /^haute-contre$/ &&  $1 !~ /^hautement$/ &&  $1 !~ /^haute-tige$/ &&  $1 !~ /^hauteur$/ &&  $1 !~ /^haut-fond$/ &&  $1 !~ /^haut-fourneau$/ &&  $1 !~ /^hautin$/ &&  $1 !~ /^haut-jointé$/ &&  $1 !~ /^haut-jointée$/ &&  $1 !~ /^haut-le-cœur$/ &&  $1 !~ /^haut-le-corps$/ &&  $1 !~ /^haut-le-pied$/ &&  $1 !~ /^haut-parc$/ &&  $1 !~ /^haut-parleur$/ &&  $1 !~ /^haut-relief$/ &&  $1 !~ /^hauturier$/ &&  $1 !~ /^hauturière$/ &&  $1 !~ /^havage$/ &&  $1 !~ /^havane$/ &&  $1 !~ /^hâve$/ &&  $1 !~ /^havée$/ &&  $1 !~ /^haveneau$/ &&  $1 !~ /^havenet$/ &&  $1 !~ /^haver$/ &&  $1 !~ /^haveur$/ &&  $1 !~ /^haveuse$/ &&  $1 !~ /^havre$/ &&  $1 !~ /^havresac$/ &&  $1 !~ /^havrit$/ &&  $1 !~ /^haylage$/ &&  $1 !~ /^hayon$/ &&  $1 !~ /^hé !$/ &&  $1 !~ /^heat-set$/ &&  $1 !~ /^heaume$/ &&  $1 !~ /^hein !$/ &&  $1 !~ /^héler$/ &&  $1 !~ /^hem !$/ &&  $1 !~ /^henné$/ &&  $1 !~ /^hennin$/ &&  $1 !~ /^hennir$/ &&  $1 !~ /^hennissant$/ &&  $1 !~ /^hennissante$/ &&  $1 !~ /^hennissement$/ &&  $1 !~ /^hennuyer$/ &&  $1 !~ /^hep !$/ &&  $1 !~ /^héraut$/ &&  $1 !~ /^hère$/ &&  $1 !~ /^hérissé$/ &&  $1 !~ /^hérissée$/ &&  $1 !~ /^hérissement$/ &&  $1 !~ /^hérisser$/ &&  $1 !~ /^hérisson$/ &&  $1 !~ /^hérissonne$/ &&  $1 !~ /^herniaire$/ &&  $1 !~ /^hernie$/ &&  $1 !~ /^hernié$/ &&  $1 !~ /^herniée$/ &&  $1 !~ /^hernieuse$/ &&  $1 !~ /^hernieux$/ &&  $1 !~ /^héroïne$/ &&  $1 !~ /^héron$/ &&  $1 !~ /^héronneau$/ &&  $1 !~ /^héronnier$/ &&  $1 !~ /^héronnière$/ &&  $1 !~ /^héros$/ &&  $1 !~ /^hersage$/ &&  $1 !~ /^herse$/ &&  $1 !~ /^herser$/ &&  $1 !~ /^hersillon$/ &&  $1 !~ /^hêtraie$/ &&  $1 !~ /^hêtre$/ &&  $1 !~ /^heu !$/ &&  $1 !~ /^heurt$/ &&  $1 !~ /^heurter$/ &&  $1 !~ /^heurtoir$/ &&  $1 !~ /^hibou$/ &&  $1 !~ /^hic$/ &&  $1 !~ /^hickory$/ &&  $1 !~ /^hideur$/ &&  $1 !~ /^hideuse$/ &&  $1 !~ /^hideusement$/ &&  $1 !~ /^hideux$/ &&  $1 !~ /^hidjab$/ &&  $1 !~ /^hiement$/ &&  $1 !~ /^hiérarchie$/ &&  $1 !~ /^hiérarchique$/ &&  $1 !~ /^hiérarchiquement$/ &&  $1 !~ /^hiérarchisation$/ &&  $1 !~ /^hiérarchiser$/ &&  $1 !~ /^hiérarque$/ &&  $1 !~ /^hi-fi$/ &&  $1 !~ /^high bulk$/ &&  $1 !~ /^high-tech$/ &&  $1 !~ /^hilaire$/ &&  $1 !~ /^hile$/ &&  $1 !~ /^hindi$/ &&  $1 !~ /^hip !$/ &&  $1 !~ /^hip-hop$/ &&  $1 !~ /^hippie$/ &&  $1 !~ /^hippy$/ &&  $1 !~ /^hissage$/ &&  $1 !~ /^hit$/ &&  $1 !~ /^hit-parade$/ &&  $1 !~ /^ho !$/ &&  $1 !~ /^hobby$/ &&  $1 !~ /^hobbyste$/ &&  $1 !~ /^hobereau$/ &&  $1 !~ /^hochement$/ &&  $1 !~ /^hochepot$/ &&  $1 !~ /^hochequeue$/ &&  $1 !~ /^hocher$/ &&  $1 !~ /^hochet$/ &&  $1 !~ /^hockey$/ &&  $1 !~ /^hockeyeur$/ &&  $1 !~ /^hockeyeuse$/ &&  $1 !~ /^ho! hisse!$/ &&  $1 !~ /^holà !$/ &&  $1 !~ /^holding$/ &&  $1 !~ /^hold-up$/ &&  $1 !~ /^Hollande$/ &&  $1 !~ /^hollandite$/ &&  $1 !~ /^hollywoodien$/ &&  $1 !~ /^hollywoodienne$/ &&  $1 !~ /^homard$/ &&  $1 !~ /^homarderie$/ &&  $1 !~ /^homardier$/ &&  $1 !~ /^home$/ &&  $1 !~ /^home-trainer$/ &&  $1 !~ /^hongre$/ &&  $1 !~ /^hongrer$/ &&  $1 !~ /^hongreur$/ &&  $1 !~ /^hongreuse$/ &&  $1 !~ /^Hongrie$/ &&  $1 !~ /^hongroierie$/ &&  $1 !~ /^hongroyage$/ &&  $1 !~ /^hongroyer$/ &&  $1 !~ /^hongroyeur$/ &&  $1 !~ /^honning$/ &&  $1 !~ /^honnir$/ &&  $1 !~ /^honoris causa$/ &&  $1 !~ /^honte$/ &&  $1 !~ /^honteuse$/ &&  $1 !~ /^honteusement$/ &&  $1 !~ /^honteux$/ &&  $1 !~ /^hooligan$/ &&  $1 !~ /^hooliganisme$/ &&  $1 !~ /^hop !$/ &&  $1 !~ /^hop-je$/ &&  $1 !~ /^hoquet$/ &&  $1 !~ /^hoqueter$/ &&  $1 !~ /^hoqueton$/ &&  $1 !~ /^horde$/ &&  $1 !~ /^horion$/ &&  $1 !~ /^hormis$/ &&  $1 !~ /^hornblende$/ &&  $1 !~ /^hors$/ &&  $1 !~ /^horsain$/ &&  $1 !~ /^hors-bord$/ &&  $1 !~ /^hors-cote$/ &&  $1 !~ /^hors de$/ &&  $1 !~ /^hors-de-cour$/ &&  $1 !~ /^hors-d'œuvre$/ &&  $1 !~ /^horse-guard$/ &&  $1 !~ /^horse power$/ &&  $1 !~ /^horsin$/ &&  $1 !~ /^hors-jeu$/ &&  $1 !~ /^hors-la-loi$/ &&  $1 !~ /^hors-ligne$/ &&  $1 !~ /^hors-marché$/ &&  $1 !~ /^hors-piste$/ &&  $1 !~ /^hors-pistes$/ &&  $1 !~ /^hors-statut$/ &&  $1 !~ /^horst$/ &&  $1 !~ /^hors-texte$/ &&  $1 !~ /^hot$/ &&  $1 !~ /^hot dog$/ &&  $1 !~ /^hot-flue$/ &&  $1 !~ /^hotinus$/ &&  $1 !~ /^hot money$/ &&  $1 !~ /^hotte$/ &&  $1 !~ /^hottée$/ &&  $1 !~ /^hotu$/ &&  $1 !~ /^hou !$/ &&  $1 !~ /^houache$/ &&  $1 !~ /^houage$/ &&  $1 !~ /^houaiche$/ &&  $1 !~ /^houblon$/ &&  $1 !~ /^houe$/ &&  $1 !~ /^houer$/ &&  $1 !~ /^houille$/ &&  $1 !~ /^houiller$/ &&  $1 !~ /^houillère$/ &&  $1 !~ /^houle$/ &&  $1 !~ /^houlette$/ &&  $1 !~ /^houleuse$/ &&  $1 !~ /^houleux$/ &&  $1 !~ /^houligan$/ &&  $1 !~ /^houliganisme$/ &&  $1 !~ /^houlque$/ &&  $1 !~ /^houp !$/ &&  $1 !~ /^houppe$/ &&  $1 !~ /^houppelande$/ &&  $1 !~ /^houppette$/ &&  $1 !~ /^houppier$/ &&  $1 !~ /^hourd$/ &&  $1 !~ /^hourdage$/ &&  $1 !~ /^hourder$/ &&  $1 !~ /^hourdir$/ &&  $1 !~ /^hourdis$/ &&  $1 !~ /^houri$/ &&  $1 !~ /^hourque$/ &&  $1 !~ /^hourra !$/ &&  $1 !~ /^hourri$/ &&  $1 !~ /^hourrite$/ &&  $1 !~ /^hourvari$/ &&  $1 !~ /^housche$/ &&  $1 !~ /^houseau$/ &&  $1 !~ /^house-boat$/ &&  $1 !~ /^houspiller$/ &&  $1 !~ /^houssage$/ &&  $1 !~ /^housse$/ &&  $1 !~ /^housser$/ &&  $1 !~ /^housset$/ &&  $1 !~ /^houssière$/ &&  $1 !~ /^houst !$/ &&  $1 !~ /^houx$/ &&  $1 !~ /^hovéa$/ &&  $1 !~ /^hoyau$/ &&  $1 !~ /^hoyé$/ &&  $1 !~ /^hoyée$/ &&  $1 !~ /^huard$/ &&  $1 !~ /^huart$/ &&  $1 !~ /^hublot$/ &&  $1 !~ /^huche$/ &&  $1 !~ /^hucher$/ &&  $1 !~ /^huchier$/ &&  $1 !~ /^hue !$/ &&  $1 !~ /^huée$/ &&  $1 !~ /^huer$/ &&  $1 !~ /^huerta$/ &&  $1 !~ /^huguenot$/ &&  $1 !~ /^huipil$/ &&  $1 !~ /^huir$/ &&  $1 !~ /^huis clos$/ &&  $1 !~ /^huit$/ &&  $1 !~ /^huitain$/ &&  $1 !~ /^huitaine$/ &&  $1 !~ /^huitante$/ &&  $1 !~ /^huit-en-huit$/ &&  $1 !~ /^huitième$/ &&  $1 !~ /^huitièmement$/ &&  $1 !~ /^huit-reflets$/ &&  $1 !~ /^hulotte$/ &&  $1 !~ /^hululation$/ &&  $1 !~ /^hululement$/ &&  $1 !~ /^hululer$/ &&  $1 !~ /^humer$/ &&  $1 !~ /^hum ! $/ &&  $1 !~ /^humantin$/ &&  $1 !~ /^hune$/ &&  $1 !~ /^hunier$/ &&  $1 !~ /^hunter$/ &&  $1 !~ /^huppe$/ &&  $1 !~ /^huppé$/ &&  $1 !~ /^huppée$/ &&  $1 !~ /^huque$/ &&  $1 !~ /^hurdler$/ &&  $1 !~ /^hure$/ &&  $1 !~ /^hurlant$/ &&  $1 !~ /^hurlement$/ &&  $1 !~ /^hurler$/ &&  $1 !~ /^hurleur$/ &&  $1 !~ /^hurleuse$/ &&  $1 !~ /^huron$/ &&  $1 !~ /^Huron$/ &&  $1 !~ /^huronne$/ &&  $1 !~ /^hurrah !$/ &&  $1 !~ /^hurricane$/ &&  $1 !~ /^husky$/ &&  $1 !~ /^hussard$/ &&  $1 !~ /^hussarde$/ &&  $1 !~ /^hutinet$/ &&  $1 !~ /^hutte$/ &&  $1 !~ /^hutteau$/ &&  $1 !~ /^hack$/ &&  $1 !~ /^hacker$/ &&  $1 !~ /^haïk$/ &&  $1 !~ /^hadj$/ &&  $1 !~ /^havanaise$/ &&  $1 !~ /^havanais$/ &&  $1 !~ /^high/ &&  $1 !~ /^haï/ && $1 !~ /^haka$/ && $1 !~ /^hakka$/ &&  $1 !~ /^handball$/ &&  $1 !~ /^house/ &&  $1 !~ /^hadith$/)

		{
		    print "\"L" $2 "\": \"l'" $1 "\",";
		    print "\"KL" $2 "\": \"que l'" $1 "\",";
		    print "\"ST" $2 "\": \"cet " $1 "\",";
		    print "\"ST/" $2 "/EU\": \"cette " $1 "\",";
		}
		else
		{
		print "\"S/" $2 "\": \"ce " $1 "\",";
		}
	    }

	    if ($1 ~ /^[aeiouéàâêïîô]/){
		print "\"L" $2 "\": \"l'" $1 "\",";
		print "\"KL" $2 "\": \"que l'" $1 "\",";
		print "\"ST/" $2 "\": \"cet " $1 "\",";
		print "\"ST/" $2 "/EU\": \"cette " $1 "\",";
		# print "\"NO/TR" $2 "\": \"notre " $1 "\",";
		# print "\"F*O/TR" $2 "\": \"votre " $1 "\",";
	    }
	}
## ** 3e moulinage
## *** Pluriel

#     arr["sa"] = gensub(/(S)A\/([PMTFNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["se"] = gensub(/(S)E\/([PMTFNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["si"] = gensub(/(S)I\/([PMTFNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["so"] = gensub(/(S)O\/([PMTFNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["su"] = gensub(/(S)U\/([PMTFNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["ka"] = gensub(/(K)A\/([PMTFNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["ke"] = gensub(/(K)E\/([PMTFNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["ki"] = gensub(/(K)I\/([PMTFNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["ko"] = gensub(/(K)O\/([PMTFNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["ku"] = gensub(/(K)U\/([PMTFNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["pa"] = gensub(/(P)A\/([MTFNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["pe"] = gensub(/(P)E\/([MTFNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["pi"] = gensub(/(P)I\/([MTFNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["po"] = gensub(/(P)O\/([MTFNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["pu"] = gensub(/(P)U\/([MTFNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["ma"] = gensub(/(M)A\/([TFNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["me"] = gensub(/(M)E\/([TFNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["mi"] = gensub(/(M)I\/([TFNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["mo"] = gensub(/(M)O\/([TFNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["mu"] = gensub(/(M)U\/([TFNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["ta"] = gensub(/(T)A\/([FNLR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["te"] = gensub(/(T)E\/([FNLR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["ti"] = gensub(/(T)I\/([FNLR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["to"] = gensub(/(T)O\/([FNLR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["tu"] = gensub(/(T)U\/([FNLR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["ra"] = gensub(/(R)A\/([NL])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["re"] = gensub(/(R)E\/([NL])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["ri"] = gensub(/(R)I\/([NL])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["ro"] = gensub(/(R)O\/([NL])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["ru"] = gensub(/(R)U\/([NL])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["na"] = gensub(/(N)A\/(L)A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["ne"] = gensub(/(N)E\/(L)E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["ni"] = gensub(/(N)I\/(L)I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["no"] = gensub(/(N)O\/(L)O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["nu"] = gensub(/(N)U\/(L)U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["fa"] = gensub(/(F)A\/(N)A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["fe"] = gensub(/(F)E\/(N)E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["fi"] = gensub(/(F)I\/(N)I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["fo"] = gensub(/(F)O\/(N)O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["fu"] = gensub(/(F)U\/(N)U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["va"] = gensub(/(F\*)A\/([LR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["ve"] = gensub(/(F\*)E\/([LR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["vi"] = gensub(/(F\*)I\/([LR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["vo"] = gensub(/(F\*)O\/([LR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["vu"] = gensub(/(F\*)U\/([LR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["vae"] = gensub(/(F)\*A\/(N)A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["vee"] = gensub(/(F)\*E\/(N)E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["vie"] = gensub(/(F)\*I\/(N)I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["voe"] = gensub(/(F)\*O\/(N)O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["vue"] = gensub(/(F)\*U\/(N)U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["ba"]  = gensub(/(P\*)A\/([LR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["be"]  = gensub(/(P\*)E\/([LR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["bi"]  = gensub(/(P\*)I\/([LR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["bo"]  = gensub(/(P\*)O\/([LR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["bu"]  = gensub(/(P\*)U\/([LR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["bae"]  = gensub(/(P)\*A\/([FN])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["bee"]  = gensub(/(P)\*E\/([FN])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["bie"]  = gensub(/(P)\*I\/([FN])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["boe"]  = gensub(/(P)\*O\/([FN])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["bue"]  = gensub(/(P)\*U\/([FN])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["da"]  = gensub(/(T\*)A\/([LR])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["de"]  = gensub(/(T\*)E\/([LR])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["di"]  = gensub(/(T\*)I\/([LR])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["doo"] = gensub(/(T\*)O\/([LR])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["du"]  = gensub(/(T\*)U\/([LR])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

#     arr["dae"]  = gensub(/(T)\*A\/([FN])A([^/"]*)([/"])/, "\\1\\2A\\3\\4", "g",$2);
#     arr["dee"]  = gensub(/(T)\*E\/([FN])E([^/"]*)([/"])/, "\\1\\2E\\3\\4", "g",$2);
#     arr["die"]  = gensub(/(T)\*I\/([FN])I([^/"]*)([/"])/, "\\1\\2I\\3\\4", "g",$2);
#     arr["dooe"] = gensub(/(T)\*O\/([FN])O([^/"]*)([/"])/, "\\1\\2O\\3\\4", "g",$2);
#     arr["due"]  = gensub(/(T)\*U\/([FN])U([^/"]*)([/"])/, "\\1\\2U\\3\\4", "g",$2);

# 	if ($5 ~ /p/){
# 	    print "\"" arr[i] "/$\": \"" $1 "\",";
# 	    # print "\"LE/" arr[i] "\": \"les " $1 "\",";
# 	    # print "\"T*E/" arr[i] "\": \"des " $1 "\",";
# 	    print "\"SE/" arr[i] "\": \"ces " $1 "\",";
# 	    print "\"SE/" arr[i] "/*\": \"ses " $1 "\",";
# 	    print "\"ME/" arr[i] "\": \"mes " $1 "\",";
# 	    # print "\"TE/" arr[i] "\": \"tes " $1 "\",";
# 	    # print "\"NO/" arr[i] "\": \"nos " $1 "\",";
# 	    # print "\"F*O/" arr[i] "\": \"vos " $1 "\",";
# 	    print "\"LEUl/" arr[i] "/$\": \"leurs " $1 "\",";

# 	    # print "\"KElC/" arr[i] "\": \"quelques " $1 "\",";
# 	    # print "\"KLE/" arr[i] "\": \"que les " $1 "\",";
# 	    # print "\"KT*E/" arr[i] "\": \"que des " $1 "\",";
# 	    # print "\"KME/" arr[i] "\": \"que mes " $1 "\",";
# 	    # print "\"KTE/" arr[i] "\": \"que tes " $1 "\",";
# 	    # print "\"KNO/" arr[i] "\": \"que nos " $1 "\",";
# 	    # print "\"KF*O/" arr[i] "\": \"que vos " $1 "\",";
# 	    print "\"KLEUl/" arr[i] "/$\": \"que leurs " $1 "\",";

# 	    if ($4 ~ /m/){
# 		print "\"KEl/" arr[i] "/$\": \"quels " $1 "\",";
# 		print "\"TEl/" arr[i] "/$\": \"tels " $1 "\",";
# 		print "\"NUl/" arr[i] "/$\": \"nuls " $1 "\",";
# 		print "\"TOU/" arr[i] "/$\": \"tous " $1 "\",";
# 		print "\"KTOU/" arr[i] "/$\": \"que tous " $1 "\",";
# 	    }

# 	    if ($4 ~ /f/){
# 		print "\"KEl/" arr[i] "/$\": \"quelles " $1 "\",";
# 		print "\"TEl/" arr[i] "/$\": \"telles " $1 "\",";
# 		print "\"NUl/" arr[i] "/$\": \"nulles " $1 "\",";
# 		print "\"TOUD/" arr[i] "/$\": \"toutes " $1 "\",";
# 		print "\"KTOUD/" arr[i] "/$\": \"que toutes " $1 "\",";

# 	    }
# 	}
# ## *** Masculin singulier
# 	if ($4 ~ /m/ && $5 ~ /s/){
# 	    print "\"" arr[i] "\": \"" $1 "\",";
# 	    # print "\"Un/" arr[i] "\": \"un " $1 "\",";
# 	    # print "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 	    # print "\"MOn/" arr[i] "\": \"mon " $1 "\",";
# 	    # print "\"TOn/" arr[i] "\": \"ton " $1 "\",";
# 	    # print "\"NO/TR/" arr[i] "\": \"notre " $1 "\",";
# 	    # print "\"F*O/TR/" arr[i] "\": \"votre " $1 "\",";
# 	    # print "\"LEUl/" arr[i] "\": \"leur " $1 "\",";
# 	    # print "\"KEl/" arr[i] "\": \"quel " $1 "\",";
# 	    # print "\"TEl/" arr[i] "\": \"tel " $1 "\",";
# 	    # print "\"NUl/" arr[i] "\": \"nul " $1 "\",";
# 	    # print "\"TOU/" arr[i] "\": \"tout " $1 "\",";
# 								# que
# 	    # print "\"KTOU/" arr[i] "\": \"que tout " $1 "\",";
# 	    # print "\"KUn/" arr[i] "\": \"qu'un " $1 "\",";
# 	    # print "\"KMOn/" arr[i] "\": \"que mon " $1 "\",";
# 	    # print "\"KTOn/" arr[i] "\": \"que ton " $1 "\",";
# 	    # print "\"KNO/TR/" arr[i] "\": \"que notre " $1 "\",";
# 	    # print "\"KF*O/TR/" arr[i] "\": \"que votre " $1 "\",";
# 	    # print "\"KLEUl/" arr[i] "\": \"que leur " $1 "\",";

# 	    if ($1  ~ /^[^aeiouéàâêïîôh]/){
# 		# print "\"L/" arr[i] "\": \"le " $1 "\",";
# 		# print "\"KL/" arr[i] "\": \"que le " $1 "\",";
# 		print "\"S/" arr[i] "\": \"ce " $1 "\",";
# 		if (arr[i] ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,arr[i]);  print "\"" ssone "\": \"ce " $1 "\",";}
# 	    }

# 	    if ($1 ~ /^h/){
# 		if ( $1 !~ /^hâblerie$/  &&  $1 !~ /^hâbleur$/ &&  $1 !~ /^hâbleuse$/ &&  $1 !~ /^hachage$/ &&  $1 !~ /^hache$/ &&  $1 !~ /^haché$/ &&  $1 !~ /^hachée$/ &&  $1 !~ /^hache-légumes$/ &&  $1 !~ /^hachement$/ &&  $1 !~ /^hache-paille$/ &&  $1 !~ /^hacher$/ &&  $1 !~ /^hachette$/ &&  $1 !~ /^hacheur$/ &&  $1 !~ /^hache-viande$/ &&  $1 !~ /^hachis$/ &&  $1 !~ /^hachisch$/ &&  $1 !~ /^hachoir$/ &&  $1 !~ /^hachure$/ &&  $1 !~ /^hachurer$/ &&  $1 !~ /^hackle$/ &&  $1 !~ /^hadal$/ &&  $1 !~ /^hadale$/ &&  $1 !~ /^hadaux$/ &&  $1 !~ /^haddock$/ &&  $1 !~ /^haflinger$/ &&  $1 !~ /^hafnium$/ &&  $1 !~ /^hagard$/ &&  $1 !~ /^haggis$/ &&  $1 !~ /^haie$/ &&  $1 !~ /^haillon$/ &&  $1 !~ /^haillonneuse$/ &&  $1 !~ /^haillonneux$/ &&  $1 !~ /^haine$/ &&  $1 !~ /^haineuse$/ &&  $1 !~ /^haineusement$/ &&  $1 !~ /^haineux$/ &&  $1 !~ /^haïr$/ &&  $1 !~ /^haire$/ &&  $1 !~ /^haïssable$/ &&  $1 !~ /^Haïtien$/ &&  $1 !~ /^Haïtienne$/ &&  $1 !~ /^halage$/ &&  $1 !~ /^hâlage$/ &&  $1 !~ /^halal$/ &&  $1 !~ /^halbi$/ &&  $1 !~ /^halbran$/ &&  $1 !~ /^halbrené$/ &&  $1 !~ /^halbrenée$/ &&  $1 !~ /^halde$/ &&  $1 !~ /^hâle$/ &&  $1 !~ /^hâlé$/ &&  $1 !~ /^hale-bas$/ &&  $1 !~ /^hale-breu$/ &&  $1 !~ /^hale-croc$/ &&  $1 !~ /^hâlée$/ &&  $1 !~ /^halefis$/ &&  $1 !~ /^hâle-haut$/ &&  $1 !~ /^haler$/ &&  $1 !~ /^hâler$/ &&  $1 !~ /^haletant$/ &&  $1 !~ /^halètement$/ &&  $1 !~ /^haleter$/ &&  $1 !~ /^haleur$/ &&  $1 !~ /^haleuse$/ &&  $1 !~ /^half-track$/ &&  $1 !~ /^hall$/ &&  $1 !~ /^halle$/ &&  $1 !~ /^hallebarde$/ &&  $1 !~ /^hallux$/ &&  $1 !~ /^halo$/ &&  $1 !~ /^halte$/ &&  $1 !~ /^halte-garderie$/ &&  $1 !~ /^hamac$/ &&  $1 !~ /^hamada$/ &&  $1 !~ /^hamburger$/ &&  $1 !~ /^hameau$/ &&  $1 !~ /^hamman$/ &&  $1 !~ /^hampe$/ &&  $1 !~ /^hamster$/ &&  $1 !~ /^hanche$/ &&  $1 !~ /^hanchement$/ &&  $1 !~ /^hancher$/ &&  $1 !~ /^hand-ball$/ &&  $1 !~ /^handballeur$/ &&  $1 !~ /^handballeuse$/ &&  $1 !~ /^handicap$/ &&  $1 !~ /^handicapant$/ &&  $1 !~ /^handicapante$/ &&  $1 !~ /^handicapé$/ &&  $1 !~ /^handicapée$/ &&  $1 !~ /^handicaper$/ &&  $1 !~ /^handicapeur$/ &&  $1 !~ /^handisport$/ &&  $1 !~ /^hangar$/ &&  $1 !~ /^hanneton$/ &&  $1 !~ /^hanon$/ &&  $1 !~ /^hanse$/ &&  $1 !~ /^hanter$/ &&  $1 !~ /^hantise$/ &&  $1 !~ /^happement$/ &&  $1 !~ /^happening$/ &&  $1 !~ /^happer$/ &&  $1 !~ /^happy end$/ &&  $1 !~ /^haque$/ &&  $1 !~ /^haquenée$/ &&  $1 !~ /^haquet$/ &&  $1 !~ /^hara-kiri$/ &&  $1 !~ /^harangue$/ &&  $1 !~ /^haranguer$/ &&  $1 !~ /^harangueur$/ &&  $1 !~ /^harangueuse$/ &&  $1 !~ /^haras$/ &&  $1 !~ /^harassant$/ &&  $1 !~ /^harassante$/ &&  $1 !~ /^harassé$/ &&  $1 !~ /^harassée$/ &&  $1 !~ /^harassement$/ &&  $1 !~ /^harasser$/ &&  $1 !~ /^harcelant$/ &&  $1 !~ /^harcelante$/ &&  $1 !~ /^harcèlement$/ &&  $1 !~ /^harceler$/ &&  $1 !~ /^hard$/ &&  $1 !~ /^hard-bop$/ &&  $1 !~ /^hard-core$/ &&  $1 !~ /^harde$/ &&  $1 !~ /^hardé$/ &&  $1 !~ /^hard-edge$/ &&  $1 !~ /^harder$/ &&  $1 !~ /^hardes$/ &&  $1 !~ /^hard ground$/ &&  $1 !~ /^hardi$/ &&  $1 !~ /^hardie$/ &&  $1 !~ /^hardiesse$/ &&  $1 !~ /^hardiment$/ &&  $1 !~ /^hard-rock$/ &&  $1 !~ /^hard-top$/ &&  $1 !~ /^hardware$/ &&  $1 !~ /^harem$/ &&  $1 !~ /^hareng$/ &&  $1 !~ /^harengade$/ &&  $1 !~ /^harengaison$/ &&  $1 !~ /^harengère$/ &&  $1 !~ /^harenguet$/ &&  $1 !~ /^harengueux$/ &&  $1 !~ /^harenguier$/ &&  $1 !~ /^harenguière$/ &&  $1 !~ /^haret$/ &&  $1 !~ /^harfang$/ &&  $1 !~ /^hargne$/ &&  $1 !~ /^hargneuse$/ &&  $1 !~ /^hargneusement$/ &&  $1 !~ /^hargneux$/ &&  $1 !~ /^haricot$/ &&  $1 !~ /^haridelle$/ &&  $1 !~ /^harissa$/ &&  $1 !~ /^harka$/ &&  $1 !~ /^harki$/ &&  $1 !~ /^harnachement$/ &&  $1 !~ /^harnacher$/ &&  $1 !~ /^harnais$/ &&  $1 !~ /^harnat$/ &&  $1 !~ /^harnois$/ &&  $1 !~ /^haro$/ &&  $1 !~ /^harouelle$/ &&  $1 !~ /^harpail$/ &&  $1 !~ /^harpaye$/ &&  $1 !~ /^harpe$/ &&  $1 !~ /^harpe-cithare$/ &&  $1 !~ /^harpe-luth$/ &&  $1 !~ /^harpette$/ &&  $1 !~ /^harpie$/ &&  $1 !~ /^harpiste$/ &&  $1 !~ /^harpocéras$/ &&  $1 !~ /^harpodon$/ &&  $1 !~ /^harpoise$/ &&  $1 !~ /^harpon$/ &&  $1 !~ /^harponnage$/ &&  $1 !~ /^harponnement$/ &&  $1 !~ /^harponner$/ &&  $1 !~ /^harponneur$/ &&  $1 !~ /^harpye$/ &&  $1 !~ /^harrier$/ &&  $1 !~ /^hart$/ &&  $1 !~ /^hasard$/ &&  $1 !~ /^hasarder$/ &&  $1 !~ /^hasardeuse$/ &&  $1 !~ /^hasardeusement$/ &&  $1 !~ /^hasardeux$/ &&  $1 !~ /^has been$/ &&  $1 !~ /^hasch$/ &&  $1 !~ /^haschich$/ &&  $1 !~ /^haschisch$/ &&  $1 !~ /^hase$/ &&  $1 !~ /^hâte$/ &&  $1 !~ /^hâter$/ &&  $1 !~ /^hatha-yoga$/ &&  $1 !~ /^hâtier$/ &&  $1 !~ /^hâtif$/ &&  $1 !~ /^hâtive$/ &&  $1 !~ /^hattéria$/ &&  $1 !~ /^hauban$/ &&  $1 !~ /^haubanage$/ &&  $1 !~ /^haubaner$/ &&  $1 !~ /^haubert$/ &&  $1 !~ /^hausse$/ &&  $1 !~ /^hausse-col$/ &&  $1 !~ /^haussement$/ &&  $1 !~ /^hausser$/ &&  $1 !~ /^hausse-repère$/ &&  $1 !~ /^haussier$/ &&  $1 !~ /^haussière$/ &&  $1 !~ /^haut$/ &&  $1 !~ /^hautain$/ &&  $1 !~ /^hautaine$/ &&  $1 !~ /^haut-bar$/ &&  $1 !~ /^hautbois$/ &&  $1 !~ /^hautboïste$/ &&  $1 !~ /^haut-commissaire$/ &&  $1 !~ /^haut-commissariat$/ &&  $1 !~ /^haut-de-chausse(s)$/ &&  $1 !~ /^haut-de-côtelettes$/ &&  $1 !~ /^haut-de-côtes$/ &&  $1 !~ /^haut-de-forme$/ &&  $1 !~ /^haute$/ &&  $1 !~ /^haute-contre$/ &&  $1 !~ /^hautement$/ &&  $1 !~ /^haute-tige$/ &&  $1 !~ /^hauteur$/ &&  $1 !~ /^haut-fond$/ &&  $1 !~ /^haut-fourneau$/ &&  $1 !~ /^hautin$/ &&  $1 !~ /^haut-jointé$/ &&  $1 !~ /^haut-jointée$/ &&  $1 !~ /^haut-le-cœur$/ &&  $1 !~ /^haut-le-corps$/ &&  $1 !~ /^haut-le-pied$/ &&  $1 !~ /^haut-parc$/ &&  $1 !~ /^haut-parleur$/ &&  $1 !~ /^haut-relief$/ &&  $1 !~ /^hauturier$/ &&  $1 !~ /^hauturière$/ &&  $1 !~ /^havage$/ &&  $1 !~ /^havane$/ &&  $1 !~ /^hâve$/ &&  $1 !~ /^havée$/ &&  $1 !~ /^haveneau$/ &&  $1 !~ /^havenet$/ &&  $1 !~ /^haver$/ &&  $1 !~ /^haveur$/ &&  $1 !~ /^haveuse$/ &&  $1 !~ /^havre$/ &&  $1 !~ /^havresac$/ &&  $1 !~ /^havrit$/ &&  $1 !~ /^haylage$/ &&  $1 !~ /^hayon$/ &&  $1 !~ /^hé !$/ &&  $1 !~ /^heat-set$/ &&  $1 !~ /^heaume$/ &&  $1 !~ /^hein !$/ &&  $1 !~ /^héler$/ &&  $1 !~ /^hem !$/ &&  $1 !~ /^henné$/ &&  $1 !~ /^hennin$/ &&  $1 !~ /^hennir$/ &&  $1 !~ /^hennissant$/ &&  $1 !~ /^hennissante$/ &&  $1 !~ /^hennissement$/ &&  $1 !~ /^hennuyer$/ &&  $1 !~ /^hep !$/ &&  $1 !~ /^héraut$/ &&  $1 !~ /^hère$/ &&  $1 !~ /^hérissé$/ &&  $1 !~ /^hérissée$/ &&  $1 !~ /^hérissement$/ &&  $1 !~ /^hérisser$/ &&  $1 !~ /^hérisson$/ &&  $1 !~ /^hérissonne$/ &&  $1 !~ /^herniaire$/ &&  $1 !~ /^hernie$/ &&  $1 !~ /^hernié$/ &&  $1 !~ /^herniée$/ &&  $1 !~ /^hernieuse$/ &&  $1 !~ /^hernieux$/ &&  $1 !~ /^héroïne$/ &&  $1 !~ /^héron$/ &&  $1 !~ /^héronneau$/ &&  $1 !~ /^héronnier$/ &&  $1 !~ /^héronnière$/ &&  $1 !~ /^héros$/ &&  $1 !~ /^hersage$/ &&  $1 !~ /^herse$/ &&  $1 !~ /^herser$/ &&  $1 !~ /^hersillon$/ &&  $1 !~ /^hêtraie$/ &&  $1 !~ /^hêtre$/ &&  $1 !~ /^heu !$/ &&  $1 !~ /^heurt$/ &&  $1 !~ /^heurter$/ &&  $1 !~ /^heurtoir$/ &&  $1 !~ /^hibou$/ &&  $1 !~ /^hic$/ &&  $1 !~ /^hickory$/ &&  $1 !~ /^hideur$/ &&  $1 !~ /^hideuse$/ &&  $1 !~ /^hideusement$/ &&  $1 !~ /^hideux$/ &&  $1 !~ /^hidjab$/ &&  $1 !~ /^hiement$/ &&  $1 !~ /^hiérarchie$/ &&  $1 !~ /^hiérarchique$/ &&  $1 !~ /^hiérarchiquement$/ &&  $1 !~ /^hiérarchisation$/ &&  $1 !~ /^hiérarchiser$/ &&  $1 !~ /^hiérarque$/ &&  $1 !~ /^hi-fi$/ &&  $1 !~ /^high bulk$/ &&  $1 !~ /^high-tech$/ &&  $1 !~ /^hilaire$/ &&  $1 !~ /^hile$/ &&  $1 !~ /^hindi$/ &&  $1 !~ /^hip !$/ &&  $1 !~ /^hip-hop$/ &&  $1 !~ /^hippie$/ &&  $1 !~ /^hippy$/ &&  $1 !~ /^hissage$/ &&  $1 !~ /^hit$/ &&  $1 !~ /^hit-parade$/ &&  $1 !~ /^ho !$/ &&  $1 !~ /^hobby$/ &&  $1 !~ /^hobbyste$/ &&  $1 !~ /^hobereau$/ &&  $1 !~ /^hochement$/ &&  $1 !~ /^hochepot$/ &&  $1 !~ /^hochequeue$/ &&  $1 !~ /^hocher$/ &&  $1 !~ /^hochet$/ &&  $1 !~ /^hockey$/ &&  $1 !~ /^hockeyeur$/ &&  $1 !~ /^hockeyeuse$/ &&  $1 !~ /^ho! hisse!$/ &&  $1 !~ /^holà !$/ &&  $1 !~ /^holding$/ &&  $1 !~ /^hold-up$/ &&  $1 !~ /^Hollande$/ &&  $1 !~ /^hollandite$/ &&  $1 !~ /^hollywoodien$/ &&  $1 !~ /^hollywoodienne$/ &&  $1 !~ /^homard$/ &&  $1 !~ /^homarderie$/ &&  $1 !~ /^homardier$/ &&  $1 !~ /^home$/ &&  $1 !~ /^home-trainer$/ &&  $1 !~ /^hongre$/ &&  $1 !~ /^hongrer$/ &&  $1 !~ /^hongreur$/ &&  $1 !~ /^hongreuse$/ &&  $1 !~ /^Hongrie$/ &&  $1 !~ /^hongroierie$/ &&  $1 !~ /^hongroyage$/ &&  $1 !~ /^hongroyer$/ &&  $1 !~ /^hongroyeur$/ &&  $1 !~ /^honning$/ &&  $1 !~ /^honnir$/ &&  $1 !~ /^honoris causa$/ &&  $1 !~ /^honte$/ &&  $1 !~ /^honteuse$/ &&  $1 !~ /^honteusement$/ &&  $1 !~ /^honteux$/ &&  $1 !~ /^hooligan$/ &&  $1 !~ /^hooliganisme$/ &&  $1 !~ /^hop !$/ &&  $1 !~ /^hop-je$/ &&  $1 !~ /^hoquet$/ &&  $1 !~ /^hoqueter$/ &&  $1 !~ /^hoqueton$/ &&  $1 !~ /^horde$/ &&  $1 !~ /^horion$/ &&  $1 !~ /^hormis$/ &&  $1 !~ /^hornblende$/ &&  $1 !~ /^hors$/ &&  $1 !~ /^horsain$/ &&  $1 !~ /^hors-bord$/ &&  $1 !~ /^hors-cote$/ &&  $1 !~ /^hors de$/ &&  $1 !~ /^hors-de-cour$/ &&  $1 !~ /^hors-d'œuvre$/ &&  $1 !~ /^horse-guard$/ &&  $1 !~ /^horse power$/ &&  $1 !~ /^horsin$/ &&  $1 !~ /^hors-jeu$/ &&  $1 !~ /^hors-la-loi$/ &&  $1 !~ /^hors-ligne$/ &&  $1 !~ /^hors-marché$/ &&  $1 !~ /^hors-piste$/ &&  $1 !~ /^hors-pistes$/ &&  $1 !~ /^hors-statut$/ &&  $1 !~ /^horst$/ &&  $1 !~ /^hors-texte$/ &&  $1 !~ /^hot$/ &&  $1 !~ /^hot dog$/ &&  $1 !~ /^hot-flue$/ &&  $1 !~ /^hotinus$/ &&  $1 !~ /^hot money$/ &&  $1 !~ /^hotte$/ &&  $1 !~ /^hottée$/ &&  $1 !~ /^hotu$/ &&  $1 !~ /^hou !$/ &&  $1 !~ /^houache$/ &&  $1 !~ /^houage$/ &&  $1 !~ /^houaiche$/ &&  $1 !~ /^houblon$/ &&  $1 !~ /^houe$/ &&  $1 !~ /^houer$/ &&  $1 !~ /^houille$/ &&  $1 !~ /^houiller$/ &&  $1 !~ /^houillère$/ &&  $1 !~ /^houle$/ &&  $1 !~ /^houlette$/ &&  $1 !~ /^houleuse$/ &&  $1 !~ /^houleux$/ &&  $1 !~ /^houligan$/ &&  $1 !~ /^houliganisme$/ &&  $1 !~ /^houlque$/ &&  $1 !~ /^houp !$/ &&  $1 !~ /^houppe$/ &&  $1 !~ /^houppelande$/ &&  $1 !~ /^houppette$/ &&  $1 !~ /^houppier$/ &&  $1 !~ /^hourd$/ &&  $1 !~ /^hourdage$/ &&  $1 !~ /^hourder$/ &&  $1 !~ /^hourdir$/ &&  $1 !~ /^hourdis$/ &&  $1 !~ /^houri$/ &&  $1 !~ /^hourque$/ &&  $1 !~ /^hourra !$/ &&  $1 !~ /^hourri$/ &&  $1 !~ /^hourrite$/ &&  $1 !~ /^hourvari$/ &&  $1 !~ /^housche$/ &&  $1 !~ /^houseau$/ &&  $1 !~ /^house-boat$/ &&  $1 !~ /^houspiller$/ &&  $1 !~ /^houssage$/ &&  $1 !~ /^housse$/ &&  $1 !~ /^housser$/ &&  $1 !~ /^housset$/ &&  $1 !~ /^houssière$/ &&  $1 !~ /^houst !$/ &&  $1 !~ /^houx$/ &&  $1 !~ /^hovéa$/ &&  $1 !~ /^hoyau$/ &&  $1 !~ /^hoyé$/ &&  $1 !~ /^hoyée$/ &&  $1 !~ /^huard$/ &&  $1 !~ /^huart$/ &&  $1 !~ /^hublot$/ &&  $1 !~ /^huche$/ &&  $1 !~ /^hucher$/ &&  $1 !~ /^huchier$/ &&  $1 !~ /^hue !$/ &&  $1 !~ /^huée$/ &&  $1 !~ /^huer$/ &&  $1 !~ /^huerta$/ &&  $1 !~ /^huguenot$/ &&  $1 !~ /^huipil$/ &&  $1 !~ /^huir$/ &&  $1 !~ /^huis clos$/ &&  $1 !~ /^huit$/ &&  $1 !~ /^huitain$/ &&  $1 !~ /^huitaine$/ &&  $1 !~ /^huitante$/ &&  $1 !~ /^huit-en-huit$/ &&  $1 !~ /^huitième$/ &&  $1 !~ /^huitièmement$/ &&  $1 !~ /^huit-reflets$/ &&  $1 !~ /^hulotte$/ &&  $1 !~ /^hululation$/ &&  $1 !~ /^hululement$/ &&  $1 !~ /^hululer$/ &&  $1 !~ /^humer$/ &&  $1 !~ /^hum ! $/ &&  $1 !~ /^humantin$/ &&  $1 !~ /^hune$/ &&  $1 !~ /^hunier$/ &&  $1 !~ /^hunter$/ &&  $1 !~ /^huppe$/ &&  $1 !~ /^huppé$/ &&  $1 !~ /^huppée$/ &&  $1 !~ /^huque$/ &&  $1 !~ /^hurdler$/ &&  $1 !~ /^hure$/ &&  $1 !~ /^hurlant$/ &&  $1 !~ /^hurlement$/ &&  $1 !~ /^hurler$/ &&  $1 !~ /^hurleur$/ &&  $1 !~ /^hurleuse$/ &&  $1 !~ /^huron$/ &&  $1 !~ /^Huron$/ &&  $1 !~ /^huronne$/ &&  $1 !~ /^hurrah !$/ &&  $1 !~ /^hurricane$/ &&  $1 !~ /^husky$/ &&  $1 !~ /^hussard$/ &&  $1 !~ /^hussarde$/ &&  $1 !~ /^hutinet$/ &&  $1 !~ /^hutte$/ &&  $1 !~ /^hutteau$/ &&  $1 !~ /^hack$/ &&  $1 !~ /^hacker$/ &&  $1 !~ /^haïk$/ &&  $1 !~ /^hadj$/ &&  $1 !~ /^havanaise$/ &&  $1 !~ /^havanais$/ &&  $1 !~ /^high/ &&  $1 !~ /^haï/ && $1 !~ /^haka$/ && $1 !~ /^hakka$/ &&  $1 !~ /^handball$/ &&  $1 !~ /^house/ &&  $1 !~ /^hadith$/)

# 		{
# 		    print "\"L" arr[i] "\": \"l'" $1 "\",";
# 		    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 		    print "\"ST" arr[i] "\": \"cet " $1 "\",";
# 		    print "\"ST/" arr[i] "\": \"cet " $1 "\",";
# 		}
# 		else
# 		{
# 		print "\"S/" arr[i] "\": \"ce " $1 "\",";
# 		}
# 	    }

# 	    if ($1 ~ /^[aeiouéàâêïîô]/){
# 		print "\"L" arr[i] "\": \"l'" $1 "\",";
# 		print "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 		print "\"ST" arr[i] "\": \"cet " $1 "\",";
# 		print "\"ST/" arr[i] "\": \"cet " $1 "\",";
# 		# print "\"NO/TR" arr[i] "\": \"notre " $1 "\",";
# 		# print "\"F*O/TR" arr[i] "\": \"votre " $1 "\",";
# 	    }

# 	}
## *** Féminin  singulier
# 	if ($4 ~ /f/ && $5 ~ /s/){
# 	    print "\"" arr[i] "\": \"" $1 "\",";
# 	    # print "\"UnC/" arr[i] "\": \"une " $1 "\",";
# 	    print "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 	    # print "\"NO/TR/" arr[i] "\": \"notre " $1 "\",";
# 	    # print "\"F*O/TR/" arr[i] "\": \"votre " $1 "\",";
# 	    # print "\"LEUl/" arr[i] "\": \"leur " $1 "\",";
# 	    print "\"KEl/" arr[i] "\": \"quelle " $1 "\",";
# 	    print "\"TEl/" arr[i] "\": \"telle " $1 "\",";
# 	    print "\"NUl/" arr[i] "\": \"nulle " $1 "\",";
# 	    # print "\"TOUD/" arr[i] "\": \"toute " $1 "\",";
# 	    # print "\"KTOUD/" arr[i] "\": \"que toute " $1 "\",";
# 	    # print "\"KUnC/" arr[i] "\": \"qu'une " $1 "\",";
# 	    # print "\"KNO/TR/" arr[i] "\": \"que notre " $1 "\",";
# 	    # print "\"KF*O/TR/" arr[i] "\": \"que votre " $1 "\",";
# 	    # print "\"KLEUl/" arr[i] "\": \"que leur " $1 "\",";

# 	    if ($1  ~ /^[^aeiouéàâêïîôh]/){
# 		# print "\"LA/" arr[i] "\": \"la " $1 "\",";
# 		print "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 		# print "\"MA/" arr[i] "\": \"ma " $1 "\",";
# 		# print "\"TA/" arr[i] "\": \"ta " $1 "\",";
# 		# print "\"SA/" arr[i] "\": \"sa " $1 "\",";
# 		# print "\"KLA/" arr[i] "\": \"que la " $1 "\",";
# 		# print "\"KMA/" arr[i] "\": \"que ma " $1 "\",";
# 		# print "\"KTA/" arr[i] "\": \"que ta " $1 "\",";
# 		if (arr[i] ~ /^[FRNL]/)					{ssone = gensub(/([KPMTFNLR])/, "ST\\1", 1,arr[i]); print "\"" ssone "\": \"cette " $1 "\",";}
# 	    }

# 	    if ($1 ~ /^h/){
# 		if ( $1 !~ /^hâblerie$/  &&  $1 !~ /^hâbleur$/ &&  $1 !~ /^hâbleuse$/ &&  $1 !~ /^hachage$/ &&  $1 !~ /^hache$/ &&  $1 !~ /^haché$/ &&  $1 !~ /^hachée$/ &&  $1 !~ /^hache-légumes$/ &&  $1 !~ /^hachement$/ &&  $1 !~ /^hache-paille$/ &&  $1 !~ /^hacher$/ &&  $1 !~ /^hachette$/ &&  $1 !~ /^hacheur$/ &&  $1 !~ /^hache-viande$/ &&  $1 !~ /^hachis$/ &&  $1 !~ /^hachisch$/ &&  $1 !~ /^hachoir$/ &&  $1 !~ /^hachure$/ &&  $1 !~ /^hachurer$/ &&  $1 !~ /^hackle$/ &&  $1 !~ /^hadal$/ &&  $1 !~ /^hadale$/ &&  $1 !~ /^hadaux$/ &&  $1 !~ /^haddock$/ &&  $1 !~ /^haflinger$/ &&  $1 !~ /^hafnium$/ &&  $1 !~ /^hagard$/ &&  $1 !~ /^haggis$/ &&  $1 !~ /^haie$/ &&  $1 !~ /^haillon$/ &&  $1 !~ /^haillonneuse$/ &&  $1 !~ /^haillonneux$/ &&  $1 !~ /^haine$/ &&  $1 !~ /^haineuse$/ &&  $1 !~ /^haineusement$/ &&  $1 !~ /^haineux$/ &&  $1 !~ /^haïr$/ &&  $1 !~ /^haire$/ &&  $1 !~ /^haïssable$/ &&  $1 !~ /^Haïtien$/ &&  $1 !~ /^Haïtienne$/ &&  $1 !~ /^halage$/ &&  $1 !~ /^hâlage$/ &&  $1 !~ /^halal$/ &&  $1 !~ /^halbi$/ &&  $1 !~ /^halbran$/ &&  $1 !~ /^halbrené$/ &&  $1 !~ /^halbrenée$/ &&  $1 !~ /^halde$/ &&  $1 !~ /^hâle$/ &&  $1 !~ /^hâlé$/ &&  $1 !~ /^hale-bas$/ &&  $1 !~ /^hale-breu$/ &&  $1 !~ /^hale-croc$/ &&  $1 !~ /^hâlée$/ &&  $1 !~ /^halefis$/ &&  $1 !~ /^hâle-haut$/ &&  $1 !~ /^haler$/ &&  $1 !~ /^hâler$/ &&  $1 !~ /^haletant$/ &&  $1 !~ /^halètement$/ &&  $1 !~ /^haleter$/ &&  $1 !~ /^haleur$/ &&  $1 !~ /^haleuse$/ &&  $1 !~ /^half-track$/ &&  $1 !~ /^hall$/ &&  $1 !~ /^halle$/ &&  $1 !~ /^hallebarde$/ &&  $1 !~ /^hallux$/ &&  $1 !~ /^halo$/ &&  $1 !~ /^halte$/ &&  $1 !~ /^halte-garderie$/ &&  $1 !~ /^hamac$/ &&  $1 !~ /^hamada$/ &&  $1 !~ /^hamburger$/ &&  $1 !~ /^hameau$/ &&  $1 !~ /^hamman$/ &&  $1 !~ /^hampe$/ &&  $1 !~ /^hamster$/ &&  $1 !~ /^hanche$/ &&  $1 !~ /^hanchement$/ &&  $1 !~ /^hancher$/ &&  $1 !~ /^hand-ball$/ &&  $1 !~ /^handballeur$/ &&  $1 !~ /^handballeuse$/ &&  $1 !~ /^handicap$/ &&  $1 !~ /^handicapant$/ &&  $1 !~ /^handicapante$/ &&  $1 !~ /^handicapé$/ &&  $1 !~ /^handicapée$/ &&  $1 !~ /^handicaper$/ &&  $1 !~ /^handicapeur$/ &&  $1 !~ /^handisport$/ &&  $1 !~ /^hangar$/ &&  $1 !~ /^hanneton$/ &&  $1 !~ /^hanon$/ &&  $1 !~ /^hanse$/ &&  $1 !~ /^hanter$/ &&  $1 !~ /^hantise$/ &&  $1 !~ /^happement$/ &&  $1 !~ /^happening$/ &&  $1 !~ /^happer$/ &&  $1 !~ /^happy end$/ &&  $1 !~ /^haque$/ &&  $1 !~ /^haquenée$/ &&  $1 !~ /^haquet$/ &&  $1 !~ /^hara-kiri$/ &&  $1 !~ /^harangue$/ &&  $1 !~ /^haranguer$/ &&  $1 !~ /^harangueur$/ &&  $1 !~ /^harangueuse$/ &&  $1 !~ /^haras$/ &&  $1 !~ /^harassant$/ &&  $1 !~ /^harassante$/ &&  $1 !~ /^harassé$/ &&  $1 !~ /^harassée$/ &&  $1 !~ /^harassement$/ &&  $1 !~ /^harasser$/ &&  $1 !~ /^harcelant$/ &&  $1 !~ /^harcelante$/ &&  $1 !~ /^harcèlement$/ &&  $1 !~ /^harceler$/ &&  $1 !~ /^hard$/ &&  $1 !~ /^hard-bop$/ &&  $1 !~ /^hard-core$/ &&  $1 !~ /^harde$/ &&  $1 !~ /^hardé$/ &&  $1 !~ /^hard-edge$/ &&  $1 !~ /^harder$/ &&  $1 !~ /^hardes$/ &&  $1 !~ /^hard ground$/ &&  $1 !~ /^hardi$/ &&  $1 !~ /^hardie$/ &&  $1 !~ /^hardiesse$/ &&  $1 !~ /^hardiment$/ &&  $1 !~ /^hard-rock$/ &&  $1 !~ /^hard-top$/ &&  $1 !~ /^hardware$/ &&  $1 !~ /^harem$/ &&  $1 !~ /^hareng$/ &&  $1 !~ /^harengade$/ &&  $1 !~ /^harengaison$/ &&  $1 !~ /^harengère$/ &&  $1 !~ /^harenguet$/ &&  $1 !~ /^harengueux$/ &&  $1 !~ /^harenguier$/ &&  $1 !~ /^harenguière$/ &&  $1 !~ /^haret$/ &&  $1 !~ /^harfang$/ &&  $1 !~ /^hargne$/ &&  $1 !~ /^hargneuse$/ &&  $1 !~ /^hargneusement$/ &&  $1 !~ /^hargneux$/ &&  $1 !~ /^haricot$/ &&  $1 !~ /^haridelle$/ &&  $1 !~ /^harissa$/ &&  $1 !~ /^harka$/ &&  $1 !~ /^harki$/ &&  $1 !~ /^harnachement$/ &&  $1 !~ /^harnacher$/ &&  $1 !~ /^harnais$/ &&  $1 !~ /^harnat$/ &&  $1 !~ /^harnois$/ &&  $1 !~ /^haro$/ &&  $1 !~ /^harouelle$/ &&  $1 !~ /^harpail$/ &&  $1 !~ /^harpaye$/ &&  $1 !~ /^harpe$/ &&  $1 !~ /^harpe-cithare$/ &&  $1 !~ /^harpe-luth$/ &&  $1 !~ /^harpette$/ &&  $1 !~ /^harpie$/ &&  $1 !~ /^harpiste$/ &&  $1 !~ /^harpocéras$/ &&  $1 !~ /^harpodon$/ &&  $1 !~ /^harpoise$/ &&  $1 !~ /^harpon$/ &&  $1 !~ /^harponnage$/ &&  $1 !~ /^harponnement$/ &&  $1 !~ /^harponner$/ &&  $1 !~ /^harponneur$/ &&  $1 !~ /^harpye$/ &&  $1 !~ /^harrier$/ &&  $1 !~ /^hart$/ &&  $1 !~ /^hasard$/ &&  $1 !~ /^hasarder$/ &&  $1 !~ /^hasardeuse$/ &&  $1 !~ /^hasardeusement$/ &&  $1 !~ /^hasardeux$/ &&  $1 !~ /^has been$/ &&  $1 !~ /^hasch$/ &&  $1 !~ /^haschich$/ &&  $1 !~ /^haschisch$/ &&  $1 !~ /^hase$/ &&  $1 !~ /^hâte$/ &&  $1 !~ /^hâter$/ &&  $1 !~ /^hatha-yoga$/ &&  $1 !~ /^hâtier$/ &&  $1 !~ /^hâtif$/ &&  $1 !~ /^hâtive$/ &&  $1 !~ /^hattéria$/ &&  $1 !~ /^hauban$/ &&  $1 !~ /^haubanage$/ &&  $1 !~ /^haubaner$/ &&  $1 !~ /^haubert$/ &&  $1 !~ /^hausse$/ &&  $1 !~ /^hausse-col$/ &&  $1 !~ /^haussement$/ &&  $1 !~ /^hausser$/ &&  $1 !~ /^hausse-repère$/ &&  $1 !~ /^haussier$/ &&  $1 !~ /^haussière$/ &&  $1 !~ /^haut$/ &&  $1 !~ /^hautain$/ &&  $1 !~ /^hautaine$/ &&  $1 !~ /^haut-bar$/ &&  $1 !~ /^hautbois$/ &&  $1 !~ /^hautboïste$/ &&  $1 !~ /^haut-commissaire$/ &&  $1 !~ /^haut-commissariat$/ &&  $1 !~ /^haut-de-chausse(s)$/ &&  $1 !~ /^haut-de-côtelettes$/ &&  $1 !~ /^haut-de-côtes$/ &&  $1 !~ /^haut-de-forme$/ &&  $1 !~ /^haute$/ &&  $1 !~ /^haute-contre$/ &&  $1 !~ /^hautement$/ &&  $1 !~ /^haute-tige$/ &&  $1 !~ /^hauteur$/ &&  $1 !~ /^haut-fond$/ &&  $1 !~ /^haut-fourneau$/ &&  $1 !~ /^hautin$/ &&  $1 !~ /^haut-jointé$/ &&  $1 !~ /^haut-jointée$/ &&  $1 !~ /^haut-le-cœur$/ &&  $1 !~ /^haut-le-corps$/ &&  $1 !~ /^haut-le-pied$/ &&  $1 !~ /^haut-parc$/ &&  $1 !~ /^haut-parleur$/ &&  $1 !~ /^haut-relief$/ &&  $1 !~ /^hauturier$/ &&  $1 !~ /^hauturière$/ &&  $1 !~ /^havage$/ &&  $1 !~ /^havane$/ &&  $1 !~ /^hâve$/ &&  $1 !~ /^havée$/ &&  $1 !~ /^haveneau$/ &&  $1 !~ /^havenet$/ &&  $1 !~ /^haver$/ &&  $1 !~ /^haveur$/ &&  $1 !~ /^haveuse$/ &&  $1 !~ /^havre$/ &&  $1 !~ /^havresac$/ &&  $1 !~ /^havrit$/ &&  $1 !~ /^haylage$/ &&  $1 !~ /^hayon$/ &&  $1 !~ /^hé !$/ &&  $1 !~ /^heat-set$/ &&  $1 !~ /^heaume$/ &&  $1 !~ /^hein !$/ &&  $1 !~ /^héler$/ &&  $1 !~ /^hem !$/ &&  $1 !~ /^henné$/ &&  $1 !~ /^hennin$/ &&  $1 !~ /^hennir$/ &&  $1 !~ /^hennissant$/ &&  $1 !~ /^hennissante$/ &&  $1 !~ /^hennissement$/ &&  $1 !~ /^hennuyer$/ &&  $1 !~ /^hep !$/ &&  $1 !~ /^héraut$/ &&  $1 !~ /^hère$/ &&  $1 !~ /^hérissé$/ &&  $1 !~ /^hérissée$/ &&  $1 !~ /^hérissement$/ &&  $1 !~ /^hérisser$/ &&  $1 !~ /^hérisson$/ &&  $1 !~ /^hérissonne$/ &&  $1 !~ /^herniaire$/ &&  $1 !~ /^hernie$/ &&  $1 !~ /^hernié$/ &&  $1 !~ /^herniée$/ &&  $1 !~ /^hernieuse$/ &&  $1 !~ /^hernieux$/ &&  $1 !~ /^héroïne$/ &&  $1 !~ /^héron$/ &&  $1 !~ /^héronneau$/ &&  $1 !~ /^héronnier$/ &&  $1 !~ /^héronnière$/ &&  $1 !~ /^héros$/ &&  $1 !~ /^hersage$/ &&  $1 !~ /^herse$/ &&  $1 !~ /^herser$/ &&  $1 !~ /^hersillon$/ &&  $1 !~ /^hêtraie$/ &&  $1 !~ /^hêtre$/ &&  $1 !~ /^heu !$/ &&  $1 !~ /^heurt$/ &&  $1 !~ /^heurter$/ &&  $1 !~ /^heurtoir$/ &&  $1 !~ /^hibou$/ &&  $1 !~ /^hic$/ &&  $1 !~ /^hickory$/ &&  $1 !~ /^hideur$/ &&  $1 !~ /^hideuse$/ &&  $1 !~ /^hideusement$/ &&  $1 !~ /^hideux$/ &&  $1 !~ /^hidjab$/ &&  $1 !~ /^hiement$/ &&  $1 !~ /^hiérarchie$/ &&  $1 !~ /^hiérarchique$/ &&  $1 !~ /^hiérarchiquement$/ &&  $1 !~ /^hiérarchisation$/ &&  $1 !~ /^hiérarchiser$/ &&  $1 !~ /^hiérarque$/ &&  $1 !~ /^hi-fi$/ &&  $1 !~ /^high bulk$/ &&  $1 !~ /^high-tech$/ &&  $1 !~ /^hilaire$/ &&  $1 !~ /^hile$/ &&  $1 !~ /^hindi$/ &&  $1 !~ /^hip !$/ &&  $1 !~ /^hip-hop$/ &&  $1 !~ /^hippie$/ &&  $1 !~ /^hippy$/ &&  $1 !~ /^hissage$/ &&  $1 !~ /^hit$/ &&  $1 !~ /^hit-parade$/ &&  $1 !~ /^ho !$/ &&  $1 !~ /^hobby$/ &&  $1 !~ /^hobbyste$/ &&  $1 !~ /^hobereau$/ &&  $1 !~ /^hochement$/ &&  $1 !~ /^hochepot$/ &&  $1 !~ /^hochequeue$/ &&  $1 !~ /^hocher$/ &&  $1 !~ /^hochet$/ &&  $1 !~ /^hockey$/ &&  $1 !~ /^hockeyeur$/ &&  $1 !~ /^hockeyeuse$/ &&  $1 !~ /^ho! hisse!$/ &&  $1 !~ /^holà !$/ &&  $1 !~ /^holding$/ &&  $1 !~ /^hold-up$/ &&  $1 !~ /^Hollande$/ &&  $1 !~ /^hollandite$/ &&  $1 !~ /^hollywoodien$/ &&  $1 !~ /^hollywoodienne$/ &&  $1 !~ /^homard$/ &&  $1 !~ /^homarderie$/ &&  $1 !~ /^homardier$/ &&  $1 !~ /^home$/ &&  $1 !~ /^home-trainer$/ &&  $1 !~ /^hongre$/ &&  $1 !~ /^hongrer$/ &&  $1 !~ /^hongreur$/ &&  $1 !~ /^hongreuse$/ &&  $1 !~ /^Hongrie$/ &&  $1 !~ /^hongroierie$/ &&  $1 !~ /^hongroyage$/ &&  $1 !~ /^hongroyer$/ &&  $1 !~ /^hongroyeur$/ &&  $1 !~ /^honning$/ &&  $1 !~ /^honnir$/ &&  $1 !~ /^honoris causa$/ &&  $1 !~ /^honte$/ &&  $1 !~ /^honteuse$/ &&  $1 !~ /^honteusement$/ &&  $1 !~ /^honteux$/ &&  $1 !~ /^hooligan$/ &&  $1 !~ /^hooliganisme$/ &&  $1 !~ /^hop !$/ &&  $1 !~ /^hop-je$/ &&  $1 !~ /^hoquet$/ &&  $1 !~ /^hoqueter$/ &&  $1 !~ /^hoqueton$/ &&  $1 !~ /^horde$/ &&  $1 !~ /^horion$/ &&  $1 !~ /^hormis$/ &&  $1 !~ /^hornblende$/ &&  $1 !~ /^hors$/ &&  $1 !~ /^horsain$/ &&  $1 !~ /^hors-bord$/ &&  $1 !~ /^hors-cote$/ &&  $1 !~ /^hors de$/ &&  $1 !~ /^hors-de-cour$/ &&  $1 !~ /^hors-d'œuvre$/ &&  $1 !~ /^horse-guard$/ &&  $1 !~ /^horse power$/ &&  $1 !~ /^horsin$/ &&  $1 !~ /^hors-jeu$/ &&  $1 !~ /^hors-la-loi$/ &&  $1 !~ /^hors-ligne$/ &&  $1 !~ /^hors-marché$/ &&  $1 !~ /^hors-piste$/ &&  $1 !~ /^hors-pistes$/ &&  $1 !~ /^hors-statut$/ &&  $1 !~ /^horst$/ &&  $1 !~ /^hors-texte$/ &&  $1 !~ /^hot$/ &&  $1 !~ /^hot dog$/ &&  $1 !~ /^hot-flue$/ &&  $1 !~ /^hotinus$/ &&  $1 !~ /^hot money$/ &&  $1 !~ /^hotte$/ &&  $1 !~ /^hottée$/ &&  $1 !~ /^hotu$/ &&  $1 !~ /^hou !$/ &&  $1 !~ /^houache$/ &&  $1 !~ /^houage$/ &&  $1 !~ /^houaiche$/ &&  $1 !~ /^houblon$/ &&  $1 !~ /^houe$/ &&  $1 !~ /^houer$/ &&  $1 !~ /^houille$/ &&  $1 !~ /^houiller$/ &&  $1 !~ /^houillère$/ &&  $1 !~ /^houle$/ &&  $1 !~ /^houlette$/ &&  $1 !~ /^houleuse$/ &&  $1 !~ /^houleux$/ &&  $1 !~ /^houligan$/ &&  $1 !~ /^houliganisme$/ &&  $1 !~ /^houlque$/ &&  $1 !~ /^houp !$/ &&  $1 !~ /^houppe$/ &&  $1 !~ /^houppelande$/ &&  $1 !~ /^houppette$/ &&  $1 !~ /^houppier$/ &&  $1 !~ /^hourd$/ &&  $1 !~ /^hourdage$/ &&  $1 !~ /^hourder$/ &&  $1 !~ /^hourdir$/ &&  $1 !~ /^hourdis$/ &&  $1 !~ /^houri$/ &&  $1 !~ /^hourque$/ &&  $1 !~ /^hourra !$/ &&  $1 !~ /^hourri$/ &&  $1 !~ /^hourrite$/ &&  $1 !~ /^hourvari$/ &&  $1 !~ /^housche$/ &&  $1 !~ /^houseau$/ &&  $1 !~ /^house-boat$/ &&  $1 !~ /^houspiller$/ &&  $1 !~ /^houssage$/ &&  $1 !~ /^housse$/ &&  $1 !~ /^housser$/ &&  $1 !~ /^housset$/ &&  $1 !~ /^houssière$/ &&  $1 !~ /^houst !$/ &&  $1 !~ /^houx$/ &&  $1 !~ /^hovéa$/ &&  $1 !~ /^hoyau$/ &&  $1 !~ /^hoyé$/ &&  $1 !~ /^hoyée$/ &&  $1 !~ /^huard$/ &&  $1 !~ /^huart$/ &&  $1 !~ /^hublot$/ &&  $1 !~ /^huche$/ &&  $1 !~ /^hucher$/ &&  $1 !~ /^huchier$/ &&  $1 !~ /^hue !$/ &&  $1 !~ /^huée$/ &&  $1 !~ /^huer$/ &&  $1 !~ /^huerta$/ &&  $1 !~ /^huguenot$/ &&  $1 !~ /^huipil$/ &&  $1 !~ /^huir$/ &&  $1 !~ /^huis clos$/ &&  $1 !~ /^huit$/ &&  $1 !~ /^huitain$/ &&  $1 !~ /^huitaine$/ &&  $1 !~ /^huitante$/ &&  $1 !~ /^huit-en-huit$/ &&  $1 !~ /^huitième$/ &&  $1 !~ /^huitièmement$/ &&  $1 !~ /^huit-reflets$/ &&  $1 !~ /^hulotte$/ &&  $1 !~ /^hululation$/ &&  $1 !~ /^hululement$/ &&  $1 !~ /^hululer$/ &&  $1 !~ /^humer$/ &&  $1 !~ /^hum ! $/ &&  $1 !~ /^humantin$/ &&  $1 !~ /^hune$/ &&  $1 !~ /^hunier$/ &&  $1 !~ /^hunter$/ &&  $1 !~ /^huppe$/ &&  $1 !~ /^huppé$/ &&  $1 !~ /^huppée$/ &&  $1 !~ /^huque$/ &&  $1 !~ /^hurdler$/ &&  $1 !~ /^hure$/ &&  $1 !~ /^hurlant$/ &&  $1 !~ /^hurlement$/ &&  $1 !~ /^hurler$/ &&  $1 !~ /^hurleur$/ &&  $1 !~ /^hurleuse$/ &&  $1 !~ /^huron$/ &&  $1 !~ /^Huron$/ &&  $1 !~ /^huronne$/ &&  $1 !~ /^hurrah !$/ &&  $1 !~ /^hurricane$/ &&  $1 !~ /^husky$/ &&  $1 !~ /^hussard$/ &&  $1 !~ /^hussarde$/ &&  $1 !~ /^hutinet$/ &&  $1 !~ /^hutte$/ &&  $1 !~ /^hutteau$/ &&  $1 !~ /^hack$/ &&  $1 !~ /^hacker$/ &&  $1 !~ /^haïk$/ &&  $1 !~ /^hadj$/ &&  $1 !~ /^havanaise$/ &&  $1 !~ /^havanais$/ &&  $1 !~ /^high/ &&  $1 !~ /^haï/ && $1 !~ /^haka$/ && $1 !~ /^hakka$/ &&  $1 !~ /^handball$/ &&  $1 !~ /^house/ &&  $1 !~ /^hadith$/)
# 		{
# 		    print "\"L" arr[i] "\": \"l'" $1 "\",";
# 		    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 		    # print "\"ST" arr[i] "\": \"cette " $1 "\",";
# 		    print "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 		}
# 	    }


# 	    if ($1 ~ /^[aeiouéàâêïîô]/){
# 		print "\"L" arr[i] "\": \"l'" $1 "\",";
# 		print "\"ST" arr[i] "\": \"cette " $1 "\",";
# 		print "\"KL" arr[i] "\": \"que l'" $1 "\",";
#  		# print "\"SOn/" arr[i] "\": \"son " $1 "\",";
# 		# print "\"MOn/" arr[i] "\": \"mon " $1 "\",";
# 		# print "\"TOn/" arr[i] "\": \"ton " $1 "\",";
# 		# print "\"NO/TR" arr[i] "\": \"notre " $1 "\",";
# 		# print "\"F*O/TR" arr[i] "\": \"votre " $1 "\",";
# 		# print "\"KMOn/" arr[i] "\": \"que mon " $1 "\",";
# 		# print "\"KTOn/" arr[i] "\": \"que ton " $1 "\",";
# 		# print "\"KNO/TR" arr[i] "\": \"que notre " $1 "\",";
# 		# print "\"KF*O/TR" arr[i] "\": \"que votre " $1 "\",";
# 	    }
# 	}

## *** Mixte singulier

# 	if($4 ~ /^$/ && $5 ~ /s/)
# 	{
# 	    if ($1  ~ /^[^aeiouéàâêïîôh]/){
# 		# print "\"L/" arr[i] "\": \"le " $1 "\",";
# 		# print "\"KL/" arr[i] "\": \"que le " $1 "\",";
# 		print "\"S/" arr[i] "\": \"ce " $1 "\",";
# 		print "\"ST/" arr[i] "\": \"cette " $1 "\",";
# 		if (arr[i] ~ /^[KPMTFNLR]/)				{ssone = gensub(/([KPMTFNLR])/, "S\\1", 1,arr[i]);  print "\"" ssone "\": \"ce " $1 "\",";}
# 		if (arr[i] ~ /^[FNLR]/)				{stsone = gensub(/([KPMTFNLR])/, "ST\\1", 1,arr[i]);  print "\"" stsone "\": \"cette " $1 "\",";}
# 	    }

# 	    if ($1 ~ /^h/){
# 		if ( $1 !~ /^hâblerie$/  &&  $1 !~ /^hâbleur$/ &&  $1 !~ /^hâbleuse$/ &&  $1 !~ /^hachage$/ &&  $1 !~ /^hache$/ &&  $1 !~ /^haché$/ &&  $1 !~ /^hachée$/ &&  $1 !~ /^hache-légumes$/ &&  $1 !~ /^hachement$/ &&  $1 !~ /^hache-paille$/ &&  $1 !~ /^hacher$/ &&  $1 !~ /^hachette$/ &&  $1 !~ /^hacheur$/ &&  $1 !~ /^hache-viande$/ &&  $1 !~ /^hachis$/ &&  $1 !~ /^hachisch$/ &&  $1 !~ /^hachoir$/ &&  $1 !~ /^hachure$/ &&  $1 !~ /^hachurer$/ &&  $1 !~ /^hackle$/ &&  $1 !~ /^hadal$/ &&  $1 !~ /^hadale$/ &&  $1 !~ /^hadaux$/ &&  $1 !~ /^haddock$/ &&  $1 !~ /^haflinger$/ &&  $1 !~ /^hafnium$/ &&  $1 !~ /^hagard$/ &&  $1 !~ /^haggis$/ &&  $1 !~ /^haie$/ &&  $1 !~ /^haillon$/ &&  $1 !~ /^haillonneuse$/ &&  $1 !~ /^haillonneux$/ &&  $1 !~ /^haine$/ &&  $1 !~ /^haineuse$/ &&  $1 !~ /^haineusement$/ &&  $1 !~ /^haineux$/ &&  $1 !~ /^haïr$/ &&  $1 !~ /^haire$/ &&  $1 !~ /^haïssable$/ &&  $1 !~ /^Haïtien$/ &&  $1 !~ /^Haïtienne$/ &&  $1 !~ /^halage$/ &&  $1 !~ /^hâlage$/ &&  $1 !~ /^halal$/ &&  $1 !~ /^halbi$/ &&  $1 !~ /^halbran$/ &&  $1 !~ /^halbrené$/ &&  $1 !~ /^halbrenée$/ &&  $1 !~ /^halde$/ &&  $1 !~ /^hâle$/ &&  $1 !~ /^hâlé$/ &&  $1 !~ /^hale-bas$/ &&  $1 !~ /^hale-breu$/ &&  $1 !~ /^hale-croc$/ &&  $1 !~ /^hâlée$/ &&  $1 !~ /^halefis$/ &&  $1 !~ /^hâle-haut$/ &&  $1 !~ /^haler$/ &&  $1 !~ /^hâler$/ &&  $1 !~ /^haletant$/ &&  $1 !~ /^halètement$/ &&  $1 !~ /^haleter$/ &&  $1 !~ /^haleur$/ &&  $1 !~ /^haleuse$/ &&  $1 !~ /^half-track$/ &&  $1 !~ /^hall$/ &&  $1 !~ /^halle$/ &&  $1 !~ /^hallebarde$/ &&  $1 !~ /^hallux$/ &&  $1 !~ /^halo$/ &&  $1 !~ /^halte$/ &&  $1 !~ /^halte-garderie$/ &&  $1 !~ /^hamac$/ &&  $1 !~ /^hamada$/ &&  $1 !~ /^hamburger$/ &&  $1 !~ /^hameau$/ &&  $1 !~ /^hamman$/ &&  $1 !~ /^hampe$/ &&  $1 !~ /^hamster$/ &&  $1 !~ /^hanche$/ &&  $1 !~ /^hanchement$/ &&  $1 !~ /^hancher$/ &&  $1 !~ /^hand-ball$/ &&  $1 !~ /^handballeur$/ &&  $1 !~ /^handballeuse$/ &&  $1 !~ /^handicap$/ &&  $1 !~ /^handicapant$/ &&  $1 !~ /^handicapante$/ &&  $1 !~ /^handicapé$/ &&  $1 !~ /^handicapée$/ &&  $1 !~ /^handicaper$/ &&  $1 !~ /^handicapeur$/ &&  $1 !~ /^handisport$/ &&  $1 !~ /^hangar$/ &&  $1 !~ /^hanneton$/ &&  $1 !~ /^hanon$/ &&  $1 !~ /^hanse$/ &&  $1 !~ /^hanter$/ &&  $1 !~ /^hantise$/ &&  $1 !~ /^happement$/ &&  $1 !~ /^happening$/ &&  $1 !~ /^happer$/ &&  $1 !~ /^happy end$/ &&  $1 !~ /^haque$/ &&  $1 !~ /^haquenée$/ &&  $1 !~ /^haquet$/ &&  $1 !~ /^hara-kiri$/ &&  $1 !~ /^harangue$/ &&  $1 !~ /^haranguer$/ &&  $1 !~ /^harangueur$/ &&  $1 !~ /^harangueuse$/ &&  $1 !~ /^haras$/ &&  $1 !~ /^harassant$/ &&  $1 !~ /^harassante$/ &&  $1 !~ /^harassé$/ &&  $1 !~ /^harassée$/ &&  $1 !~ /^harassement$/ &&  $1 !~ /^harasser$/ &&  $1 !~ /^harcelant$/ &&  $1 !~ /^harcelante$/ &&  $1 !~ /^harcèlement$/ &&  $1 !~ /^harceler$/ &&  $1 !~ /^hard$/ &&  $1 !~ /^hard-bop$/ &&  $1 !~ /^hard-core$/ &&  $1 !~ /^harde$/ &&  $1 !~ /^hardé$/ &&  $1 !~ /^hard-edge$/ &&  $1 !~ /^harder$/ &&  $1 !~ /^hardes$/ &&  $1 !~ /^hard ground$/ &&  $1 !~ /^hardi$/ &&  $1 !~ /^hardie$/ &&  $1 !~ /^hardiesse$/ &&  $1 !~ /^hardiment$/ &&  $1 !~ /^hard-rock$/ &&  $1 !~ /^hard-top$/ &&  $1 !~ /^hardware$/ &&  $1 !~ /^harem$/ &&  $1 !~ /^hareng$/ &&  $1 !~ /^harengade$/ &&  $1 !~ /^harengaison$/ &&  $1 !~ /^harengère$/ &&  $1 !~ /^harenguet$/ &&  $1 !~ /^harengueux$/ &&  $1 !~ /^harenguier$/ &&  $1 !~ /^harenguière$/ &&  $1 !~ /^haret$/ &&  $1 !~ /^harfang$/ &&  $1 !~ /^hargne$/ &&  $1 !~ /^hargneuse$/ &&  $1 !~ /^hargneusement$/ &&  $1 !~ /^hargneux$/ &&  $1 !~ /^haricot$/ &&  $1 !~ /^haridelle$/ &&  $1 !~ /^harissa$/ &&  $1 !~ /^harka$/ &&  $1 !~ /^harki$/ &&  $1 !~ /^harnachement$/ &&  $1 !~ /^harnacher$/ &&  $1 !~ /^harnais$/ &&  $1 !~ /^harnat$/ &&  $1 !~ /^harnois$/ &&  $1 !~ /^haro$/ &&  $1 !~ /^harouelle$/ &&  $1 !~ /^harpail$/ &&  $1 !~ /^harpaye$/ &&  $1 !~ /^harpe$/ &&  $1 !~ /^harpe-cithare$/ &&  $1 !~ /^harpe-luth$/ &&  $1 !~ /^harpette$/ &&  $1 !~ /^harpie$/ &&  $1 !~ /^harpiste$/ &&  $1 !~ /^harpocéras$/ &&  $1 !~ /^harpodon$/ &&  $1 !~ /^harpoise$/ &&  $1 !~ /^harpon$/ &&  $1 !~ /^harponnage$/ &&  $1 !~ /^harponnement$/ &&  $1 !~ /^harponner$/ &&  $1 !~ /^harponneur$/ &&  $1 !~ /^harpye$/ &&  $1 !~ /^harrier$/ &&  $1 !~ /^hart$/ &&  $1 !~ /^hasard$/ &&  $1 !~ /^hasarder$/ &&  $1 !~ /^hasardeuse$/ &&  $1 !~ /^hasardeusement$/ &&  $1 !~ /^hasardeux$/ &&  $1 !~ /^has been$/ &&  $1 !~ /^hasch$/ &&  $1 !~ /^haschich$/ &&  $1 !~ /^haschisch$/ &&  $1 !~ /^hase$/ &&  $1 !~ /^hâte$/ &&  $1 !~ /^hâter$/ &&  $1 !~ /^hatha-yoga$/ &&  $1 !~ /^hâtier$/ &&  $1 !~ /^hâtif$/ &&  $1 !~ /^hâtive$/ &&  $1 !~ /^hattéria$/ &&  $1 !~ /^hauban$/ &&  $1 !~ /^haubanage$/ &&  $1 !~ /^haubaner$/ &&  $1 !~ /^haubert$/ &&  $1 !~ /^hausse$/ &&  $1 !~ /^hausse-col$/ &&  $1 !~ /^haussement$/ &&  $1 !~ /^hausser$/ &&  $1 !~ /^hausse-repère$/ &&  $1 !~ /^haussier$/ &&  $1 !~ /^haussière$/ &&  $1 !~ /^haut$/ &&  $1 !~ /^hautain$/ &&  $1 !~ /^hautaine$/ &&  $1 !~ /^haut-bar$/ &&  $1 !~ /^hautbois$/ &&  $1 !~ /^hautboïste$/ &&  $1 !~ /^haut-commissaire$/ &&  $1 !~ /^haut-commissariat$/ &&  $1 !~ /^haut-de-chausse(s)$/ &&  $1 !~ /^haut-de-côtelettes$/ &&  $1 !~ /^haut-de-côtes$/ &&  $1 !~ /^haut-de-forme$/ &&  $1 !~ /^haute$/ &&  $1 !~ /^haute-contre$/ &&  $1 !~ /^hautement$/ &&  $1 !~ /^haute-tige$/ &&  $1 !~ /^hauteur$/ &&  $1 !~ /^haut-fond$/ &&  $1 !~ /^haut-fourneau$/ &&  $1 !~ /^hautin$/ &&  $1 !~ /^haut-jointé$/ &&  $1 !~ /^haut-jointée$/ &&  $1 !~ /^haut-le-cœur$/ &&  $1 !~ /^haut-le-corps$/ &&  $1 !~ /^haut-le-pied$/ &&  $1 !~ /^haut-parc$/ &&  $1 !~ /^haut-parleur$/ &&  $1 !~ /^haut-relief$/ &&  $1 !~ /^hauturier$/ &&  $1 !~ /^hauturière$/ &&  $1 !~ /^havage$/ &&  $1 !~ /^havane$/ &&  $1 !~ /^hâve$/ &&  $1 !~ /^havée$/ &&  $1 !~ /^haveneau$/ &&  $1 !~ /^havenet$/ &&  $1 !~ /^haver$/ &&  $1 !~ /^haveur$/ &&  $1 !~ /^haveuse$/ &&  $1 !~ /^havre$/ &&  $1 !~ /^havresac$/ &&  $1 !~ /^havrit$/ &&  $1 !~ /^haylage$/ &&  $1 !~ /^hayon$/ &&  $1 !~ /^hé !$/ &&  $1 !~ /^heat-set$/ &&  $1 !~ /^heaume$/ &&  $1 !~ /^hein !$/ &&  $1 !~ /^héler$/ &&  $1 !~ /^hem !$/ &&  $1 !~ /^henné$/ &&  $1 !~ /^hennin$/ &&  $1 !~ /^hennir$/ &&  $1 !~ /^hennissant$/ &&  $1 !~ /^hennissante$/ &&  $1 !~ /^hennissement$/ &&  $1 !~ /^hennuyer$/ &&  $1 !~ /^hep !$/ &&  $1 !~ /^héraut$/ &&  $1 !~ /^hère$/ &&  $1 !~ /^hérissé$/ &&  $1 !~ /^hérissée$/ &&  $1 !~ /^hérissement$/ &&  $1 !~ /^hérisser$/ &&  $1 !~ /^hérisson$/ &&  $1 !~ /^hérissonne$/ &&  $1 !~ /^herniaire$/ &&  $1 !~ /^hernie$/ &&  $1 !~ /^hernié$/ &&  $1 !~ /^herniée$/ &&  $1 !~ /^hernieuse$/ &&  $1 !~ /^hernieux$/ &&  $1 !~ /^héroïne$/ &&  $1 !~ /^héron$/ &&  $1 !~ /^héronneau$/ &&  $1 !~ /^héronnier$/ &&  $1 !~ /^héronnière$/ &&  $1 !~ /^héros$/ &&  $1 !~ /^hersage$/ &&  $1 !~ /^herse$/ &&  $1 !~ /^herser$/ &&  $1 !~ /^hersillon$/ &&  $1 !~ /^hêtraie$/ &&  $1 !~ /^hêtre$/ &&  $1 !~ /^heu !$/ &&  $1 !~ /^heurt$/ &&  $1 !~ /^heurter$/ &&  $1 !~ /^heurtoir$/ &&  $1 !~ /^hibou$/ &&  $1 !~ /^hic$/ &&  $1 !~ /^hickory$/ &&  $1 !~ /^hideur$/ &&  $1 !~ /^hideuse$/ &&  $1 !~ /^hideusement$/ &&  $1 !~ /^hideux$/ &&  $1 !~ /^hidjab$/ &&  $1 !~ /^hiement$/ &&  $1 !~ /^hiérarchie$/ &&  $1 !~ /^hiérarchique$/ &&  $1 !~ /^hiérarchiquement$/ &&  $1 !~ /^hiérarchisation$/ &&  $1 !~ /^hiérarchiser$/ &&  $1 !~ /^hiérarque$/ &&  $1 !~ /^hi-fi$/ &&  $1 !~ /^high bulk$/ &&  $1 !~ /^high-tech$/ &&  $1 !~ /^hilaire$/ &&  $1 !~ /^hile$/ &&  $1 !~ /^hindi$/ &&  $1 !~ /^hip !$/ &&  $1 !~ /^hip-hop$/ &&  $1 !~ /^hippie$/ &&  $1 !~ /^hippy$/ &&  $1 !~ /^hissage$/ &&  $1 !~ /^hit$/ &&  $1 !~ /^hit-parade$/ &&  $1 !~ /^ho !$/ &&  $1 !~ /^hobby$/ &&  $1 !~ /^hobbyste$/ &&  $1 !~ /^hobereau$/ &&  $1 !~ /^hochement$/ &&  $1 !~ /^hochepot$/ &&  $1 !~ /^hochequeue$/ &&  $1 !~ /^hocher$/ &&  $1 !~ /^hochet$/ &&  $1 !~ /^hockey$/ &&  $1 !~ /^hockeyeur$/ &&  $1 !~ /^hockeyeuse$/ &&  $1 !~ /^ho! hisse!$/ &&  $1 !~ /^holà !$/ &&  $1 !~ /^holding$/ &&  $1 !~ /^hold-up$/ &&  $1 !~ /^Hollande$/ &&  $1 !~ /^hollandite$/ &&  $1 !~ /^hollywoodien$/ &&  $1 !~ /^hollywoodienne$/ &&  $1 !~ /^homard$/ &&  $1 !~ /^homarderie$/ &&  $1 !~ /^homardier$/ &&  $1 !~ /^home$/ &&  $1 !~ /^home-trainer$/ &&  $1 !~ /^hongre$/ &&  $1 !~ /^hongrer$/ &&  $1 !~ /^hongreur$/ &&  $1 !~ /^hongreuse$/ &&  $1 !~ /^Hongrie$/ &&  $1 !~ /^hongroierie$/ &&  $1 !~ /^hongroyage$/ &&  $1 !~ /^hongroyer$/ &&  $1 !~ /^hongroyeur$/ &&  $1 !~ /^honning$/ &&  $1 !~ /^honnir$/ &&  $1 !~ /^honoris causa$/ &&  $1 !~ /^honte$/ &&  $1 !~ /^honteuse$/ &&  $1 !~ /^honteusement$/ &&  $1 !~ /^honteux$/ &&  $1 !~ /^hooligan$/ &&  $1 !~ /^hooliganisme$/ &&  $1 !~ /^hop !$/ &&  $1 !~ /^hop-je$/ &&  $1 !~ /^hoquet$/ &&  $1 !~ /^hoqueter$/ &&  $1 !~ /^hoqueton$/ &&  $1 !~ /^horde$/ &&  $1 !~ /^horion$/ &&  $1 !~ /^hormis$/ &&  $1 !~ /^hornblende$/ &&  $1 !~ /^hors$/ &&  $1 !~ /^horsain$/ &&  $1 !~ /^hors-bord$/ &&  $1 !~ /^hors-cote$/ &&  $1 !~ /^hors de$/ &&  $1 !~ /^hors-de-cour$/ &&  $1 !~ /^hors-d'œuvre$/ &&  $1 !~ /^horse-guard$/ &&  $1 !~ /^horse power$/ &&  $1 !~ /^horsin$/ &&  $1 !~ /^hors-jeu$/ &&  $1 !~ /^hors-la-loi$/ &&  $1 !~ /^hors-ligne$/ &&  $1 !~ /^hors-marché$/ &&  $1 !~ /^hors-piste$/ &&  $1 !~ /^hors-pistes$/ &&  $1 !~ /^hors-statut$/ &&  $1 !~ /^horst$/ &&  $1 !~ /^hors-texte$/ &&  $1 !~ /^hot$/ &&  $1 !~ /^hot dog$/ &&  $1 !~ /^hot-flue$/ &&  $1 !~ /^hotinus$/ &&  $1 !~ /^hot money$/ &&  $1 !~ /^hotte$/ &&  $1 !~ /^hottée$/ &&  $1 !~ /^hotu$/ &&  $1 !~ /^hou !$/ &&  $1 !~ /^houache$/ &&  $1 !~ /^houage$/ &&  $1 !~ /^houaiche$/ &&  $1 !~ /^houblon$/ &&  $1 !~ /^houe$/ &&  $1 !~ /^houer$/ &&  $1 !~ /^houille$/ &&  $1 !~ /^houiller$/ &&  $1 !~ /^houillère$/ &&  $1 !~ /^houle$/ &&  $1 !~ /^houlette$/ &&  $1 !~ /^houleuse$/ &&  $1 !~ /^houleux$/ &&  $1 !~ /^houligan$/ &&  $1 !~ /^houliganisme$/ &&  $1 !~ /^houlque$/ &&  $1 !~ /^houp !$/ &&  $1 !~ /^houppe$/ &&  $1 !~ /^houppelande$/ &&  $1 !~ /^houppette$/ &&  $1 !~ /^houppier$/ &&  $1 !~ /^hourd$/ &&  $1 !~ /^hourdage$/ &&  $1 !~ /^hourder$/ &&  $1 !~ /^hourdir$/ &&  $1 !~ /^hourdis$/ &&  $1 !~ /^houri$/ &&  $1 !~ /^hourque$/ &&  $1 !~ /^hourra !$/ &&  $1 !~ /^hourri$/ &&  $1 !~ /^hourrite$/ &&  $1 !~ /^hourvari$/ &&  $1 !~ /^housche$/ &&  $1 !~ /^houseau$/ &&  $1 !~ /^house-boat$/ &&  $1 !~ /^houspiller$/ &&  $1 !~ /^houssage$/ &&  $1 !~ /^housse$/ &&  $1 !~ /^housser$/ &&  $1 !~ /^housset$/ &&  $1 !~ /^houssière$/ &&  $1 !~ /^houst !$/ &&  $1 !~ /^houx$/ &&  $1 !~ /^hovéa$/ &&  $1 !~ /^hoyau$/ &&  $1 !~ /^hoyé$/ &&  $1 !~ /^hoyée$/ &&  $1 !~ /^huard$/ &&  $1 !~ /^huart$/ &&  $1 !~ /^hublot$/ &&  $1 !~ /^huche$/ &&  $1 !~ /^hucher$/ &&  $1 !~ /^huchier$/ &&  $1 !~ /^hue !$/ &&  $1 !~ /^huée$/ &&  $1 !~ /^huer$/ &&  $1 !~ /^huerta$/ &&  $1 !~ /^huguenot$/ &&  $1 !~ /^huipil$/ &&  $1 !~ /^huir$/ &&  $1 !~ /^huis clos$/ &&  $1 !~ /^huit$/ &&  $1 !~ /^huitain$/ &&  $1 !~ /^huitaine$/ &&  $1 !~ /^huitante$/ &&  $1 !~ /^huit-en-huit$/ &&  $1 !~ /^huitième$/ &&  $1 !~ /^huitièmement$/ &&  $1 !~ /^huit-reflets$/ &&  $1 !~ /^hulotte$/ &&  $1 !~ /^hululation$/ &&  $1 !~ /^hululement$/ &&  $1 !~ /^hululer$/ &&  $1 !~ /^humer$/ &&  $1 !~ /^hum ! $/ &&  $1 !~ /^humantin$/ &&  $1 !~ /^hune$/ &&  $1 !~ /^hunier$/ &&  $1 !~ /^hunter$/ &&  $1 !~ /^huppe$/ &&  $1 !~ /^huppé$/ &&  $1 !~ /^huppée$/ &&  $1 !~ /^huque$/ &&  $1 !~ /^hurdler$/ &&  $1 !~ /^hure$/ &&  $1 !~ /^hurlant$/ &&  $1 !~ /^hurlement$/ &&  $1 !~ /^hurler$/ &&  $1 !~ /^hurleur$/ &&  $1 !~ /^hurleuse$/ &&  $1 !~ /^huron$/ &&  $1 !~ /^Huron$/ &&  $1 !~ /^huronne$/ &&  $1 !~ /^hurrah !$/ &&  $1 !~ /^hurricane$/ &&  $1 !~ /^husky$/ &&  $1 !~ /^hussard$/ &&  $1 !~ /^hussarde$/ &&  $1 !~ /^hutinet$/ &&  $1 !~ /^hutte$/ &&  $1 !~ /^hutteau$/ &&  $1 !~ /^hack$/ &&  $1 !~ /^hacker$/ &&  $1 !~ /^haïk$/ &&  $1 !~ /^hadj$/ &&  $1 !~ /^havanaise$/ &&  $1 !~ /^havanais$/ &&  $1 !~ /^high/ &&  $1 !~ /^haï/ && $1 !~ /^haka$/ && $1 !~ /^hakka$/ &&  $1 !~ /^handball$/ &&  $1 !~ /^house/ &&  $1 !~ /^hadith$/)

# 		{
# 		    print "\"L" arr[i] "\": \"l'" $1 "\",";
# 		    print "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 		    print "\"ST" arr[i] "\": \"cet " $1 "\",";
# 		    print "\"ST/" arr[i] "/EU\": \"cette " $1 "\",";
# 		}
# 		else
# 		{
# 		print "\"S/" arr[i] "\": \"ce " $1 "\",";
# 		}
# 	    }

# 	    if ($1 ~ /^[aeiouéàâêïîô]/){
# 		print "\"L" arr[i] "\": \"l'" $1 "\",";
# 		print "\"KL" arr[i] "\": \"que l'" $1 "\",";
# 		print "\"ST/" arr[i] "\": \"cet " $1 "\",";
# 		print "\"ST/" arr[i] "/EU\": \"cette " $1 "\",";
# 		# print "\"NO/TR" arr[i] "\": \"notre " $1 "\",";
# 		# print "\"F*O/TR" arr[i] "\": \"votre " $1 "\",";
# 	    }
# 	}



## ** 3e moulinage
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


## ** fin de noms()
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
## * H aspiré pas d'élision

# if ( $1 ~ /^hâblerie$/  ||  $1 ~ /^hâbleur$/ ||  $1 ~ /^hâbleuse$/ ||  $1 ~ /^hachage$/ ||  $1 ~ /^hache$/ ||  $1 ~ /^haché$/ ||  $1 ~ /^hachée$/ ||  $1 ~ /^hache-légumes$/ ||  $1 ~ /^hachement$/ ||  $1 ~ /^hache-paille$/ ||  $1 ~ /^hacher$/ ||  $1 ~ /^hachette$/ ||  $1 ~ /^hacheur$/ ||  $1 ~ /^hache-viande$/ ||  $1 ~ /^hachis$/ ||  $1 ~ /^hachisch$/ ||  $1 ~ /^hachoir$/ ||  $1 ~ /^hachure$/ ||  $1 ~ /^hachurer$/ ||  $1 ~ /^hackle$/ ||  $1 ~ /^hadal$/ ||  $1 ~ /^hadale$/ ||  $1 ~ /^hadaux$/ ||  $1 ~ /^haddock$/ ||  $1 ~ /^haflinger$/ ||  $1 ~ /^hafnium$/ ||  $1 ~ /^hagard$/ ||  $1 ~ /^haggis$/ ||  $1 ~ /^haie$/ ||  $1 ~ /^haillon$/ ||  $1 ~ /^haillonneuse$/ ||  $1 ~ /^haillonneux$/ ||  $1 ~ /^haine$/ ||  $1 ~ /^haineuse$/ ||  $1 ~ /^haineusement$/ ||  $1 ~ /^haineux$/ ||  $1 ~ /^haïr$/ ||  $1 ~ /^haire$/ ||  $1 ~ /^haïssable$/ ||  $1 ~ /^Haïtien$/ ||  $1 ~ /^Haïtienne$/ ||  $1 ~ /^halage$/ ||  $1 ~ /^hâlage$/ ||  $1 ~ /^halal$/ ||  $1 ~ /^halbi$/ ||  $1 ~ /^halbran$/ ||  $1 ~ /^halbrené$/ ||  $1 ~ /^halbrenée$/ ||  $1 ~ /^halde$/ ||  $1 ~ /^hâle$/ ||  $1 ~ /^hâlé$/ ||  $1 ~ /^hale-bas$/ ||  $1 ~ /^hale-breu$/ ||  $1 ~ /^hale-croc$/ ||  $1 ~ /^hâlée$/ ||  $1 ~ /^halefis$/ ||  $1 ~ /^hâle-haut$/ ||  $1 ~ /^haler$/ ||  $1 ~ /^hâler$/ ||  $1 ~ /^haletant$/ ||  $1 ~ /^halètement$/ ||  $1 ~ /^haleter$/ ||  $1 ~ /^haleur$/ ||  $1 ~ /^haleuse$/ ||  $1 ~ /^half-track$/ ||  $1 ~ /^hall$/ ||  $1 ~ /^halle$/ ||  $1 ~ /^hallebarde$/ ||  $1 ~ /^hallux$/ ||  $1 ~ /^halo$/ ||  $1 ~ /^halte$/ ||  $1 ~ /^halte-garderie$/ ||  $1 ~ /^hamac$/ ||  $1 ~ /^hamada$/ ||  $1 ~ /^hamburger$/ ||  $1 ~ /^hameau$/ ||  $1 ~ /^hamman$/ ||  $1 ~ /^hampe$/ ||  $1 ~ /^hamster$/ ||  $1 ~ /^hanche$/ ||  $1 ~ /^hanchement$/ ||  $1 ~ /^hancher$/ ||  $1 ~ /^hand-ball$/ ||  $1 ~ /^handballeur$/ ||  $1 ~ /^handballeuse$/ ||  $1 ~ /^handicap$/ ||  $1 ~ /^handicapant$/ ||  $1 ~ /^handicapante$/ ||  $1 ~ /^handicapé$/ ||  $1 ~ /^handicapée$/ ||  $1 ~ /^handicaper$/ ||  $1 ~ /^handicapeur$/ ||  $1 ~ /^handisport$/ ||  $1 ~ /^hangar$/ ||  $1 ~ /^hanneton$/ ||  $1 ~ /^hanon$/ ||  $1 ~ /^hanse$/ ||  $1 ~ /^hanter$/ ||  $1 ~ /^hantise$/ ||  $1 ~ /^happement$/ ||  $1 ~ /^happening$/ ||  $1 ~ /^happer$/ ||  $1 ~ /^happy end$/ ||  $1 ~ /^haque$/ ||  $1 ~ /^haquenée$/ ||  $1 ~ /^haquet$/ ||  $1 ~ /^hara-kiri$/ ||  $1 ~ /^harangue$/ ||  $1 ~ /^haranguer$/ ||  $1 ~ /^harangueur$/ ||  $1 ~ /^harangueuse$/ ||  $1 ~ /^haras$/ ||  $1 ~ /^harassant$/ ||  $1 ~ /^harassante$/ ||  $1 ~ /^harassé$/ ||  $1 ~ /^harassée$/ ||  $1 ~ /^harassement$/ ||  $1 ~ /^harasser$/ ||  $1 ~ /^harcelant$/ ||  $1 ~ /^harcelante$/ ||  $1 ~ /^harcèlement$/ ||  $1 ~ /^harceler$/ ||  $1 ~ /^hard$/ ||  $1 ~ /^hard-bop$/ ||  $1 ~ /^hard-core$/ ||  $1 ~ /^harde$/ ||  $1 ~ /^hardé$/ ||  $1 ~ /^hard-edge$/ ||  $1 ~ /^harder$/ ||  $1 ~ /^hardes$/ ||  $1 ~ /^hard ground$/ ||  $1 ~ /^hardi$/ ||  $1 ~ /^hardie$/ ||  $1 ~ /^hardiesse$/ ||  $1 ~ /^hardiment$/ ||  $1 ~ /^hard-rock$/ ||  $1 ~ /^hard-top$/ ||  $1 ~ /^hardware$/ ||  $1 ~ /^harem$/ ||  $1 ~ /^hareng$/ ||  $1 ~ /^harengade$/ ||  $1 ~ /^harengaison$/ ||  $1 ~ /^harengère$/ ||  $1 ~ /^harenguet$/ ||  $1 ~ /^harengueux$/ ||  $1 ~ /^harenguier$/ ||  $1 ~ /^harenguière$/ ||  $1 ~ /^haret$/ ||  $1 ~ /^harfang$/ ||  $1 ~ /^hargne$/ ||  $1 ~ /^hargneuse$/ ||  $1 ~ /^hargneusement$/ ||  $1 ~ /^hargneux$/ ||  $1 ~ /^haricot$/ ||  $1 ~ /^haridelle$/ ||  $1 ~ /^harissa$/ ||  $1 ~ /^harka$/ ||  $1 ~ /^harki$/ ||  $1 ~ /^harnachement$/ ||  $1 ~ /^harnacher$/ ||  $1 ~ /^harnais$/ ||  $1 ~ /^harnat$/ ||  $1 ~ /^harnois$/ ||  $1 ~ /^haro$/ ||  $1 ~ /^harouelle$/ ||  $1 ~ /^harpail$/ ||  $1 ~ /^harpaye$/ ||  $1 ~ /^harpe$/ ||  $1 ~ /^harpe-cithare$/ ||  $1 ~ /^harpe-luth$/ ||  $1 ~ /^harpette$/ ||  $1 ~ /^harpie$/ ||  $1 ~ /^harpiste$/ ||  $1 ~ /^harpocéras$/ ||  $1 ~ /^harpodon$/ ||  $1 ~ /^harpoise$/ ||  $1 ~ /^harpon$/ ||  $1 ~ /^harponnage$/ ||  $1 ~ /^harponnement$/ ||  $1 ~ /^harponner$/ ||  $1 ~ /^harponneur$/ ||  $1 ~ /^harpye$/ ||  $1 ~ /^harrier$/ ||  $1 ~ /^hart$/ ||  $1 ~ /^hasard$/ ||  $1 ~ /^hasarder$/ ||  $1 ~ /^hasardeuse$/ ||  $1 ~ /^hasardeusement$/ ||  $1 ~ /^hasardeux$/ ||  $1 ~ /^has been$/ ||  $1 ~ /^hasch$/ ||  $1 ~ /^haschich$/ ||  $1 ~ /^haschisch$/ ||  $1 ~ /^hase$/ ||  $1 ~ /^hâte$/ ||  $1 ~ /^hâter$/ ||  $1 ~ /^hatha-yoga$/ ||  $1 ~ /^hâtier$/ ||  $1 ~ /^hâtif$/ ||  $1 ~ /^hâtive$/ ||  $1 ~ /^hattéria$/ ||  $1 ~ /^hauban$/ ||  $1 ~ /^haubanage$/ ||  $1 ~ /^haubaner$/ ||  $1 ~ /^haubert$/ ||  $1 ~ /^hausse$/ ||  $1 ~ /^hausse-col$/ ||  $1 ~ /^haussement$/ ||  $1 ~ /^hausser$/ ||  $1 ~ /^hausse-repère$/ ||  $1 ~ /^haussier$/ ||  $1 ~ /^haussière$/ ||  $1 ~ /^haut$/ ||  $1 ~ /^hautain$/ ||  $1 ~ /^hautaine$/ ||  $1 ~ /^haut-bar$/ ||  $1 ~ /^hautbois$/ ||  $1 ~ /^hautboïste$/ ||  $1 ~ /^haut-commissaire$/ ||  $1 ~ /^haut-commissariat$/ ||  $1 ~ /^haut-de-chausse(s)$/ ||  $1 ~ /^haut-de-côtelettes$/ ||  $1 ~ /^haut-de-côtes$/ ||  $1 ~ /^haut-de-forme$/ ||  $1 ~ /^haute$/ ||  $1 ~ /^haute-contre$/ ||  $1 ~ /^hautement$/ ||  $1 ~ /^haute-tige$/ ||  $1 ~ /^hauteur$/ ||  $1 ~ /^haut-fond$/ ||  $1 ~ /^haut-fourneau$/ ||  $1 ~ /^hautin$/ ||  $1 ~ /^haut-jointé$/ ||  $1 ~ /^haut-jointée$/ ||  $1 ~ /^haut-le-cœur$/ ||  $1 ~ /^haut-le-corps$/ ||  $1 ~ /^haut-le-pied$/ ||  $1 ~ /^haut-parc$/ ||  $1 ~ /^haut-parleur$/ ||  $1 ~ /^haut-relief$/ ||  $1 ~ /^hauturier$/ ||  $1 ~ /^hauturière$/ ||  $1 ~ /^havage$/ ||  $1 ~ /^havane$/ ||  $1 ~ /^hâve$/ ||  $1 ~ /^havée$/ ||  $1 ~ /^haveneau$/ ||  $1 ~ /^havenet$/ ||  $1 ~ /^haver$/ ||  $1 ~ /^haveur$/ ||  $1 ~ /^haveuse$/ ||  $1 ~ /^havre$/ ||  $1 ~ /^havresac$/ ||  $1 ~ /^havrit$/ ||  $1 ~ /^haylage$/ ||  $1 ~ /^hayon$/ ||  $1 ~ /^hé !$/ ||  $1 ~ /^heat-set$/ ||  $1 ~ /^heaume$/ ||  $1 ~ /^hein !$/ ||  $1 ~ /^héler$/ ||  $1 ~ /^hem !$/ ||  $1 ~ /^henné$/ ||  $1 ~ /^hennin$/ ||  $1 ~ /^hennir$/ ||  $1 ~ /^hennissant$/ ||  $1 ~ /^hennissante$/ ||  $1 ~ /^hennissement$/ ||  $1 ~ /^hennuyer$/ ||  $1 ~ /^hep !$/ ||  $1 ~ /^héraut$/ ||  $1 ~ /^hère$/ ||  $1 ~ /^hérissé$/ ||  $1 ~ /^hérissée$/ ||  $1 ~ /^hérissement$/ ||  $1 ~ /^hérisser$/ ||  $1 ~ /^hérisson$/ ||  $1 ~ /^hérissonne$/ ||  $1 ~ /^herniaire$/ ||  $1 ~ /^hernie$/ ||  $1 ~ /^hernié$/ ||  $1 ~ /^herniée$/ ||  $1 ~ /^hernieuse$/ ||  $1 ~ /^hernieux$/ ||  $1 ~ /^héroïne$/ ||  $1 ~ /^héron$/ ||  $1 ~ /^héronneau$/ ||  $1 ~ /^héronnier$/ ||  $1 ~ /^héronnière$/ ||  $1 ~ /^héros$/ ||  $1 ~ /^hersage$/ ||  $1 ~ /^herse$/ ||  $1 ~ /^herser$/ ||  $1 ~ /^hersillon$/ ||  $1 ~ /^hêtraie$/ ||  $1 ~ /^hêtre$/ ||  $1 ~ /^heu !$/ ||  $1 ~ /^heurt$/ ||  $1 ~ /^heurter$/ ||  $1 ~ /^heurtoir$/ ||  $1 ~ /^hibou$/ ||  $1 ~ /^hic$/ ||  $1 ~ /^hickory$/ ||  $1 ~ /^hideur$/ ||  $1 ~ /^hideuse$/ ||  $1 ~ /^hideusement$/ ||  $1 ~ /^hideux$/ ||  $1 ~ /^hidjab$/ ||  $1 ~ /^hiement$/ ||  $1 ~ /^hiérarchie$/ ||  $1 ~ /^hiérarchique$/ ||  $1 ~ /^hiérarchiquement$/ ||  $1 ~ /^hiérarchisation$/ ||  $1 ~ /^hiérarchiser$/ ||  $1 ~ /^hiérarque$/ ||  $1 ~ /^hi-fi$/ ||  $1 ~ /^high bulk$/ ||  $1 ~ /^high-tech$/ ||  $1 ~ /^hilaire$/ ||  $1 ~ /^hile$/ ||  $1 ~ /^hindi$/ ||  $1 ~ /^hip !$/ ||  $1 ~ /^hip-hop$/ ||  $1 ~ /^hippie$/ ||  $1 ~ /^hippy$/ ||  $1 ~ /^hissage$/ ||  $1 ~ /^hit$/ ||  $1 ~ /^hit-parade$/ ||  $1 ~ /^ho !$/ ||  $1 ~ /^hobby$/ ||  $1 ~ /^hobbyste$/ ||  $1 ~ /^hobereau$/ ||  $1 ~ /^hochement$/ ||  $1 ~ /^hochepot$/ ||  $1 ~ /^hochequeue$/ ||  $1 ~ /^hocher$/ ||  $1 ~ /^hochet$/ ||  $1 ~ /^hockey$/ ||  $1 ~ /^hockeyeur$/ ||  $1 ~ /^hockeyeuse$/ ||  $1 ~ /^ho! hisse!$/ ||  $1 ~ /^holà !$/ ||  $1 ~ /^holding$/ ||  $1 ~ /^hold-up$/ ||  $1 ~ /^Hollande$/ ||  $1 ~ /^hollandite$/ ||  $1 ~ /^hollywoodien$/ ||  $1 ~ /^hollywoodienne$/ ||  $1 ~ /^homard$/ ||  $1 ~ /^homarderie$/ ||  $1 ~ /^homardier$/ ||  $1 ~ /^home$/ ||  $1 ~ /^home-trainer$/ ||  $1 ~ /^hongre$/ ||  $1 ~ /^hongrer$/ ||  $1 ~ /^hongreur$/ ||  $1 ~ /^hongreuse$/ ||  $1 ~ /^Hongrie$/ ||  $1 ~ /^hongroierie$/ ||  $1 ~ /^hongroyage$/ ||  $1 ~ /^hongroyer$/ ||  $1 ~ /^hongroyeur$/ ||  $1 ~ /^honning$/ ||  $1 ~ /^honnir$/ ||  $1 ~ /^honoris causa$/ ||  $1 ~ /^honte$/ ||  $1 ~ /^honteuse$/ ||  $1 ~ /^honteusement$/ ||  $1 ~ /^honteux$/ ||  $1 ~ /^hooligan$/ ||  $1 ~ /^hooliganisme$/ ||  $1 ~ /^hop !$/ ||  $1 ~ /^hop-je$/ ||  $1 ~ /^hoquet$/ ||  $1 ~ /^hoqueter$/ ||  $1 ~ /^hoqueton$/ ||  $1 ~ /^horde$/ ||  $1 ~ /^horion$/ ||  $1 ~ /^hormis$/ ||  $1 ~ /^hornblende$/ ||  $1 ~ /^hors$/ ||  $1 ~ /^horsain$/ ||  $1 ~ /^hors-bord$/ ||  $1 ~ /^hors-cote$/ ||  $1 ~ /^hors de$/ ||  $1 ~ /^hors-de-cour$/ ||  $1 ~ /^hors-d'œuvre$/ ||  $1 ~ /^horse-guard$/ ||  $1 ~ /^horse power$/ ||  $1 ~ /^horsin$/ ||  $1 ~ /^hors-jeu$/ ||  $1 ~ /^hors-la-loi$/ ||  $1 ~ /^hors-ligne$/ ||  $1 ~ /^hors-marché$/ ||  $1 ~ /^hors-piste$/ ||  $1 ~ /^hors-pistes$/ ||  $1 ~ /^hors-statut$/ ||  $1 ~ /^horst$/ ||  $1 ~ /^hors-texte$/ ||  $1 ~ /^hot$/ ||  $1 ~ /^hot dog$/ ||  $1 ~ /^hot-flue$/ ||  $1 ~ /^hotinus$/ ||  $1 ~ /^hot money$/ ||  $1 ~ /^hotte$/ ||  $1 ~ /^hottée$/ ||  $1 ~ /^hotu$/ ||  $1 ~ /^hou !$/ ||  $1 ~ /^houache$/ ||  $1 ~ /^houage$/ ||  $1 ~ /^houaiche$/ ||  $1 ~ /^houblon$/ ||  $1 ~ /^houe$/ ||  $1 ~ /^houer$/ ||  $1 ~ /^houille$/ ||  $1 ~ /^houiller$/ ||  $1 ~ /^houillère$/ ||  $1 ~ /^houle$/ ||  $1 ~ /^houlette$/ ||  $1 ~ /^houleuse$/ ||  $1 ~ /^houleux$/ ||  $1 ~ /^houligan$/ ||  $1 ~ /^houliganisme$/ ||  $1 ~ /^houlque$/ ||  $1 ~ /^houp !$/ ||  $1 ~ /^houppe$/ ||  $1 ~ /^houppelande$/ ||  $1 ~ /^houppette$/ ||  $1 ~ /^houppier$/ ||  $1 ~ /^hourd$/ ||  $1 ~ /^hourdage$/ ||  $1 ~ /^hourder$/ ||  $1 ~ /^hourdir$/ ||  $1 ~ /^hourdis$/ ||  $1 ~ /^houri$/ ||  $1 ~ /^hourque$/ ||  $1 ~ /^hourra !$/ ||  $1 ~ /^hourri$/ ||  $1 ~ /^hourrite$/ ||  $1 ~ /^hourvari$/ ||  $1 ~ /^housche$/ ||  $1 ~ /^houseau$/ ||  $1 ~ /^house-boat$/ ||  $1 ~ /^houspiller$/ ||  $1 ~ /^houssage$/ ||  $1 ~ /^housse$/ ||  $1 ~ /^housser$/ ||  $1 ~ /^housset$/ ||  $1 ~ /^houssière$/ ||  $1 ~ /^houst !$/ ||  $1 ~ /^houx$/ ||  $1 ~ /^hovéa$/ ||  $1 ~ /^hoyau$/ ||  $1 ~ /^hoyé$/ ||  $1 ~ /^hoyée$/ ||  $1 ~ /^huard$/ ||  $1 ~ /^huart$/ ||  $1 ~ /^hublot$/ ||  $1 ~ /^huche$/ ||  $1 ~ /^hucher$/ ||  $1 ~ /^huchier$/ ||  $1 ~ /^hue !$/ ||  $1 ~ /^huée$/ ||  $1 ~ /^huer$/ ||  $1 ~ /^huerta$/ ||  $1 ~ /^huguenot$/ ||  $1 ~ /^huipil$/ ||  $1 ~ /^huir$/ ||  $1 ~ /^huis clos$/ ||  $1 ~ /^huit$/ ||  $1 ~ /^huitain$/ ||  $1 ~ /^huitaine$/ ||  $1 ~ /^huitante$/ ||  $1 ~ /^huit-en-huit$/ ||  $1 ~ /^huitième$/ ||  $1 ~ /^huitièmement$/ ||  $1 ~ /^huit-reflets$/ ||  $1 ~ /^hulotte$/ ||  $1 ~ /^hululation$/ ||  $1 ~ /^hululement$/ ||  $1 ~ /^hululer$/ ||  $1 ~ /^humer$/ ||  $1 ~ /^hum ! $/ ||  $1 ~ /^humantin$/ ||  $1 ~ /^hune$/ ||  $1 ~ /^hunier$/ ||  $1 ~ /^hunter$/ ||  $1 ~ /^huppe$/ ||  $1 ~ /^huppé$/ ||  $1 ~ /^huppée$/ ||  $1 ~ /^huque$/ ||  $1 ~ /^hurdler$/ ||  $1 ~ /^hure$/ ||  $1 ~ /^hurlant$/ ||  $1 ~ /^hurlement$/ ||  $1 ~ /^hurler$/ ||  $1 ~ /^hurleur$/ ||  $1 ~ /^hurleuse$/ ||  $1 ~ /^huron$/ ||  $1 ~ /^Huron$/ ||  $1 ~ /^huronne$/ ||  $1 ~ /^hurrah !$/ ||  $1 ~ /^hurricane$/ ||  $1 ~ /^husky$/ ||  $1 ~ /^hussard$/ ||  $1 ~ /^hussarde$/ ||  $1 ~ /^hutinet$/ ||  $1 ~ /^hutte$/ ||  $1 ~ /^hutteau$/)



## * exercice UH
# BEGIN{FS="\t";OFS="\t";}
# {
#     for (i = 1; i <= NF ; i++)
#     {
# 	if ($i ~ /^$/)
# 	{
# 	    $i = "noval";
# 	}
#     }
#     array[$2][$1][$3][$4][$5][$6][$7][$8][$9][$10][$11][$12][$13][$14][$15] = ($12+$13+$14+$15)/4;
# }
# # {

# # }
# END{
#     for (sten in array)
#     {
# 	score = -1.0
# 	for (orth in array[sten])
# 	{
# 	    for (c_gram in array[sten][orth])
# 	    {
# 		for (genre in array[sten][orth][c_gram])
# 		{
# 		    for (nombre in array[sten][orth][c_gram][genre])
# 		    {
# 			for (infover in array[sten][orth][c_gram][genre][nombre])
# 			{
# 			    for (cgramm in array[sten][orth][c_gram][genre][nombre][infover])
# 			    {
# 				for (lemme in array[sten][orth][c_gram][genre][nombre][infover][cgramm])
# 				{
# 				    for (syll in array[sten][orth][c_gram][genre][nombre][infover][cgramm][lemme])
# 				    {
# 					for (orthosyll in array[sten][orth][c_gram][genre][nombre][infover][cgramm][lemme][syll])
# 					{
# 					    for (nbsyll in array[sten][orth][c_gram][genre][nombre][infover][cgramm][lemme][syll][orthosyll])
# 					    {
# 						for (frqlemfilm in array[sten][orth][c_gram][genre][nombre][infover][cgramm][lemme][syll][orthosyll][nbsyll])
# 						{
# 						    for (frqlemlivre in array[sten][orth][c_gram][genre][nombre][infover][cgramm][lemme][syll][orthosyll][nbsyll][frqlemfilm])
# 						    {
# 							for (frqfilm in array[sten][orth][c_gram][genre][nombre][infover][cgramm][lemme][syll][orthosyll][nbsyll][frqlemfilm][frqlemlivre])
# 							{
# 							    for (frqlivre in array[sten][orth][c_gram][genre][nombre][infover][cgramm][lemme][syll][orthosyll][nbsyll][frqlemfilm][frqlemlivre][frqfilm])
# 							    {
# 								if (array[sten][orth][c_gram][genre][nombre][infover][cgramm][lemme][syll][orthosyll][nbsyll][frqlemfilm][frqlemlivre][frqfilm][frqlivre] > score)
# 								{
# 								    score = array[sten][orth][c_gram][genre][nombre][infover][cgramm][lemme][syll][orthosyll][nbsyll][frqlemfilm][frqlemlivre][frqfilm][frqlivre];
# 								    # stenstar = sten;
# 								    # orthstar = orth;
# 								}
# 							    }
# 							}
# 						    }
# 						}
# 					    }
# 					}
# 				    }
# 				}
# 			    }
# 			}
# 		    }
# 		}
# 	    }
# 	}
# 	print orth,sten,c_gram,genre,nombre,infover,cgramm,lemme,syll,orthosyll,nbsyll,frqlemfilm,frqlemlivre,frqfilm,frqlivre,score;
#     }
# }


   # if (array[sten][orth] > score)
   # 	    {
   # 		score = array[sten][orth];
   # 		# stenstar = sten;
   # 		# orthstar = orth;
   # 	    }
   # 	    else
   # 	    {
   # 		print "lowest values : "  sten,orth,score;
   # 	    }

#		print array[stenstar][orthstar],stenstar,orthstar;
## * exercice VERBES
# BEGIN{FS="\t";OFS="\t";}
# {
#     for (i = 1; i <= NF ; i++)
#     {
# 	if ($i ~ /^$/)
# 	{
# 	    $i = "noval";
# 	}
#     }
#     if ($3 ~ /VER/)
#     {
#     array[$8][$2][$1][$3][$4][$5][$6][$7][$9][$10][$11][$12][$13][$14][$15] = ($12+$13+$14+$15)/4;
#     }
# }

# # {

# # }
# END{
#     PROCINFO["sorted_in"]  = "@ind_str_desc"
#     for (lemme in array)
#     {
# 	score = -1.0
# 	for (sten in array[lemme])
# 	{
# 	    for (orth in array[lemme][sten])
# 	    {
# 		for (c_gram in array[lemme][sten][orth])
# 		{
# 		    for (genre in array[lemme][sten][orth][c_gram])
# 		    {
# 			for (nombre in array[lemme][sten][orth][c_gram][genre])
# 			{
# 			    for (infover in array[lemme][sten][orth][c_gram][genre][nombre])
# 			    {
# 				for (cgramm in array[lemme][sten][orth][c_gram][genre][nombre][infover])
# 				{
# 				    for (syll in array[lemme][sten][orth][c_gram][genre][nombre][infover][cgramm])
# 				    {
# 					for (orthosyll in array[lemme][sten][orth][c_gram][genre][nombre][infover][cgramm][syll])
# 					{
# 					    for (nbsyll in array[lemme][sten][orth][c_gram][genre][nombre][infover][cgramm][syll][orthosyll])
# 					    {
# 						for (frqlemfilm in array[lemme][sten][orth][c_gram][genre][nombre][infover][cgramm][syll][orthosyll][nbsyll])
# 						{
# 						    for (frqlemlivre in array[lemme][sten][orth][c_gram][genre][nombre][infover][cgramm][syll][orthosyll][nbsyll][frqlemfilm])
# 						    {
# 							for (frqfilm in array[lemme][sten][orth][c_gram][genre][nombre][infover][cgramm][syll][orthosyll][nbsyll][frqlemfilm][frqlemlivre])
# 							{
# 							    for (frqlivre in array[lemme][sten][orth][c_gram][genre][nombre][infover][cgramm][syll][orthosyll][nbsyll][frqlemfilm][frqlemlivre][frqfilm])
# 							    {

# 								# if (array[lemme][sten][orth][c_gram][genre][nombre][infover][cgramm][syll][orthosyll][nbsyll][frqlemfilm][frqlemlivre][frqfilm][frqlivre] > score)
# 								# {
# 								    score = array[lemme][sten][orth][c_gram][genre][nombre][infover][cgramm][syll][orthosyll][nbsyll][frqlemfilm][frqlemlivre][frqfilm][frqlivre];
# 								    print orth,sten,c_gram,genre,nombre,infover,cgramm,lemme,syll,orthosyll,nbsyll,score;
# 								    # stenstar = sten;
# 								    # orthstar = orth;
# 								# }
# 							    }
# 							}
# 						    }
# 						}
# 					    }
# 					}
# 				    }
# 				}
# 			    }
# 			}
# 		    }
# 		}
# 	    }
# 	}

#     }
# }
## * exercice freq
# BEGIN{FS="\t";OFS="\t";}
# {
#     for (i = 1; i <= NF ; i++)
#     {
# 	if ($i ~ /^$/)
# 	{
# 	    $i = "noval";
# 	}
#     }
#     if ($3 ~ /VER/)
#     {
# 	indice = $3;
# 	array[indice][$1][$2][$3][$4][$5][$6][$7][$8][$9][$10][$11] = $0;
#     }
# }
# END{
#     PROCINFO["sorted_in"]  = "@ind_str_asc"
#     for (indice in array)
#     {for (un in array[indice])
# 	{for (deu in array[indice][un])
# 	    {for(troi in array[indice][un][deu])
# 		{for(kad in array[indice][un][deu][troi])
# 		    {for(sinq in array[indice][un][deu][troi][kad])
# 			{for(sis in array[indice][un][deu][troi][kad][sinq])
# 			    {for(sept in array[indice][un][deu][troi][kad][sinq][sis])
# 				{for(huit in array[indice][un][deu][troi][kad][sinq][sis][sept])
# 				    {for(neuf in array[indice][un][deu][troi][kad][sinq][sis][sept][huit])
# 					{for(dix in array[indice][un][deu][troi][kad][sinq][sis][sept][huit][neuf])
# 					    {for(onze in array[indice][un][deu][troi][kad][sinq][sis][sept][huit][neuf][dix])
# 						{
# 						    print indice,array[indice][un][deu][troi][kad][sinq][sis][sept][huit][neuf][dix][onze];
# 						}
# 					    }}}}}}}}}}
#     }
# }
## * exercice
# BEGIN{FS="\t"}
# {
#     array[$2][$1] = ($12+$13+$14+$15)/4;

# }
# # {

# # }
# END{

#     for (sten in array)
#     {
# 	score = -1
# 	for (orth in array[sten])
# 	{
# 	    if (array[sten][orth] > score)
# 	    {
# 		score = array[sten][orth];
# 		# stenstar = sten;
# 		# orthstar = orth;
# 	    }
# 	    else
# 	    {
# 		print "lowest values : "  sten,orth,score;
# 	    }
# 	}
# 	print sten,orth,score;
#     }

# }


# #		print array[stenstar][orthstar],stenstar,orthstar;

## * new Ulexique
BEGIN{FS="\t";}
{
    for (i=1;i<=NF;i++)
    {
	if($i ~/^$/)
	{
	    $i="NovaL";
	}
    }
    moyenne = ($12+$13+$14+$15)/4;
    format = "%-35s%-26s%-8s%-8s%-9s%-56s%-28s%-26s%-30s%-34s%-10s%-20s\n"
    printf (format,$2,$1,$3,$4,$5,$6,$7,$8,$9,$10,$11,moyenne);
}
## * determine length

# BEGIN{FS="\t";}
# {
#     for (i=1;i<=NF;i++)
#     {
# 	if($i ~/^$/)
# 	{
# 	    $i="NovaL";
# 	}

# 	r[i] = length($i);
# 	if( r[i] > max[i])
# 	{
# 	    max[i] = r[i];
# 	    string[i] = $i;
# 	    entree[i] = $1;
# 	}
#     }
# }

# END{
#     for (i in max){
# 	PROCINFO["sorted_in"]  = "@ind_num_asc";
# 	print "la plus longue chaine dans le champ : "i" est de : "max[i];
#     }
# }
