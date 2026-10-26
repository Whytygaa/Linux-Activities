# Linux Task 01 — Secure File Management & User Configuration on Kali Linux

> Portfolio lab documenting Linux user administration, directory organization, file operations, permissions, and basic recovery.

## Objectives
- Create the `agent007` user with a home directory and Bash shell.
- Add the user to the `sudo` group.
- Complete workspace and file operations as `agent007` (not as root).
- Practice `mkdir`, `cd`, `touch`, `ls`, `cp`, `rm`, and `chmod`.
- Demonstrate recovery by restoring a deleted backup copy.
- Observe the effect of changing file ownership.

## Lab environment
- OS: Kali Linux (or another Debian-based lab VM)
- Shell: Bash
- User under test: `agent007`
- Workspace: `/home/agent007/mission/`

## Repository structure
```text
linux-task-01-secure-file-management/
├── README.md
├── commands/
│   └── command-history.md
├── docs/
│   ├── concepts.md
│   └── results-template.md
├── screenshots/
│   └── README.md
├── scripts/
│   └── setup_workspace.sh
└── evidence/
    └── README.md
```

## Important safety and lab notes
- Run this only in your own Kali Linux VM or another authorized test environment.
- Do not use your everyday account or a production machine for this exercise.
- The lab specifically requires file operations to be performed as `agent007`; only account creation/group configuration and the ownership-change demonstration require an administrator.
- The `keys.txt` file is an empty placeholder for the exercise. Do not put real credentials or secrets in it.
- Changing ownership of `targets.txt` to `root` is a demonstration. Once done, `agent007` may no longer be able to edit it; record the result and restore ownership if needed.
- Screenshots and outputs in this repository are evidence placeholders until you capture your own results. Never present sample evidence as if it came from a completed run.

## Workflow

### 1. Create the account
From an existing account with sudo privileges:
```bash
sudo useradd -m -s /bin/bash -G sudo agent007
sudo passwd agent007
```
If the account already exists, inspect it rather than creating it again:
```bash
id agent007
getent passwd agent007
```

### 2. Switch to `agent007`
```bash
su - agent007
whoami
pwd
```
Expected: `whoami` prints `agent007`; `pwd` prints `/home/agent007`.

### 3. Create the workspace
Run as `agent007`:
```bash
mkdir -p ~/mission/intel ~/mission/ops/backup
cd ~/mission
```

### 4. Create files and capture listings
```bash
cd ~/mission/intel
touch targets.txt routes.txt keys.txt
ls > listing1.txt
ls -l > listing2.txt
ls -la > listing3.txt
```
The listing files are captured at the moment each command runs. Since each listing is created by its redirection, later listings can include earlier listing files.

### 5. Copy and remove files
```bash
cp routes.txt ~/mission/ops/backup/
rm keys.txt
```
Confirm the copy and deletion:
```bash
ls -l ~/mission/ops/backup/
ls -l ~/mission/intel/
```

### 6. Set and verify permissions
```bash
chmod 640 targets.txt
ls -l targets.txt
```
Expected permission string: `-rw-r-----` for a regular file, with owner read/write, group read-only, and no permissions for others.

### 7. Simulate deletion and recover the backup
```bash
rm ~/mission/ops/backup/routes.txt
cp ~/mission/intel/routes.txt ~/mission/ops/backup/
ls -l ~/mission/ops/backup/
```
This is a controlled deletion of the backup copy, followed by restoring it from the original in `intel/`.

### 8. Demonstrate ownership change
First leave the `agent007` shell:
```bash
exit
```
From the sudo-capable administrator account:
```bash
sudo chown root:root /home/agent007/mission/intel/targets.txt
sudo ls -l /home/agent007/mission/intel/targets.txt
```
Switch back and observe:
```bash
su - agent007
ls -l ~/mission/intel/targets.txt
```
Record the observed owner and any access effects. If you want to restore the lab to its original state, exit back to the admin account and run:
```bash
sudo chown agent007:agent007 /home/agent007/mission/intel/targets.txt
```

### 9. Capture final evidence
As `agent007`, run:
```bash
ls -laR /home/agent007/mission/
```
Save a copy of the output:
```bash
ls -laR /home/agent007/mission/ | tee ~/mission/final-directory-tree.txt
```
Also record command history:
```bash
history > ~/mission/command-history.txt
```
Note: `history` output can include sensitive commands from the session. Review the file before committing it; remove unrelated or sensitive entries. Bash history may not include commands from other shells or commands run before history was enabled.

## Submission checklist
- [ ] `commands/command-history.md` updated with commands actually used (or add a sanitized export).
- [ ] `evidence/final-directory-tree.txt` contains your real final `ls -laR` output.
- [ ] `evidence/` contains any relevant real terminal screenshots.
- [ ] `screenshots/` contains clearly named screenshots with no secrets visible.
- [ ] `docs/results-template.md` completed with actual observations.
- [ ] README instructions tested and adjusted for your environment.
- [ ] No passwords, private keys, tokens, or unrelated personal information committed.

## Suggested screenshots
1. `01-user-created.png` — `id agent007` and `getent passwd agent007`.
2. `02-workspace-created.png` — `tree ~/mission` or `ls -laR ~/mission`.
3. `03-files-and-listings.png` — files and listing outputs in `intel/`.
4. `04-permissions-640.png` — `ls -l targets.txt` showing `-rw-r-----`.
5. `05-backup-recovery.png` — backup file removed, restored, and verified.
6. `06-ownership-change.png` — `ls -l` before/after ownership change.
7. `07-final-tree.png` — final `ls -laR /home/agent007/mission/`.

## Learning reflection
After completing the lab, add 3–5 sentences about what you learned, what went wrong, and how you verified the final state.

## License
Educational use. Adapt this documentation to your own lab and attribution requirements.
