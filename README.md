# Build

\# cd goploader-docker && docker build . -t goploader

# Run

## On docker host

\# docker volume create goploader-data  
\# docker volume create goploader-conf  
cat << EOF > /var/lib/docker/volumes/goploader-conf/_data/conf.yml  
name_server: goploader.docker  
host: 0.0.0.0  
port: 8080  
append_port: false  
serve_https: false  
ssl_cert: ""  
ssl_private_key: ""  
upload_dir: /home/goploader/files  
db: goploader.db  
uniuri_length: 10  
key_length: 16  
size_limit: 1000  
disk_quota: 50  
loglevel: error  
stats: true  
sensitive_mode: false  
no_web: false  
fulldoc: true  
always_download: false  
disable_encryption: false  
EOF  

\# docker run -p 80:8080 -v goploader-data:/home/goploader/files -v goploader-conf:/home/goploader/conf goploader

## On your client host (with your own docker host ip address)

\# echo "goploader.docker 192.168.122.228" >> /etc/hosts
