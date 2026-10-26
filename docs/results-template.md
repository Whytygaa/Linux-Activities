# Results and Observations

Complete this document only after running the lab. Replace bracketed prompts with your real observations.

## Environment
- Date completed: [YYYY-MM-DD]
- OS/version: [Kali Linux version]
- VM platform: [VirtualBox / VMware / other]
- Lab account: `agent007`

## Verification results
1. **Account creation:** [Paste output or summarize `id agent007` and `getent passwd agent007`.]
2. **Workspace:** [Confirm `mission/intel` and `mission/ops/backup` exist.]
3. **Listing files:** [Confirm `listing1.txt`, `listing2.txt`, and `listing3.txt` were generated.]
4. **Copy/delete:** [Confirm `routes.txt` was copied to backup and `keys.txt` was removed from intel.]
5. **Permissions:** [Paste the real `ls -l targets.txt` output after `chmod 640 targets.txt`.]
6. **Recovery:** [Explain how you restored `ops/backup/routes.txt`.]
7. **Ownership:** [Record owner/group before and after `chown`, and what `agent007` could do.]

## Final directory tree
Paste the real output from:
```bash
ls -laR /home/agent007/mission/
```

## Short required explanation (4–5 lines)
- `useradd` creates a new local user account; options can define the home directory, login shell, and supplementary groups.
- `chmod` changes permissions that control access for the owner, group, and others.
- `ls -l` displays a detailed listing including permissions, ownership, size, and modification time.
- `cp` copies files, while `rm` removes file entries.
- The final recursive listing helps verify the workspace structure and remaining files.

## Reflection
[Write 3–5 sentences: What did you learn? What was challenging? How did you verify your work?]
