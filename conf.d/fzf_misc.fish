#
# Copy from https://github.com/junegunn/fzf/wiki/Examples-(fish)
#
# SSH
function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host\t[^*]' ~/.ssh/config| cut -f 3| fzf | read -l result; and ssh "$result"
end 

# Tmux
function fs --description 'Switch tmux session'
    if set -q TMUX
        tmux list-sessions -F "#{session_name}" | fzf | read -l result; and tmux switch-client -t "$result"
    else
        echo "not in tmux"
        tmux list-sessions -F "#{session_name}" | fzf | read -l result; and tmux attach -t "$result"
    end
end
