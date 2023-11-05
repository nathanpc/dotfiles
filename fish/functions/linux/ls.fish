function ls --wraps='ls=ls -GF' --description 'alias ls=ls -F --color=auto'
 command ls -F --color=auto $argv
        
end
