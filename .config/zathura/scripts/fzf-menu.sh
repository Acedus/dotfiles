#!/usr/bin/bash
du -a ~/.local/bin/ /usr/local/bin/ /usr/local/sbin/ /usr/bin/ /usr/sbin/ ~/Downloads/ ~/Documents/ ~/Books/ ~/Projects ~/go-studies/| awk '{print $2}' | fzf -m --border --cycle --reverse --padding 3% --no-info --prompt='  ' --pointer=' ' --color='fg+:#11111b,bg+:#f5c2e7,hl+:#8839ef,fg:#f5e0dc,bg:#1e1e2e,hl:#fe640b,query:#eebebe,gutter:#181825,prompt:#1e66f5,pointer:#8839ef' 
