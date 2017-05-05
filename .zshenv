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
    export PATH=$PATH:/home/sam/.config/MATLAB/R2014a/bin
    export MATLAB_EXECUTABLE=/home/sam/.config/MATLAB/R2014a/bin/matlab
    export MATLABPATH=/home/sam/Documents/MATLAB/yalmip:/home/sam/Documents/MATLAB/SeDuMi_1_3
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Projects
    export PATH=$PATH:/home/sam/.config/EnergyPlus-8-6-0/
    export PATH=$PATH:/home/sam/.wine/drive_c/Program\ Files\ \(x86\)/Dymola\ 2017\ FD01/bin/
    export PATH=$PATH:/usr/local/go/bin/
    export LPSOLVE=$HOME/.local/lib/lpsolve
    export JAVA_HOME=/usr/bin/
    export SEPARATE_PROCESS_JVM=/usr/bin/
    export SUNDIALS_HOME=/home/sam/temp/sundials-2.7.0/instdir
    export IPOPT_HOME=$HOME/.config/Ipopt
    export JMODELICA_HOME=$HOME/.config/JModelica.org/
	export LD_LIBRARY_PATH="/usr/local/lib64:/usr/local/lib:$LD_LIBRARY_PATH:$LPSOLVE"
	export OPENTHREADS_INC_DIR="/usr/local/include"
	export OPENTHREADS_LIB_DIR="/usr/local/lib64:/usr/local/lib"
	export PATH="$OPENTHREADS_LIB_DIR:$PATH"
    export OPENMODELICAHOME=/home/sam/temp/OpenModelica/build/
    export PATH=$PATH:$OPENMODELICAHOME:$OPENMODELICAHOME/bin/
    source /home/sam/.local/bin/virtualenvwrapper.sh
    source $HOME/.virtualenvs/py3/bin/activate
    source $HOME/.virtualenvs/py3/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
    . /home/sam/.config/torch/install/bin/torch-activate

    
fi

# Path ------------------------------------------------------------


if [ "$OS" = "linux" ] ; then

fi

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi


#source $HOME/.zshrc
