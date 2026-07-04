# Git commands with name

- `git config --global user.name "Your Name"`
- `git config user.name`
- `git config --list | grep user.name`
- `git config --global --replace-all user.name "Your Name"`
- `git log --format='%an'`
- `git log --format='%cn'`
- `git show --format='%an <%ae>' --no-patch`
- `git blame --line-porcelain <file> | grep "^author "`
