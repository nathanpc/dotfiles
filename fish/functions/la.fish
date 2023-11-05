function la --wraps='ls -GAF' --wraps='ls -AF --color=auto' --wraps='ls -AF' --description 'alias la=ls -AF'
  ls -AF $argv
        
end
