FROM nginx
RUN apt-get update -y
RUN apt-get install -y wget unzip
RUN wget https://github.com/inkle/ink/releases/download/v1.0.0/inklecate_linux.zip
RUN unzip inklecate_linux.zip

# Drop cache hack - we have cheap rebuilds yet
ENV DROP_CACHE=$(date)
COPY browser_with_server /usr/share/nginx/html
COPY src src
RUN ./inklecate -o story.json src/root.ink
RUN mv story.json /usr/share/nginx/html/
