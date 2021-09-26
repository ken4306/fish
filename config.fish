# setup and alias for emacs

#alias emacs="/usr/bin/env XLIB_SKIP_ARGB_VISUALS=1 emacs26"
#alias emacsclient="/usr/bin/env XLIB_SKIP_ARGB_VISUALS=1 emacsclient"
set -x XLIB_SKIP_ARGB_VISUALS 1
alias ec="emacsclient -cn"

# alias for streaming audio cd
alias strcd="ffmpeg  -f libcdio -ss 0 -i /dev/cdrom -acodec libmp3lame -ab 48k -bufsize 15 -ac 1 -content_type audio/mpeg -f mp3  icecast://source:str3am@127.0.0.1:8001/test"

# alias for play audio cd 
alias mc="mplayer -cache 1000 cdda://"

# run geant4 init shell script
bass source $HOME/geant4/geant4.10.06-install/bin/geant4.sh


# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

function fish_title
    return
end

# alias for afk screensaver
alias afk="cbonsai -m (fortune -s -n 50| tr '\n' ' ') -li -t 0.2"
