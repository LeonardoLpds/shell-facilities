#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && \
source $HOME/.bashrc && \
nvm install node && \
npm uninstall -g @angular-cli && \
npm install -g @angular/cli@latest
