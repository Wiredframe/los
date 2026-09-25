# Renders docs/demo.gif and docs/screenshot.png: vhs docs/demo.tape (from the repo root)
Output docs/demo.gif
Set Shell zsh
Set FontSize 15
Set Width 1500
Set Height 760
Set Padding 24
Set WindowBar Colorful
Set Theme "Catppuccin Mocha"
Set TypingSpeed 120ms

Hide
Type "export PS1='%F{blue}~%f $ ' PATH=$PWD:$PATH XDG_CACHE_HOME=/tmp/los-demo/cache LOS_PATHS=/tmp/los-demo/bin LOS_IGNORE=/tmp/los-demo/ignore LOS_DESCRIPTIONS=/dev/null" Enter
Type './docs/demo-setup.sh && eval "$(los --init zsh)" && clear' Enter
Sleep 2s
Show

Sleep 500ms
Type "los" Sleep 300ms Enter
Sleep 2s
Down@400ms 3
Sleep 1s
Type "video"
Sleep 1s
Up 9
Sleep 500ms
Down@500ms 4
Sleep 2s
Screenshot docs/screenshot.png
Sleep 1s
Enter
Sleep 1s
Type `-x "https://youtu.be/dQw4w9WgXcQ"`
Sleep 3s
