# lightbulb.zsh-theme

# Tested on Fedora and CentOS, this theme presents OS, time and directory information in the prompt

function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# OS and Kernel Information
local os_kernel="💽 : %{$fg[blue]%}\$(/bin/cat /etc/os-release | /bin/grep PRETTY_NAME | /bin/cut -d '=' -f 2 | /bin/sed 's/\"//g')%{$reset_color%}"
os_kernel+=" - "
os_kernel+="%{$fg[yellow]%}Kernel \$(/bin/uname -r)%{$reset_color%}"

# Datetime and Uptime Information
local datetime="🕰 : %{$fg[green]%}%D{%a %d %b %Y %T %Z}%{$reset_color%}"
datetime+=" - "
datetime+="%S%{$fg[magenta]%}\$(/bin/uptime -p)%{$reset_color%}%s"

# Username and Hostname Information
# Includes a Job Status Result indicated by
local job_status="%(?:🙂:🤬)"
local username_hostname="$job_status@🖥 : %{$fg[blue]%}%n%{$reset_color%}"
username_hostname+="%{$fg[yellow]%}@%{$reset_color%}"
username_hostname+="%U%{$fg[cyan]%}%m%u%{$reset_color%}"

# Current Directory Information including file data
local current_directory="📂 : %{$fg[white]$bg[blue]%}%~%{$reset_color%} "
current_directory+="(%{$fg[red]%}\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files%{$reset_color%} "
current_directory+="%{$fg[magenta]%}\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b%{$reset_color%})"

# TTY Information
local tty=" 💡 : %{$fg[magenta]%}%y%{$reset_color%}\$(git_prompt_info)\$(hg_prompt_info)\$(virtualenv_info)"

# Putting all the prompt information together
PROMPT="
$os_kernel
╰─$datetime
 ╰─$current_directory
  ╰─$username_hostname
   ╰─>$tty -> % %{$reset_color%}"

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" 🙂"
ZSH_THEME_GIT_PROMPT_DIRTY=" 🤬"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_HG_PROMPT_CLEAN=" 🙂"
ZSH_THEME_HG_PROMPT_DIRTY=" 🤬"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%} "
