# Gautams
alias ls='ls -G'
alias lt='ls -altr'

# Git (overrides git zsh defaults)
alias gcp='git commit -am cp'

# Shortcuts to folders
alias wk='cd $HOME/source/com.tappmo'
alias ginx='cd $HOME/source/ginx'

# Building
alias mk='mvn clean install -T 4 -DskipTests'
alias mki='mvn clean install -T 2 -Dintegration'
alias mkt='mvn clean install -T 4'
alias mclean='rm -rf ~/.m2/repository/com/goindex/*'

# Phabricator
alias adp='arc diff --preview'
alias adpo='arc lint && git status && adp | egrep -o "https://cr.goindex.com[^ ]*" | xargs open'
alias al='arc lint'

# Fix Licenses
alias update_licenses='mvn license:add-third-party -Dlicense.useMissingFile=true -Dlicense.excludedGroups="com.goindex"   -Dlicense.outputDirectory=license -Dlicense.missingFile=license/THIRD-PARTY.properties'

# IntelliJ
alias lij='/Applications/IntelliJ\ IDEA\ 15\ CE.app/Contents/MacOS/idea > /dev/null 2>&1 &!'
