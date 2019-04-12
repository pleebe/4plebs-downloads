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
urip="https://archive.org/download/4plebs-org-image-dump-20";
year=19;
wget -r -l1 -H -nd -N -np -A.tar.gz ${urip}${year}-01;
for part in {2..11}
do
    wget -r -l1 -H -nd -N -np -A.tar.gz ${urip}${year}-01-part${part};
done
fi
