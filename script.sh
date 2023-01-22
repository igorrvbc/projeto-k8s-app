#!/bin/bash

echo "criando as imagens..."

docker build -t igorrvbc/projeto-backend:1.0 backend/.
docker build -t igorrvbc/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push igorrvbc/projeto-backend:1.0
docker push igorrvbc/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Realizando o deployment..."

kubectl apply -f ./deployment.yml