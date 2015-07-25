function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  echo ''

  # User
  set_color $fish_color_user
  echo -n (whoami)
  set_color normal

  echo -n '@'

  # Host
  set_color $fish_color_host
  echo -n (hostname -s)
  set_color normal

  echo -n ' in '

  # PWD
  set_color $fish_color_cwd
  echo -n (pwd)
  set_color normal

  echo ''

  __terlar_git_prompt
  echo -n

  set_color green

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n -e "→ "
  set_color normal
end
