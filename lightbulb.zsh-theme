# lightbulb.zsh-theme

# Tested on Fedora and CentOS, this theme presents OS, time and directory information in the prompt
# Basic functionality was tested on Ubuntu
# This update adds a feature to notify you if a reboot is requested.

function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function reboot_checker () {
  local notice=""
  case $1 in
    fedora | rhel | centos)
      if [[ -z $(which needs-restarting 2> /dev/null) ]]; then
        notice=" - %{$fg[cyan]%}To get restart notifications, install yum-utils/dnf-utils%{$reset_color%}"
      elif ! needs-restarting -r > /dev/null ; then
        notice=" - %{$fg_bold[red]%}***REBOOT REQUESTED***%{$reset_color%}"
      fi
      ;;
    debian | ubuntu | kali)
      if [[ -f /var/run/reboot-required ]]; then
        notice=" - %{$fg_bold[red]%}***REBOOT REQUESTED***%{$reset_color%}"
      fi
      ;;
    *)
      ;;
  esac
  echo "$notice"
}

# OS and Kernel Information
os_id="$(cat /etc/os-release | grep ^ID= | cut -d '=' -f 2 | sed 's/\"//g')"
local os_kernel="💽 : %{$fg[blue]%}\$(cat /etc/os-release | grep PRETTY_NAME | cut -d '=' -f 2 | sed 's/\"//g')%{$reset_color%}"
os_kernel+=" - "
os_kernel+="%{$fg[yellow]%}Kernel \$(uname -r)%{$reset_color%}"
os_kernel+="$(reboot_checker $os_id)"

# Datetime and Uptime Information
local datetime="🕰 : %{$fg[green]%}%D{%a %d %b %Y %T %Z}%{$reset_color%}"
datetime+=" - "
datetime+="%S%{$fg[magenta]%}\$(uptime -p)%{$reset_color%}%s"

# Current Directory Information including file data
local current_directory="📂 : %{$fg[white]$bg[blue]%}%~%{$reset_color%} "
current_directory+="(%{$fg[red]%}\$(ls -1 | wc -l | sed 's: ::g') files%{$reset_color%} "
current_directory+="%{$fg[magenta]%}\$(ls -lah | grep -m 1 total | sed 's/total //')b%{$reset_color%})"

# Username and Hostname Information
# Includes a Job Status Result indicated by
local job_status="%(?:🙂:🤬)"
local username_hostname="$job_status@🖥 : %{$fg[blue]%}%n%{$reset_color%}"
username_hostname+="%{$fg[yellow]%}@%{$reset_color%}"
username_hostname+="%U%{$fg[cyan]%}%m%u%{$reset_color%}"

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
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" 🙂"
ZSH_THEME_GIT_PROMPT_DIRTY=" 🤬"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN=" 🙂"
ZSH_THEME_HG_PROMPT_DIRTY=" 🤬"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"
