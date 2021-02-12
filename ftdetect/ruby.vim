autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" Make those debugger statements painfully obvious
autocmd BufNewFile,BufRead *.rb syn match error contained "\<binding.pry\>"
autocmd BufNewFile,BufRead *.rb syn match error contained "\<debugger\>"
autocmd BufNewFile,BufRead *.rb syn match error contained "\<byebug\>"
