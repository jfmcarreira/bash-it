#!/usr/bin/env bash

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
  PS1="$(battery_char)$(clock_only)${yellow}$(ruby_version_prompt) ${bright_green}\u@\h$(cluster_name) ${bright_blue}\w ${brightblue}\$${reset_color} "
}

PROMPT_COMMAND=prompt_command;
