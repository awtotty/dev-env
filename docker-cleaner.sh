sudo docker rm $( sudo docker ps -q -f status=exited )
sudo docker rmi $( sudo docker images -q -f dangling=true )
