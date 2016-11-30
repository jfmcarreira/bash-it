#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY=
SCM_THEME_PROMPT_CLEAN=
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=
GIT_THEME_PROMPT_CLEAN=
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

SCM_THEME_BRANCH_TRACK_PREFIX=' -> '
SCM_THEME_BRANCH_GONE_PREFIX=' -> '

THEME_CLOCK_CHECK=true

function cluster_name ()
{
  if [ $USER == "lljfmc" ]
  then
    echo -e " ${bright_yellow}(HPC)"
  elif [ $USER == "jcarreira.it" ]
  then
    if [ $( hostname ) == "athena" ]
    then
      echo -e " ${bold_bright_cyan}(IT)"
    else
      echo -e " ${bold_bright_yellow}(IT)"
    fi
  fi
}

function show_battery ()
{
  local _bat=$(battery_char)
  if [ ! ${_bat} == "no" ]
  then
    echo "${bold_red}[${_bat}] "
  fi
}


function prompt_command() {
  PS1="\n$(show_battery)$(clock_only) $(color green bold)\u@\h$(cluster_name) $(color blue bold)\w$(scm_prompt_info) $(color blue bold)\$${reset_color}${normal} "
}

PROMPT_COMMAND="prompt_command;"
