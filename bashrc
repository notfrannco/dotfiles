# En RedHat base OS crear un custom.sh en /etc/profile.d/

# default bash profile config que da solus
# source /usr/share/defaults/etc/profile

# path al bindings de powerline para bash en solus
#source /usr/lib64/python2.7/site-packages/powerline/bindings/bash/powerline.sh

#alias ll='ls -la'
#alias la='ls -a'
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias tks="tmux kill-session -t"
alias la="ls -A"


# get current branch in git repo (si no estoy usando powerline)
#function parse_git_branch() {
#	BRANCH=`git branch 2>/dev/null | sed -n "s/* \(.*\)/\1/p"`
#	if [ ! "${BRANCH}" == "" ]
#	then
#		echo " $BRANCH "
#	else
#		echo ""
#	fi
#}


# default prompt si no uso powerline
#PS1='\[\e[01;32m\]\u\[\e[m\]  \[\e[01;34m\]\W\[\e[m\] \[\e[01;32m\]`parse_git_branch`\[\e[01;37m\] '




# configuracion especifica para powerline (packages powerline powerline-fonts)
# Nota:
# 1) hay que configurar el archivo config.json del powerline y especificar
# en la parte de shell > theme: "default_leftonly" para que pueda ver los 
# branches de git
# 2) por defecto powerline muestra 3 directorios padres desde el working directory
# prefiero solo ver mi directory actual y eso se especifica en powerline config folder
# en fedora esta en /etc/xdg/powerline/themes/shell/__main__.py 
# en la opcion dir_limit_depth: 1
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi
