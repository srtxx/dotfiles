fish_vi_key_bindings
set -x PATH $HOME/.nodebrew/current/bin $PATH
set _U FZF_LEGACY_KEYBINDINGS 0
balias g git
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/abi01384/IdeaProjects/google-cloud-sdk/path.fish.inc' ]; . '/Users/abi01384/IdeaProjects/google-cloud-sdk/path.fish.inc'; end

function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  grep -i '^host [^*]' ~/.ssh/config ~/.ssh/conf.d/hosts/* | cut -d ' ' -f 2 | fzf |  xargs -o ssh
end  

function peco_z
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  z -l | peco $peco_flags | awk '{ print $2 }' | read recent
  if [ $recent ]
      cd $recent
      commandline -r ''
      commandline -f repaint
  end
end

function fish_user_key_bindings
  bind \x1b peco_z # Ctrl-[にバインドする
end 
