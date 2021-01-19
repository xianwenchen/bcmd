#!/bin/bash
user=$(whoami)

while getopts t:c: flag
do
    case "${flag}" in
        t) mailto=${OPTARG};;
        c) cmd=${OPTARG};;
    esac
done
echo "Mail to: $mailto";
echo "Command: $cmd";

echo 0; \
    email_file=/tmp/bcmd-$user-email-$(date +%s%N).txt; \
    cmd_file=/tmp/bcmd-$user-cmd-$(date +%s%N).txt; \
echo 1; \
echo "Subject: bash output: $cmd" >> $email_file; \
echo "" >> $email_file; \
echo 2; \
date >> $email_file; \
    echo 3; \
    echo $cmd > $cmd_file; \
    chmod +x $cmd_file; \
    bash $cmd_file >> $email_file; \
echo 4; \
sendmail -v $mailto < $email_file; \
echo 5; \
log_bak_5=/tmp/bcmd-$user-log-bak-5.txt; \
cmd_bak_5=/tmp/bcmd-$user-cmd-bak-5.txt; \
echo 6; \
log_bak_4=/tmp/bcmd-$user-log-bak-4.txt; \
cmd_bak_4=/tmp/bcmd-$user-cmd-bak-4.txt; \
echo 7; \
log_bak_3=/tmp/bcmd-$user-log-bak-3.txt; \
cmd_bak_3=/tmp/bcmd-$user-cmd-bak-3.txt; \
echo 8; \
log_bak_2=/tmp/bcmd-$user-log-bak-2.txt; \
cmd_bak_2=/tmp/bcmd-$user-cmd-bak-2.txt; \
echo 9; \
log_bak_1=/tmp/bcmd-$user-log-bak-1.txt; \
cmd_bak_1=/tmp/bcmd-$user-cmd-bak-1.txt; \
echo 10; \
if [ -e $log_bak_4 ]; then
    mv $log_bak_4 $log_bak_5
fi; \
if [ -e $cmd_bak_4 ]; then
    mv $cmd_bak_4 $cmd_bak_5
fi; \
echo 11; \
if [ -e $log_bak_3 ]; then
    mv $log_bak_3 $log_bak_4
fi; \
if [ -e $cmd_bak_3 ]; then
    mv $cmd_bak_3 $cmd_bak_4
fi; \
echo 12; \
if [ -e $log_bak_2 ]; then
    mv $log_bak_2 $log_bak_3
fi; \
if [ -e $cmd_bak_2 ]; then
    mv $cmd_bak_2 $cmd_bak_3
fi; \
echo 13; \
if [ -e $log_bak_1 ]; then
    mv $log_bak_1 $log_bak_2
fi; \
if [ -e $cmd_bak_1 ]; then
    mv $cmd_bak_1 $cmd_bak_2
fi; \
echo 14; \
mv $email_file $log_bak_1; \
mv $cmd_file $cmd_bak_1; \
echo 15; \
ls /tmp/bcmd* ; \
echo 16; \
date;
