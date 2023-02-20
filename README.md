# Backup-Raspberry-Pi-SD-Card
Backup the Raspberry Pi SD Card and compresses the backup using gzip while system is up

Edit the backup-sd.sh and Replace the line "INPUT" with your name of SD-Card and "BACKUP_PATH" with your storage path.
Type "sudo fdisk -l" to get your Input Device

Type sudo chmod +x ./backup-sd.sh to make it executable

For recurrent backups create a crontab using sudo crontab -e
For example: the backup-sd.sh is stored under /home/pi and the backup should start every monday at 1 am:

0 1 * * 1 /home/pi/backup-sd.sh

IMPORTANT: the Script needs to be run with root.
