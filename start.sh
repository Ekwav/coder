docker stop coder;
docker rm coder;

docker run -it -p 127.0.0.1:4080:8080 -p 127.0.0.1:5001:5001 -p 127.0.0.1:5000:5000 \
 -v  "$HOME/.config:/home/coder/.config" \
 -v "$PWD:/home/coder/project" \
 -u "$(id -u):$(id -g)" \
 -d --name coder  coder:latest
