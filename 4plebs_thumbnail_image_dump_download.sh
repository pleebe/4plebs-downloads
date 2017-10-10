#!/bin/bash
echo "4plebs.org thumbnail image dump download script"
echo
echo " This will take around 70GB of hard drive space. All downloads will go to current working directory."
echo
read -p " Are you sure? [y/n] " -n 1 -r
echo
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
else
    for board in adv f film hr mlpol mo o pol s4s sp tg trv tv x
    do
        wget -c https://archive.org/download/4plebs-org-thumbnail-dump-2017-06/${board}_thumbs.tar.gz;
    done
fi
