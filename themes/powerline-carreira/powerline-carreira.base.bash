# . "$BASH_IT/themes/powerline/powerline.base.bash"
. "$BASH_IT/themes/powerline-multiline/powerline-multiline.base.bash"

# Define this here so it can be used by all of the Powerline themes
THEME_CHECK_SUDO=${THEME_CHECK_SUDO:=true}

function set_color {
  if [[ "${1}" != "-" ]]; then
    fg="38;5;${1}"
  fi
  if [[ "${2}" != "-" ]]; then
    bg="48;5;${2}"
    [[ -n "${fg}" ]] && bg=";${bg}"
  fi
  echo -e "\[\033[${fg}${bg}m\]"
}

function __powerline_carreira_root_info_prompt {
  local color=${ROOT_INFO_THEME_PROMPT_COLOR}
  echo "${HOSTNAME}|${color}"
}


function __powerline_carreira_user_info_prompt {
  local user_info=""
  local color=${USER_INFO_THEME_PROMPT_COLOR}

  if [[ "${THEME_CHECK_SUDO}" = true ]]; then
    if sudo -n uptime 2>&1 | grep -q "load"; then
      color=${USER_INFO_THEME_PROMPT_COLOR_SUDO}
    fi
  fi

  if [[ -n "${SSH_CLIENT}" ]]; then
    user_info="${user_info}${USER_INFO_SSH_CHAR}${USER}@${HOSTNAME}"
  else
    user_info="${user_info}${USER}"
  fi
  if [[ "$USER" == "${CLUSTER_INFO_USER}" ]]; then
    color=${CLUSTER_INFO_THEME_PROMPT_COLOR}
  fi
  [[ -n "${user_info}" ]] && echo "${user_info}|${color}"
}

function __powerline_carreira_cwd_prompt {
  echo "$(pwd | sed "s|^${HOME}|~|")|${CWD_THEME_PROMPT_COLOR}"
}
