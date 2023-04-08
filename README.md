Backup Script README

Description

This bash script creates a compressed backup of a specified source directory, removes local backups older than a defined number of days, and uploads the new backup to a remote server using scp.

Usage

Open the script in a text editor and update the configuration variables:
BACKUP_DIR: The local directory where the backups will be stored.
SOURCE_DIR: The directory you want to create a backup of.
REMOTE_HOST: The remote server's hostname or IP address along with the user (e.g., user@example.com).
REMOTE_DIR: The directory on the remote server where the backups will be uploaded.
KEEP_DAYS: The number of days to keep local backups before deleting them.
Save the changes and make the script executable:
chmod +x backup_script.sh

Run the script:
./backup_script.sh

The script will create a compressed tarball of the source directory, remove backups older than the KEEP_DAYS setting, and upload the new backup to the remote server.

On successful completion, the script will display "Backup successfully created and uploaded." If there is an issue during backup creation or upload, the script will display "Backup creation or upload failed."

Requirements

SSH access to the remote server.
scp command installed on the local machine.
Proper permissions to read the source directory and write to the backup directory.
Ensure that the remote server's public key is added to the local machine's known_hosts file to avoid scp authentication issues.
