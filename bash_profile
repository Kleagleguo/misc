#echo "executing bach_profile"
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.5
export M2=$M2_HOME/bin
export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_75.jdk/Contents/Home
export SCALA_HOME=/usr/local/share/scala
export PATH=${JAVA_HOME}/bin:$M2:$SCALA_HOME/bin/:$PATH
export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar

if [ -f ~/.profile ]; then
	source ~/.profile
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

mvn_create() {
mvn -B archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
    -DgroupId=com.bingkun \
	  -DartifactId="$1"
}

alias g="git"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Git branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\$ "
export PS1="\[\033[1;37m\][\t]\[\033[m\] \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n\$(parse_git_branch)-> "

git_k() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa_kleagleguo
}

git_g() {
  ssh-add
}
