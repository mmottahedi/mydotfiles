# Identify OS and Machine -----------------------------------------
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"
export EDITOR='vim'


# Machine Specific Environment ------------------------------------
if [ "$(hostname)" "==" "shamu.coe.utsa.edu" ]; then
    if [ -f /etc/profile.modules ]
      then
      . /etc/profile.modules
      module load cmake
      module load gnuplot
      module load matlab
      module load python
      module load abaqus
      module load git
      module load R
    fi
    export PATH=$PATH:~/bin
    export GNUPLOT_LIB=~/.gnuplot
    export MODULEPATH=/share/apps/Modules/3.2.6/modulefiles
    ./.dropbox-dist/dropboxd &
    cp ~/Dropbox/SHAMU/.dotfiles/.* ~/
fi

if [ "$(hostname)" "==" "mfc-X230" ] ; then
    export PATH=$PATH:/home/mfc/spark-1.6.1/bin
    export SPARK_HOME=/home/mfc/spark-1.6.1/
    export WORKON_HOME=$HOME/.virtualenvs
    #export scripting=$HOME/cwd/scripting
    #export PATH=$PATH:$HOME/.ImageJ:/home/mfc/.ampl:/home/mfc/.ampl/amplide
    #$scripting/src/tools:$scripting/scitools/bin:$scripting/bin:
    #export PATH=$PATH:$HOME/.gocode/bin/.drive
    export PATH=$PATH:$HOME/MATLAB/R2014a/bin
    #export PATH=$PATH:/opt/gurobi603/linux64/bin
    export PATH=$PATH:/home/mfc/.pycharm/pycharm-community-4.5/bin
    export PATH=$PATH:/home/mfc/.virtualenvs/py3.4/bin/yapf
    #export GOPATH=/home/mfc/.gocode
    #export PYTHONPATH=$scripting/src/tools:$scripting/scitools/lib
    #export PATH=$PATH:/usr/local/go/bin
   # export GUROBI_HOME=/"opt/gurobi603/linux64"
    #export LD_LIBRARY_PATH="${GUROBI_HOME}/lib"
    export PATH=$PATH:/home/mfc/.local/bin/
    export PATH=$PATH:$HOME/.beaker/beaker-notebook
    export PATH=$PATH:~/cwd/track/
    export JAVA_HOME=/usr/
    export SPARK_HOME=$HOME/spark-1.6.1
    export PATH=$PATH:$SPARK_HOME/bin
    export PYTHONPATH=$PYTHONPATH:$SPARK_HOME/python/
    export PYTHONPATH=$PYTHONPATH:$SPARK_HOME/python/lib/py4j-0.8.2.1-src.zip
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

fi

if [ "$(hostname)" "==" "sfc" ] ; then
    export PATH=$PATH:$HOME/.local/bin
fi

# Path ------------------------------------------------------------


if [ "$OS" = "linux" ] ; then

fi

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi


source $HOME/.zshrc
