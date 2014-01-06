#!/usr/bin/awk -f
# car + preposition
awk 'BEGIN{FS="\t"} NR==FNR {if ($4 ~ /prep/) {a[$2]=$2;next}} $1 in a {print "\"KAl/" $2 "\": \"car, " a[$1] "\",";}' ~/dict-france/Atelier/dicollect/lexique-dicollecte-fr-v5.0.txt ~/dict-france/Atelier/Ulexique500.txt | sort | uniq

# car + determinant
awk 'BEGIN{FS="\t"} NR==FNR {if ($4 ~ /det/) {a[$2]=$2;next}} $1 in a {print "\"KAl/" $2 "\": \", car " a[$1] "\",";}' ~/dict-france/Atelier/dicollect/lexique-dicollecte-fr-v5.0.txt ~/dict-france/Atelier/Ulexique500.txt | sort | uniq
