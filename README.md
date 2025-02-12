# **Mac Setup for Developers**
Set of Scripts and Documentation to setup Mac as Development Environment


# **SSH setup**
```
mkdir ~/.ssh 
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/ssh-config >> ~/.ssh/config'
ssh-keygen -t ed25519 -C "your_email@example.com" # nagenerovat ke vsem uctum z configu a ulozit pod ~/.ssh/ed25519_<SUFFIX> se suffixem podle configu
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519_<SUFFIX> # pro vsechny ucty z configu
pbcopy < ~/.ssh/id_ed25519_<SUFFIX>.pub # pridat SSH klic v githubim Profile -> Settings -> SSH
```
# **XCode**
```
xcode-select --install
```

# **Clone this repo**
```
mkdir ~/Projects
cd ~/Projects
mkdir personal
cd personal
git clone git@github.com-personal:karolinachalupova/developer-mac-setup.git
```

# **Prerequisite**
- Comment/Uncomment tools in the macSetup.sh script per your need.

# **Make sure Script has Execution Permission**
```
cd ~/Projects/personal/developer-mac-setup
chmod +x macSetup.sh
```
```
sudo chown kaja /usr/local/bin/
```

# **Execute Script to begin Setup**
```
yes | ./macSetup.sh
```

# **Terminal font**
```
yes | p10k configure
```
The font downloads automatically. 

# **Manual steps**
- select terminal Solarized Dark color preset: Iterm2 -> Settings -> Profiles -> Colors -> Color Presets ->  Solarized Dark
- enable infinite scrolling in terminal: Iterm2 -> Settings -> Profiles -> Terminal -> Unlimited scrollback
- add statusbar to terminal: Iterm2 -> Settings -> Profiles -> Sesstion -> Status bar enabled -> Configure Status Bar
- turn off keyboard typing auto-corrections -> System Preferences -> Keyboard Settings -> Text Input -> Edit -> vsecko povypinat
- mkdir ~/Pictures/Screenshots # automaticky se tam budou ukladat

## **General Configurations & Aliases**
- [x] Git Config
- [x] Global Git Ignore
- [x] Mac Screenshot Config
- [x] Git Aliases
- [x] Docker Aliases
- [x] K8s Aliases

## **Install Browsers**
- [x] [Google Chrome](https://www.google.com/chrome/)
- [ ] [Google Chrome Canary](https://www.google.com/chrome/canary/)
- [x] [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [ ] [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/)

## **Install HashiCorp Tools**
- [x] [Terraform](https://www.terraform.io)
- [x] [Vault](https://www.vaultproject.io)
- [x] [Consul](https://www.consul.io)
- [x] [Packer](https://www.packer.io)
- [x] [Nomad](https://www.nomadproject.io)
- [x] [Vagrant](https://www.vagrantup.com)

## **Install Virtualization Tools**
- [x] [VMWare Fusion](https://www.vmware.com/products/fusion.html)
- [x] [Oracle Virtualbox](https://www.virtualbox.org)
- [x] [Docker](https://www.docker.com)
- [x] [Vagrant Manager](http://vagrantmanager.com)


## **Install IDEs (Intellij, Visual Studio, Visual Studio Code, Android Studio)**
- [x] [Intellij](https://www.jetbrains.com/idea/)
- [x] [Visual Studio](https://visualstudio.microsoft.com)
- [x] [Visual Studio Code](https://code.visualstudio.com)
- [x] [Android Studio](https://developer.android.com/studio)


# **Install important Visual Studio Code Extensions**
If you want to add any new extension besides all the ones listed below then update vscode-extensions.txt before executing script.
- [x] [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [x] [GitHub](https://marketplace.visualstudio.com/items?itemName=KnisterPeter.vscode-github)
- [x] [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)
- [x] [Quokka.js](https://marketplace.visualstudio.com/items?itemName=WallabyJs.quokka-vscode)
- [x] [Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer)
- [x] [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
- [x] [Terraform](https://marketplace.visualstudio.com/items?itemName=mauve.terraform)
- [x] [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [x] [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)
- [x] [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [x] [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
- [x] [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [x] [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [x] [open-in-browser](https://marketplace.visualstudio.com/items?itemName=techer.open-in-browser)
- [x] [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [x] [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [x] [Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)
- [x] [Polacode](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)
- [x] [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
- [x] [Paste JSON as Code](https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype)
- [x] [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)
- [x] [npm](https://marketplace.visualstudio.com/items?itemName=eg2.vscode-npm-script)
- [x] [Regex Previewer](https://marketplace.visualstudio.com/items?itemName=chrmarti.regex)
- [x] [Git History](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)
- [x] [AWS Toolkit for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=AmazonWebServices.aws-toolkit-vscode)
- [x] [C#](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp)


## **Install AWS Tools**
- [x] [AWS CLI](https://aws.amazon.com/cli/)
- [x] [SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)


## **Install Developer Utilities**
- [x] [SDKMan](https://sdkman.io)
- [x] [Spectacle](https://www.spectacleapp.com)
- [x] [Tree]()
- [x] [Ctop](https://ctop.sh)
- [x] [jq](https://stedolan.github.io/jq/)
- [x] [Postman](https://www.getpostman.com)
- [x] [httpie](https://httpie.org)
- [x] [NVM](https://github.com/nvm-sh/nvm)
- [x] [Bash Completion](https://github.com/scop/bash-completion)

## **Install Language SDKs/Platforms**
- [x] [Dotnet SDK](https://dotnet.microsoft.com/download)
- [x] [Go](https://golang.org)


## **Install Database Tools**
- [x] [PGAdmin](https://www.pgadmin.org)
- [x] [Mongo Studio 3T](https://studio3t.com)


## **Install Productivity Tools**
- [x] [Slack](https://slack.com)
- [x] [Evernote](https://evernote.com)
- [x] [The Unarchiver](https://theunarchiver.com)
- [x] [CheatSheet](https://mediaatelier.com/CheatSheet/)
- [x] [Adobe Creative Cloud](https://www.adobe.com/creativecloud.html)


# **Resources**
- [MAC OSX BASH PROFILE](https://natelandau.com/my-mac-osx-bash_profile/)
- [New MacBook Setup for Developers by Dan Vega](https://dev.to/therealdanvega/new-macbook-setup-for-developers-2nma)
