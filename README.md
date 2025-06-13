# Background

The podcast Kodsnack (swedish; "code talk") episode 205 discussed how
to be more focused on right here and now and do away with the
past. One of the things was git logs and if they were actually worth
keeping or not.

I took the bait and did a conceptual idea about using the git tag
command to crush the log and just keep the latest commit. It should be
documented and tested well enough - otherwise you wouldn't had tagged
it.

There are several reasons why this is not a very good idea...

## References, Swedish only

1. http://kodsnack.se/205/
1. http://martinbagge.tumblr.com/post/160011454453/re-205-mementometodiken
1. http://kodsnack.se/206/

## The gist

```
brother /tmp$ mkdir rocketvcs
brother /tmp$ cd rocketvcs/
brother /tmp/rocketvcs$ git init
Initierade tomt Git-arkiv i /tmp/rocketvcs/.git/
brother /tmp/rocketvcs (master #)$ echo hejsan > "enfil"
brother /tmp/rocketvcs (master #%)$ git add enfil
brother /tmp/rocketvcs (master +)$ git commit -m "initial commit"
[master (rotincheckning) 56eceec] initial commit
 1 file changed, 1 insertion(+)
create mode 100644 enfil
brother /tmp/rocketvcs (master)$ echo "koda koda" > enannanfil
brother /tmp/rocketvcs (master %)$ git add enannanfil
brother /tmp/rocketvcs (master +)$ git commit -m "soon 1.0."
[master 4c50e18] soon 1.0.
 1 file changed, 1 insertion(+)
create mode 100644 enannanfil
brother /tmp/rocketvcs (master)$ echo "done" > enfil
brother /tmp/rocketvcs (master *)$ git add enfil
brother /tmp/rocketvcs (master +)$ git commit -m "finishing up RC."
[master a83a4ea] finishing up RC.
 1 file changed, 1 insertion(+), 1 deletion(-)
brother /tmp/rocketvcs (master)$ git lg
* a83a4ea - (HEAD -> master) finishing up RC. (3 sekunder sedan)
* 4c50e18 - soon 1.0. (27 sekunder sedan)
* 56eceec - initial commit (52 sekunder sedan)
brother /tmp/rocketvcs (master)$ git tag -m "1.0" 1.0
brother /tmp/rocketvcs (master)$ rm -Rf .git/
brother /tmp/rocketvcs$ git init
Initierade tomt Git-arkiv i /tmp/rocketvcs/.git/
brother /tmp/rocketvcs (master #%)$ git add .
brother /tmp/rocketvcs (master +)$ git commit -m "1.0"
[master (rotincheckning) 0531908] 1.0
 2 files changed, 2 insertions(+)
create mode 100644 enannanfil
create mode 100644 enfil
brother /tmp/rocketvcs (master)$ git tag -m "1.0" 1.0
brother /tmp/rocketvcs (master)$ git lg
* 0531908 - (HEAD -> master, tag: 1.0) 1.0 (12 sekunder sedan)
```

# LICENSE

No rights reserved, [CC0](https://creativecommons.org/share-your-work/public-domain/cc0/)

# Thanks

Some shouts becuase I think it's needed.

* [Kodsnack](http://kodsnack.se/) ([@github](https://github.com/kodsnack))
* [GleSYS](https://glesys.com) ([@github](https://github.com/glesys))
