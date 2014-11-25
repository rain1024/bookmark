Bookmark
========

Bookmark Plugin for Zsh

### Features:

* Autocomplete

### Requirements: 

* zsh

* oh-my-zsh

* apparix

```
sudo apt-get install apparix
```

### Install

**Step 1** 

```
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/rain1024/bookmark
```

**Step 2**

In `~/.zshrc`, add `bookmark` to your `plugins`

```
plugins=(bookmark)
```
 
### Usage:

```
bl	list bookmarks
bm	add a bookmark 
bt	cd to a bookmark
```
