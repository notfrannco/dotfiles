# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi







# EXTRA NEW CONF
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
alias grep="grep --color"
alias gtags="git tag --format='%(creatordate:short)%09%(refname:strip=2)' --sort=creatordate"


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
        echo -e "${GRN}$BATTERY"
    elif [ "$BATTERY" -ge 40 ] && [ "$BATTERY" -le 59 ]; then # 40-59 # yellow
        echo -e "${YEL}$BATTERY"
    elif [ "$BATTERY" -ge 15 ] && [ "$BATTERY" -le 39 ]; then # 15-39 # naranja
        echo -e "${ORANGE} $BATTERY"
    elif [ "$BATTERY" -ge 1 ] && [ "$BATTERY" -le 14 ]; then # 1-14 # red
        echo -e "${RED}$BATTERY"
    fi
}

function gns() {
    K8S_NS=$(kubectl config view --minify -o jsonpath="{.contexts[0].context.namespace}")
    if [ -z $K8S_NS ]; then
        echo "default"
    else
        echo "$K8S_NS"
    fi
}

function get_k8s_user() {
    kubectl config current-context | cut -d '@' -f 1
}

function sns() {
    kubectl config set-context --current --namespace=$1
}

function set_k8s_prompt () {
    USER=$(get_k8s_user)
    NAMESPACE=$(get_k8s_namespace)
    echo -e "(${BLUE}⎈ ${NON}|${RED}$USER${CIAN}:$NAMESPACE${NON})"
} 

# AWS utils
# export the aws profile
function awsp() {
    export AWS_PROFILE=$1
}

# aws get profile
function awsgp() {
    printenv AWS_PROFILE
}

# aws get all profiles
function awsgpa() {
    aws configure list-profiles
}

# aws unset env for logout in bash
function awspo() {
    unset AWS_PROFILE
}

# set kubectl config file location
function kcfg(){
    export KUBECONFIG=$1
}

# unset kubectl config file location
function kcfgo(){
    unset KUBECONFIG
}

# default prompt for k8s
#PS1="${GRN}\u${NON}  ${BLUE}\W ${GRN}"\`"parse_git_branch"\`" ${NON}"\`"set_k8s_prompt"\`" ${NON} "

# default prompt si no uso powerline
PS1="${GRN}\u${NON}  ${BLUE}\W ${GRN}"\`"parse_git_branch"\`" ${NON} "

# default prompt with battery info
#PS1="${GRN}\u ${YEL}🗲 "\`"battery_life"\`"% ${NON} ${BLUE}\W ${GRN}"\`"parse_git_branch"\`" ${NON} "


# default prompt si no uso powerline para AWS
PS1="${GRN}\u${NON} ${ORANGE}{"\`"awsgp"\`"} ${NON} ${BLUE}\W ${GRN}"\`"parse_git_branch"\`" ${NON} "


# configuracion especifica para powerline (packages powerline powerline-fonts)
# Nota:
# 1) hay que configurar el archivo config.json del powerline y especificar
# en la parte de shell > theme: "default_leftonly" para que pueda ver los 
# branches de git
# 2) por defecto powerline muestra 3 directorios padres desde el working directory
# prefiero solo ver mi directory actual y eso se especifica en powerline config folder
# en fedora esta en /etc/xdg/powerline/themes/shell/__main__.py 
# en la opcion dir_limit_depth: 1
#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bash/powerline.sh
#fi


alias k="kubectl"
alias toyaml="python3 -c 'import sys, yaml, json; print(yaml.dump(json.loads(sys.stdin.read())))'"
export PATH=$PATH:/home/jfranco/.kubescape/bin


# Powerline configuration
#if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  source /usr/share/powerline/bindings/bash/powerline.sh
#fi

# aws cli auto complete 
complete -C '/usr/local/bin/aws_completer' aws

# run on all aws accounts
function awscmdall(){
    AWS_PROFILES=$(aws configure list-profiles)
    for PROFILE in $AWS_PROFILES; do
        eval "$1 --profile $PROFILE --region us-east-1"
        #eval "$1"
    done
}


# list ec2 instances
function awsec2a() {
  REGIONS=`aws ec2 describe-regions --region us-east-1 --output text --query Regions[*].[RegionName]`
  for REGION in $REGIONS
  do
    echo -e "\nInstances in '$REGION'..";
    aws ec2 describe-instances --region $REGION | \
      #jq '.Reservations[].Instances[] | "EC2: \(.InstanceId): \(.State.Name) \(.InstanceType) \(.IamInstanceProfile.Arn)"'
      jq '.Reservations[].Instances[] | "EC2: \(.InstanceId): \(.State.Name) \(.InstanceType) \(.LaunchTime)"'
  done
}
source $HOME/.tenv.completion.bash



# from url https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/atomic.omp.json
#eval "$(oh-my-posh init bash --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/atomic.omp.json')"

# from local folder
eval "$(oh-my-posh init bash --config '/home/jfranco/.atomic.omp.json')"
