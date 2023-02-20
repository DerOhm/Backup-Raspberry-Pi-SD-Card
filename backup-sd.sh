#!/bin/sh
#BACKUP entire SD-CARD
#from Raspberry Pi
#with dd and gzip

INPUT="/dev/mmcblk0" # Device to backup
BACKUP_PATH="/media/BACKUP" # Place where backups where stored
DATE=$(date +%F)
DAYS=20 # days after backups will be deleted
OUTPUT=$BACKUP_PATH"/"$DATE"-mmcblk0.img.gz" # output file
LOGFILE=$BACKUP_PATH"/"$DATE"-log.txt" # output logfile

START_TIME=$(date +%s)
echo "Backup: Script Start -- $(date +%Y%m%d_%H%M)" >> $LOGFILE

dd if=$INPUT | gzip > $OUTPUT
fdisk -l >> $BACKUP_PATH"/"$DATE"_fdisk.txt"

echo "Remove Backup Files older than " $DAYS " days..."

find $BACKUP_PATH -mtime +$DAYS -type f -delete -print >> $LOGFILE

END_TIME=$(date +%s)
ELAPSED_TIME=$(( $END_TIME - $START_TIME ))

echo "Backup: Script End -- $(date +%Y%m%d_%H%M)" >> $LOGFILE
echo "Elapsed Time:  $(date -d 00:00:$ELAPSED_TIME +%Hh:%Mm:%Ss) "  >> $LOGFILE
