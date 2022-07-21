# Defined interactively
function fs --description 'Switch tmux session'
    if set -q TMUX
        echo "in tmux"
        #tmux list-sessions -F "#{session_name}" | fzf | read -l result; and tmux switch-client -t "$result"
    else
        echo "not in tmux"
        #tmux list-sessions -F "#{session_name}" | fzf | read -l result; and tmux attach -t "$result"
    end
end
