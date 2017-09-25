# PATH-Warpper
My solution for the problem that some path with space in $PATH not working in WSL(bash on windows)

It will find the path which include space in `$PATH`, bulid a softlink to it, and replace it with new softlink in `$PATH`.the original `$PATH` will be export as a environment variable `$OLDPATH` and be written into a file `PATH.backup`store together with the softlinks.

# Usage
1. modify the configures in the head of script.
```
#configures
PATH_SOFTLINKS="/mnt/c/softlinks" # path to store the softlinks
EXT_SOFTLINKS=".lnk"              # extension of softlink files
```
2.add this script into your initialize script(`.bashrc` or else)
```
/xxx/x$ echo /path/to/this/script/main.sh > /path/to/your/.bashrc
```
or execute it manually in your bash process
```
/xxx/x$ . /path/to/this/script/main.sh
```

enjoy it :)
