function ll --wraps='ls -Gla' --wraps='ls -la --color=auto' --wraps='ls -la' --description 'alias ll=ls -la'
  ls -la $argv
        
end
