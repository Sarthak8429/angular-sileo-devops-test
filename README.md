Step1: Install Docker on ubuntu machine
https://docs.docker.com/engine/install/

Step2: create nginx.conf and Dockerfile

Step3: Build image
sudo docker build -t ui-app:latest .

Step4: Run Container
sudo docker run -d -p 80:80 ui-app:latest
