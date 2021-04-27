FROM codercom/code-server
USER root
#RUN sudo apt-get install wget
RUN curl https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb > packages-microsoft-prod.deb
RUN sudo dpkg -i packages-microsoft-prod.deb
RUN sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0 aspnetcore-runtime-5.0
 
# angular.io
# 1. node/npm
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN sudo bash nodesource_setup.sh
RUN sudo apt-get -y install nodejs

RUN npm install -g @angular/cli
RUN npm install -g @ionic/cli

# install extensions
RUN code-server --install-extension ms-dotnettools.csharp

# git settings
RUN   git config --global user.email "ekwav@coflnet.com" &&  git config --global user.name "Äkwav"

EXPOSE 5000
EXPOSE 5001
EXPOSE 4200
EXPOSE 8080
EXPOSE 8081

USER coder

# dotnet tools
RUN dotnet tool install --global dotnet-ef
ENV PATH $PATH:/home/coder/.dotnet/tools
