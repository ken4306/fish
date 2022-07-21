# setup and alias for emacs

#alias emacs="/usr/bin/env XLIB_SKIP_ARGB_VISUALS=1 emacs26"
#alias emacsclient="/usr/bin/env XLIB_SKIP_ARGB_VISUALS=1 emacsclient"
set -x XLIB_SKIP_ARGB_VISUALS 1
alias ec="emacsclient -cn"

# alias for streaming audio cd
alias strcd "ffmpeg  -f libcdio -ss 0 -i /dev/cdrom -acodec libmp3lame -ab 48k -bufsize 15 -ac 1 -content_type audio/mpeg -f mp3  icecast://source:str3am@127.0.0.1:8001/test"

# alias for play audio cd 
alias mc "mplayer -cache 1000 cdda://"

# run geant4 init shell script
# bass source $HOME/geant4/geant4.10.06-install/bin/geant4.sh

# alias for afk screensaver
alias afk "cbonsai -m (fortune -s -n 50| tr '\n' ' ') -li -t 0.2"

# add trick to $PATH
fish_add_path ~/trick_source/bin

# add doom to $PATH
fish_add_path ~/.emacs.d/bin

# add x86_64-elf-gcc to $PATH
fish_add_path ~/opt/cross/bin
set -x TRICK_CFLAGS "-g -Wall -Wmissing-prototypes -Wextra -Wshadow"
set -x TRICK_CXXFLAGS "-g -Wall -Wextra -Wshadow"

function vterm_printf;
    if begin; [  -n "$TMUX" ]  ; and  string match -q -r "screen|tmux" "$TERM"; end
        # tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end
function vterm_prompt_end;
    vterm_printf '51;A'(whoami)'@'(hostname)':'(pwd)
end
functions --copy fish_prompt vterm_old_fish_prompt
function fish_prompt --description 'Write out the prompt; do not replace this. Instead, put this at end of your file.'
    # Remove the trailing newline from the original prompt. This is done
    # using the string builtin from fish, but to make sure any escape codes
    # are correctly interpreted, use %b for printf.
    printf "%b" (string join "\n" (vterm_old_fish_prompt))
    vterm_prompt_end
end
