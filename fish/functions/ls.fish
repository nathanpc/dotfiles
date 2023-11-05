function ls --wraps='ls=ls -GF' --description 'alias ls=ls -F'
 command ls -F $argv
        
end
