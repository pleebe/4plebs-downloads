#!/bin/bash
echo "4plebs.org full image dump download script"
echo
echo " This will take many TB of hard drive space. All downloads will go to current working directory."
echo
read -p " Are you sure? [y/n] " -n 1 -r
echo
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
else
year=15;
urip="https://archive.org/download/4plebs-org-image-dump-20";
for month in {10..12}
do
    if [ ${month} = 10 ];
    then
        ext=tar.gz;
    else
        ext=tar;
    fi
    for board in adv hr o pol s4s trv tg tv x;
    do
        wget -c ${urip}${year}-${month}/${board}_${month}${year}.${ext};
    done
done
year=16;
for month in {01..12}
do
    for board in adv hr o pol s4s trv tg tv x;
    do
        wget -c ${urip}${year}-${month}/${board}_${month}${year}.tar;
    done
    if [ ${month} -gt 04 ];
    then
        wget -c ${urip}${year}-${month}/sp_${month}${year}.tar;
    fi
    case ${month} in
        03 | 06 | 07 | 08 | 11 | 12)
        for board in adv hr o pol s4s trv tg tv x;
        do
            wget -c ${urip}${year}-${month}/${board}_${month}${year}_2.tar;
        done
        if [ ${month} != 03 ];
        then
            wget -c ${urip}${year}-${month}/sp_${month}${year}_2.tar;
        fi;;
    esac
    if [ ${month} = 11 ];
    then
        for board in adv hr o pol s4s sp trv tg tv x;
        do
            wget -c ${urip}${year}-${month}/${board}_${month}${year}_3.tar;
        done
    fi
done
year=17;
wget -r -l1 -H -nd -N -np -A.tar.gz ${urip}${year}-06;
for part in {2..5}
do
    wget -r -l1 -H -nd -N -np -A.tar.gz ${urip}${year}-06-part${part};
done
fi
