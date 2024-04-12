# En RedHat base OS crear un custom.sh en /etc/profile.d/

# default bash profile config que da solus
# source /usr/share/defaults/etc/profile

# path al bindings de powerline para bash en solus
#source /usr/lib64/python2.7/site-packages/powerline/bindings/bash/powerline.sh

#alias ll='ls -la'
alias ll='ls -l --color'
#alias la='ls -a'
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias tks="tmux kill-session -t"
alias la="ls -A --color"
alias ls="ls --color"


# prompot colors
NON='\033[00m' # white
RED='\033[01;31m'
GRN='\033[01;32m'
YEL='\033[01;33m'
BLUE='\033[01;34m'
PURPLE='\033[01;35m'
CIAN='\033[01;36m'
ORANGE='\033[0;33m'



# get current branch in git repo (si no estoy usando powerline)
function parse_git_branch() {
	BRANCH=`git branch 2>/dev/null | sed -n "s/* \(.*\)/\1/p"`
	if [ ! "${BRANCH}" == "" ]
	then
		echo " $BRANCH "
	else
		echo ""
	fi
}

function battery_life() {
	#BATTERY=`acpi | awk 'NR==1{print $4}' | sed 's/.$//'`
	BATTERY=`acpi | awk 'NR==1{print $4}' | sed 's/.$//' |sed 's/%$//'`
    if [ "$BATTERY" -ge 60 ]; then # +60 green
        echo -e "${GRN} $BATTERY"
    elif [ "$BATTERY" -ge 40 ] && [ "$BATTERY" -le 59 ]; then # 40-59 # yellow
        echo -e "${YEL} $BATTERY"
    elif [ "$BATTERY" -ge 15 ] && [ "$BATTERY" -le 39 ]; then # 15-39 # naranja
        echo -e "${ORANGE} $BATTERY"
    elif [ "$BATTERY" -ge 1 ] && [ "$BATTERY" -le 14 ]; then # 1-14 # red
        echo -e "${RED} $BATTERY"
    fi
}







# default prompt si no uso powerline
#PS1="${GRN}\u${NON}  ${BLUE}\W ${GRN}"\`"parse_git_branch"\`" ${NON} "

# default prompt with battery info
#PS1="${GRN}\u "\`"battery_life"\`"% ${NON} ${BLUE}\W ${GRN}"\`"parse_git_branch"\`" ${NON} "




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


alias k="kubectl"
