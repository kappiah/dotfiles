## Install homebrew
```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

## Install rvm
```
\curl -sSL https://get.rvm.io | bash -s stable
```

## Install zprezto
```
git clone --recursive https://github.com/kappiah/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /usr/local/bin/zsh

checkout 'personal' branch in ~/.zprezto
```

### Updating zprezto

**On master**:

```
git fetch upstream master

git rebase upstream/master

git submodule update --init --recursive
  ```

**On personal:**

```
git submodule update --init --recursive

git rebase master
  ```

## Link dotfiles via rcm
```
rcup
```
