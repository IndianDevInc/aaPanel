

RUN apt-get update && \
  apt-get upgrade -y && \
  apt install sudo && \ 
  sudo apt-get -y install systemctl && \
  apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
  apt update -y && \
  apt install -y docker-ce 
  

EXPOSE 80

COPY . /
RUN chmod +x /start.sh
CMD ["docker run -d -p 8886:8888 -p 22:21 -p 443:443 -p 80:80 -p 889:888 -v ~/website_data:/www/wwwroot -v ~/mysql_data:/www/server/data -v ~/vhost:/www/server/panel/vhost aapanel/aapanel:lib"]
