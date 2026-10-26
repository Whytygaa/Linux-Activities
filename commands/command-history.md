# Command History — Linux Task 01

Replace or supplement this template with the commands you actually executed. Do not claim that commands were run if they were not.

## Administrator account: create user
```bash
sudo useradd -m -s /bin/bash -G sudo agent007
sudo passwd agent007
id agent007
getent passwd agent007
```

## Switch to the lab user
```bash
su - agent007
whoami
pwd
```

## Workspace and files (run as `agent007`)
```bash
mkdir -p ~/mission/intel ~/mission/ops/backup
cd ~/mission/intel
touch targets.txt routes.txt keys.txt
ls > listing1.txt
ls -l > listing2.txt
ls -la > listing3.txt
cp routes.txt ~/mission/ops/backup/
rm keys.txt
chmod 640 targets.txt
ls -l targets.txt
rm ~/mission/ops/backup/routes.txt
cp ~/mission/intel/routes.txt ~/mission/ops/backup/
ls -l ~/mission/ops/backup/
ls -laR /home/agent007/mission/
ls -laR /home/agent007/mission/ | tee ~/mission/final-directory-tree.txt
history > ~/mission/command-history.txt
```

## Administrator account: ownership demonstration
```bash
exit
sudo chown root:root /home/agent007/mission/intel/targets.txt
sudo ls -l /home/agent007/mission/intel/targets.txt
su - agent007
ls -l ~/mission/intel/targets.txt
```

## Optional cleanup / restore ownership
Run from an administrator account:
```bash
sudo chown agent007:agent007 /home/agent007/mission/intel/targets.txt
```

## Actual run notes
- Date/time:
- Kali Linux version:
- VM or host environment:
- Errors encountered and how they were resolved:
- Any deviations from the task instructions:
