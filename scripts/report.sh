
#!/bin/bash

DRY=0
if ["${1:-}"="-n"]; then
DRY=1
shift
fi

DIR="$DIR"  #zdefiniowanie zmiennej
if [ -z "$DIR"]; then   #gdy istnieje
echo "uzycie bash scripts/report.sh [-n] <KATALOG>" >&2
exit 2
fi

if [! -d "$DIR"]; then  #gdy nie istenieje
echo "blad: "$DIR" nie istnieje" >&2
exit 1
fi

date +"%F %T" #wyswietla date i godzine

HAS_SUBDIR=0 #wprowadzamy zmienna
for d in "$DIR"/*; do #sprawdzamy czy sa podkatalogi
if [-d "$d"]; then
HAS SUBDIR=1
break
fi

if ["HAS_SUBDIR" -eq 0]; then
if ["$DIR" -eq 1]; then
echo "DRY-RUN: nie istnieja podkatalogi w: $DIR"
else
echo "brak podkatalogow w: $DIR"
fi
exit 0
fi

if sort --help 2>/dev/nill | grep -q -- "-h"; then
OUT = "$du -sh "$DIR"/* 2./dev/null | sort -h | head  -5)" #aby znalezc top5
fi

if ["$DRY" -eq1]; then
echo "to wynik top5"
fi

printf '%s/n' "$OUT" # wyswietla top5

exit 0



