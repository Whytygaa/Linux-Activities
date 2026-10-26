# Linux Concepts Demonstrated

## `useradd`
Creates a local user account. In this lab, `-m` creates the home directory, `-s /bin/bash` selects Bash as the login shell, and `-G sudo` adds the user to the supplementary `sudo` group.

## `chmod`
Changes file or directory permission bits. `chmod 640 targets.txt` gives the owner read/write (`6`), the group read-only (`4`), and others no permissions (`0`).

## `ls -l`
Shows a long listing with permission bits, link count, owner, group, size, modification time, and filename. Use it to verify the `targets.txt` permissions and observe ownership changes.

## `ls` and `ls -la`
`ls` lists directory entries. `ls -la` includes hidden entries and uses a long listing format.

## `cp` and `rm`
`cp` copies a file; `rm` removes a directory entry. The recovery step restores the backup copy from the original `routes.txt`.

## Ownership
A file has an owner and group. An administrator can use `chown` to change them. Changing ownership does not change the file's permission bits, but it can change which account is treated as the owner for permission checks.
