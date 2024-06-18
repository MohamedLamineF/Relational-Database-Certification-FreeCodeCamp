# Learn Git by Building an SQL Reference Object

## Overview

This course is designed to help to learn Git by building an SQL reference object. Throughout the course, we covered a variety of Git functionalities, from basic commands to advanced techniques. Below is a summary of what was covered and the key takeaways.

## What we can Learned

### 1. **Initializing Git**

- **Command:** `git init`
- **Description:** Initializes a new Git repository, creating a `.git` directory to track changes.

### 2. **Basic Git Workflow**

- **Commands:**
  - `git add <file>`: Stages changes for commit.
  - `git commit -m "Message"`: Commits staged changes with a message.
  
### 3. **Committing Changes**

- **Command:** `git commit -m "Initial commit"`
- **Description:** Saves your changes to the local repository with a descriptive message.

### 4. **Branching and Rebasing**

- **Commands:**
  - `git branch -b <branch-name>`: Creates a new branch.
  - `git checkout <branch-name>`: Switches to the specified branch.
  - `git rebase <branch>`: Rewrites commits on top of another base branch.

### 5. **Handling Merge Conflicts**

- **Steps to Resolve Conflicts:**
  - Use `git status` to see conflict markers.
  - Edit the files to resolve conflicts.
  - Use `git add <file>` to mark them as resolved.
  - Complete the merge with `git rebase --continue`.

### 6. **Viewing Commit History**

- **Commands:**
  - `git log`: Shows the commit history.
  - `git log --oneline`: Displays commits in a concise format.
  - `git log -n`: Shows the n commit(s) history.

### 7. **Stashing Changes**

- **Commands:**
  - `git stash`: Temporarily saves changes.
  - `git stash pop`: Applies the stashed changes back to the working directory.
  - `git stash list`: Lists all stashes.

### 8. **Interactive Rebase**

- **Command:** `git rebase --interactive HEAD~n`
- **Description:** Allows you to edit, reorder, or squash commits interactively.

### 9. **Ignoring Files**

- **Configuration:** Create a `.gitignore` file to specify files or directories that Git should ignore.

### 10. **Additional Commands and Tips**

- **Using Git Diff:**
  - `git diff`: Shows changes between commits, commit and working directory, etc.

## Conclusion

This course is exceptionally detailed and covers almost all Git functions. Even though I working always with Git, I learned new features such as git stash and git rebase --interactive. It’s the most extensive course in the FreeCodeCamp Relational Database Certification, and I completed it surprisingly fast. I highly recommend this course to anyone who wants to gain a deep understanding of Git.