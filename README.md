# Continuous Delivery game

How to generate :
```
docker build -t card-builder .
docker run -it --rm --name card-builder card-builder bash
  rake verso
docker cp card-builder:/usr/src/app/_verso/cards_fr-verso.pdf cards_fr-verso.pdf
```
