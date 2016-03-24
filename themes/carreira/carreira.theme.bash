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

function cluster_name ()
{
  if [ $USER == "lljfmc" ]
  then
    echo -e " ${bright_yellow}(HPC)"
  elif [ $USER == "jcarreira.it" ]
  then
    if [ $( hostname ) == "athena" ]
    then
      echo -e " ${bright_cyan}(IT)"
    else
      echo -e " ${bright_yellow}(IT)"
    fi
  fi
}

function prompt_command() {
  PS1="\n$(battery_char)$(clock_only)${yellow}$(ruby_version_prompt) ${bright_green}\u@\h$(cluster_name) ${bright_blue}\w ${green}$(scm_prompt_info)${bright_blue}\$${reset_color} "
}

PROMPT_COMMAND="prompt_command;"
