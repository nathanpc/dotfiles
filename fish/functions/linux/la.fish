function la --wraps='ls -GAF' --wraps='ls -AF --color=auto' --description 'alias la=ls -AF --color=auto'
  ls -AF --color=auto $argv
        
end
