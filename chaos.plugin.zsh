# edit/reload profile
alias profile.edit='sudo vi ~/.zshrc'
alias profile.reload='source ~/.zshrc'

# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -alGhf"
alias la='ls -A'

# git
alias g='git'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'


# rails
alias sc='script/console'
alias ss='script/server'
alias sg='script/generate'
alias a='autotest -rails'
alias tlog='tail -f log/development.log'
alias scaffold='script/generate nifty_scaffold'
alias migrate='rake db:migrate db:test:clone'
alias rst='touch tmp/restart.txt'

# commands starting with % for pasting from web
alias %=' '

# fix dir/file permissions recursively from the current directory
alias fixpermd='find . -type d -exec chmod 755 {} \;'
alias fixpermf='find . -type f -exec chmod 644 {} \;'

# Apache shortcuts
alias apache='sudo /usr/sbin/apachectl'
alias apache.graceful='apache graceful'
alias apache.start='apache start'
alias apache.stop='apache stop'
alias apache.restart='apache restart'
alias apache.log='tail -f /var/log/apache2/logs/error-log'
alias apache.edit='sudo vi /etc/apache2/httpd.conf'

# misc shortcuts
alias php.edit='sudo vi /etc/php.ini'
alias php.lint='php -l $1'
alias sniff='phpcs --standard=Zend'
alias ip.address='ifconfig'
alias size.dir='du -sh .'

# Moving around in the directories
alias ..='cd ../'
alias ....='cd ../../'
alias ......='cd ../../../'
alias ~='cd ~'

# VHOSTS
alias vhost.new='sudo vi /etc/hosts'

# MySQL
# mysqldump proper syntax for large data dumps
alias mysqldump='mysqldump --opt -Q --order-by-primary'

# ===========
# FUNCTIONS
# ===========

# change directories/projects
function c() {
  cd ~/Sites/projects/$1/$2;
}

# Create or edit a shell theme within the ~/.oh-my-zsh/themes directory
function edit_zsh_theme() {
  vi ~/.oh-my-zsh/themes/$1.zsh-theme
}

#
# RVM common function to switch to a chosen Ruby's gem directory
#
# see http://rvm.beginrescueend.com/rubies/rubygems/

# Thanks for the awesome idea batasrki
function gemdir {
  if [[ -z "$1" ]] ; then
    echo "gemdir expects a parameter, which should be a valid RVM Ruby selector"
  else
    rvm "$1"
    cd $(rvm gemdir)
    pwd
  fi
}
