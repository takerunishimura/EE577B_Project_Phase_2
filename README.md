# EE577B Project Phase 1
4x4 Cardinal Mesh Router

---

# Git Guide for Collaborators

---

## Initial One Time Setup

1. Generate SSH Key (on Viterbi server)
```
ssh-keygen -t ed25519 -C "your_usc_email@usc.edu"
```
Press Enter for all prompts

2. Print out key in terminal and add to GitHub
```
cat ~/.ssh/id_ed25519.pub
```
Copy the output → GitHub → Settings → SSH Keys → New SSH Key → Paste

3. Verify connection
```
ssh -T git@github.com
```
Should say: Hi username! You've successfully authenticated

4. Clone the Repo
```
cd ~/EE577B
git clone git@github.com:takerunishimura/EE577B_Project_Phase_1.git
cd EE577B_Project_Phase_1
```

---

## Daily Workflow

### Always pull first before starting work
```
git pull
```

### Check what files you've changed
```
git status
```

### Save and upload your work to GitHub
```
git add .
git commit -m "your message here"
git push
```
To stage a specific file instead: `git add router/design/gold_router.v`

---

## Branching

> A branch is your own personal copy of the project — changes you make won't affect your partner's work until you both agree to merge them together.

### Create and switch to a new branch
```
git checkout -b branch_name
```

### Push your branch and changes to GitHub
```
git add .
git commit -m "your message here"
git push origin branch_name
```

### Switch to main branch
```
git checkout main
```

### Switch to your branch
```
git checkout branch_name
```

### Merge your branch into main (after work is done)
1. Go to GitHub repo page after pushing your branch
2. Click "Compare & pull request"
3. Add a short description of what you did
4. Click "Create pull request"
5. Click "Merge pull request"
