# default bash profile config que da solus
#source /usr/share/defaults/etc/profile

# path al bindings de powerline para bash en solus
#source /usr/lib64/python2.7/site-packages/powerline/bindings/bash/powerline.sh

#alias ll='ls -la'
#alias la='ls -a'
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias tks="tmux kill-session -t"
alias la="ls -A"


# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2>/dev/null | sed -n "s/* \(.*\)/\1/p"`
	if [ ! "${BRANCH}" == "" ]
	then
		#STAT=`parse_git_dirty`
		echo "($BRANCH)"
	else
		echo ""
	fi
}

# default prompt si no uso powerline
PS1='\[\e[01;32m\]\u\[\e[m\]: \[\e[01;34m\]\W\[\e[m\] \[\e[01;32m\]`parse_git_branch`\[\e[01;37m\]$ '
