# Troubleshooting 

## Dependencies the Easy way

If the `databases/mongodb32` package is not avaialable in the standard FreeBSD repos, you will need to build it from the ports system.  This can take several hours and requires a lot of RAM and Swap.  

As an alternative to this and the special `npm3` port, you can add a custom pkg repo that includes these packages.

```sh
sh -c 'echo -e "RocketChat: {\n\turl: \"http://pkg.morante.net/rocketchat/\${ABI}\",\n\tenabled: yes\n}" > /usr/local/etc/pkg/repos/RocketChat.conf'
pkg install -y mongodb32 node4 git-lite gmake python bash npm3
```
The above commands will satisfy all dependencies and allow you to process with the Meteor installation.
