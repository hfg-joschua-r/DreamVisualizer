# stopping and deleting all containers:
docker container stop dramvisualizer
docker container rm dramvisualizer



# removing all images:
docker image rm jannes/to_dramvisualizer



cd ..
cd dramvisualizer
docker build . -t jannes/to_dramvisualizer
docker run --rm -d  -p 8080:80/tcp --name dramvisualizer jannes/dramvisualizer:latest 


