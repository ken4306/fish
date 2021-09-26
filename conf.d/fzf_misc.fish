#
# Copy from https://github.com/junegunn/fzf/wiki/Examples-(fish)
#
# SSH
function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host\t[^*]' ~/.ssh/config| cut -f 3| fzf | read -l result; and ssh "$result"
end 

# Tmux
function fs -d "Switch tmux session"
  tmux list-sessions -F "#{session_name}" | fzf | read -l result; and tmux switch-client -t "$result"
end
