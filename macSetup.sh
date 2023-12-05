
#!/bin/bash

start=`date +%s`
bold=$(tput bold)
normal=$(tput sgr0)
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# if test ! $(which gcc); then
#   echo "Installing command line developer tools..."
#   xcode-select --install
# fi

if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install caskroom/cask/brew-cask
    brew tap homebrew/cask-versions
    brew tap homebrew/cask-cask
    brew tap 'homebrew/bundle'
    brew tap 'homebrew/cask'
    brew tap 'homebrew/cask-drivers'
    brew tap 'homebrew/cask-fonts'
    brew tap 'homebrew/core'
    brew tap 'homebrew/services'
    brew tap aws/tap

fi

echo "Updating homebrew..."
brew update
brew upgrade


beginDeploy() {
    echo
    echo "${bold}$1${normal}"
}

############# General Tools #############
beginDeploy "############# General Tools #############"
echo -n "Do you wish to install General Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read General

CaskGeneralToolList=(
    google-chrome
    spotify
)
if [ "$General" != "${General#[Yy]}" ] ;then
    echo Yes
    brew install --cask --appdir="/Applications" ${CaskGeneralToolList[@]}
else
    echo No
fi

############# Python Developer #############
beginDeploy "############# Python Developer #############"
echo -n "Do you wish to install Python Developer Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read PythonDeveloper

PythonDeveloperToolList=(
    pyenv 
    pyenv-virtualenv
    poetry
    isort
    python-yq
)

if [ "$PythonDeveloper" != "${PythonDeveloper#[Yy]}" ] ;then
    echo Yes
    brew install ${PythonDeveloperToolList[@]}
    pyenv install 3.11.4
    pyenv global 3.11.4
else
    echo No
fi


############# Developer Utilities #############
beginDeploy "############# Developer Utilities #############"
echo -n "Do you wish to install Developer Utilities (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read DeveloperUtilities

DeveloperUtilitiesList=(
    tree
    ctop
    jq
    httpie
    yarn
    yarn-completion
    netcat
    nmap
    wget
    go
    nvm
    bash-completion
)
CaskDeveloperUtilitiesList=(
    cheatsheet
    spectacle
    postman
    dotnet-sdk
    wireshark
    iterm2
    maccy
)
if [ "$DeveloperUtilities" != "${DeveloperUtilities#[Yy]}" ] ;then
    
    echo Yes
    brew install ${DeveloperUtilitiesList[@]}
    brew install --cask ${CaskDeveloperUtilitiesList[@]}
else
    echo No
fi


############# Database Tools #############
beginDeploy "############# Database Tools #############"
echo -n "Do you wish to install Database Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read Database


CaskDatabaseToolList=(
    pgadmin4
    azure-data-studio
)
if [ "$Database" != "${Database#[Yy]}" ] ;then
    echo Yes
    brew install --cask ${CaskDatabaseToolList[@]}

else
    echo No
fi


############# IDEs #############
beginDeploy "############# IDEs #############"
echo -n "Do you wish to install IDEs (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read IDEs

CaskIDEsList=(
    visual-studio-code
    android-studio
)
if [ "$IDEs" != "${IDEs#[Yy]}" ] ;then
    echo Yes
    brew install --cask --appdir="/Applications" ${CaskIDEsList[@]}
    cat vscode-extensions.txt | xargs -L1 code --install-extension
else
    echo No
fi


############# DevOps #############
beginDeploy "############# DevOps #############"
echo -n "Do you wish to install DevOps Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read DevOps


DevOpsToolList=(
    #terraform
    #vault
    #consul
    #nomad
    #packer
    #terragrunt
    #ansible
    awscli
    aws-sam-cli
    #kompose
    kubernetes-cli
    podman
)
CaskDevOpsToolList=(
    #vagrant
    #vmware-fusion
    #virtualbox
    docker
    #vagrant-manager
    openlens
)
if [ "$DevOps" != "${DevOps#[Yy]}" ] ;then
    echo Yes
    brew install ${DevOpsToolList[@]}
    brew install --cask ${CaskDevOpsToolList[@]}

    ## DOCKER APP
    wget -P ~/Downloads/ https://github.com/docker/app/releases/download/v0.6.0/docker-app-darwin.tar.gz
    tar -xvf ~/Downloads/docker-app-darwin.tar.gz -C ~/Downloads/
    mv ~/Downloads/docker-app-darwin /usr/local/bin/docker-app
    rm ~/Downloads/docker-app-darwin.tar.gz


    ## Install AWS CLI
    #pip3 --version
    #curl -O https://bootstrap.pypa.io/get-pip.py
    #python3 get-pip.py --user
    #pip3 install awscli --upgrade --user
    aws --version
    #rm get-pip.py


    curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-macos.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    aws2 --version
else
    echo No
fi


############# Productivity Tools #############
beginDeploy "############# Productivity Tools #############"
echo -n "Do you wish to install Productivity Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read Productivity

CaskProductivityToolList=(
    #slack
    #evernote
    the-unarchiver
    dash
    gpg-suite
    microsoft-teams
    microsoft-office
    bitwarden
)
if [ "$Productivity" != "${Productivity#[Yy]}" ] ;then
    echo Yes
    brew install --cask --appdir="/Applications" ${CaskProductivityToolList[@]}
else
    echo No
fi

############# Oh my ZSH #############
beginDeploy "############# Oh my ZSH #############"
echo -n "Do you wish to install Oh my ZSH (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read OhMyZsh

if [ "$OhMyZsh" != "${OhMyZsh#[Yy]}" ] ;then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting    
else
    echo No
fi


############# Mac Application #############
beginDeploy "############# Mac Application #############"
echo -n "Do you wish to install Mac Application (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read MacApplication

MacApplicationToolList=(
    409183694 # Keynote
    409203825 # Numbers
    409201541 # Pages
    497799835 # Xcode
    1450874784 # Transporter
    1274495053 # Microsoft To Do
    1295203466 # Microsoft Remote Desktop 10
    985367838 # Microsoft Outlook
)ß
if [ "$MacApplication" != "${MacApplication#[Yy]}" ] ;then
    brew install mas
    mas install ${MacApplicationToolList[@]}

    echo "######### Save screenshots to ${HOME}/Pictures/Screenshots"
    defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

    echo "######### Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF"
    defaults write com.apple.screencapture type -string "png"

else
    echo No
fi

beginDeploy "############# CLEANING HOMEBREW #############"
brew cleanup

beginDeploy "############# GLOBAL GIT CONFIG #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.gitignore >> ~/.gitignore'
git config --global push.default current
git config --global core.excludesfile ~/.gitignore
git config --global user.name Karolina Chalupova
git config --global user.email chalupova.karolina@gmail.com
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
# aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

beginDeploy "############# ALIASES #############"
beginDeploy "############# GIT ALIASES #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.git_aliases >> ~/.git_aliases'
source ~/.git_aliases

beginDeploy "############# DOCKER ALIASES #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.docker_aliases >> ~/.docker_aliases'
source ~/.docker_aliases

beginDeploy "############# K8s ALIASES #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.kubectl_aliases >> ~/.kubectl_aliases'
source ~/.kubectl_aliases

beginDeploy "############# SETUP ZSH #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.zshrc >> ~/.zshrc'
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.zprofile >> ~/.zprofile'
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.p10k.zsh >> ~/.p10k.zsh'
source ~/.zshrc
source ~/.zprofile


runtime=$((($(date +%s)-$start)/60))
beginDeploy "############# Total Setup Time ############# $runtime Minutes"
