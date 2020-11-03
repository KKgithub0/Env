# set color options for terminal
export CLICOLOR=1
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;04;32m\]\u\[\033[00m\]:\[\033[01;37m\]\W\[\033[31m\]\$ \[\033[00m\]'
#PS1='\[\e[1;31m\]\u@\[\e[36m\]\H \w]\[\e[m\]\n\$ '
PS1="\[\e[32;1m\][\[\e[33;1m\]\u\[\e[31;1m\]@\[\e[33;1m\]\H \[\e[36;1m\]\w\[\e[32;1m\]]\[\e[34;1m\]\\n$ \[\e[0m\]"
unset LS_COLORS
