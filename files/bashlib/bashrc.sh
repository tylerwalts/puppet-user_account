#  Common settings

### Aliases
alias ll='ls -l --color'
alias l='ll'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'

# Disk usage by Folder
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

### Env Vars
export JAVA_HOME=/usr/java/jdk
export GROOVY_HOME=/opt/groovy

### Paths
PATH=$JAVA_HOME/bin:$PATH
PATH=$PATH:$GROOVY_HOME/bin
PATH=$PATH:/opt/puppet/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/sbin
export PATH=$PATH


# Include user's local overrides
if [[ -e $HOME/.bashlib/bashrc.$USER.sh ]]; then
    source $HOME/.bashlib/bashrc.$USER.sh
fi

