#!/bin/bash

echo "1. Affichez le nombre d'attributs par document ainsi que l'attribut name. Combien y a-t-il d'attribut par document ? N'affichez que les 12 premières lignes avec la commande head (notebook #2)."
jq '.[] | length, .name' people.json | head -12
echo "Commande : jq '.[] | length, .name' people.json | head -12"
echo "Réponse : Il y a 17 attributs par document."
echo -e "\n---------------------------------\n"


echo "2. Combien y a-t-il de valeur "unknown" pour l'attribut "birth_year" ? Utilisez la commande tail afin d'isoler la réponse."
jq 'map(select(.birth_year=="unknown")) | length' people.json
echo "Commande : jq 'map(select(.birth_year=="unknown")) | length' people.json"
echo "Réponse : 42 documents ont un attribut birth_year valant unknown, et il n'est pas nécessaire d'utiliser tail pour répondre à cette question proprement"
echo -e "\n---------------------------------\n"

echo "3. Affichez la date de création de chaque personnage et son nom. La date de création doit être de cette forme : l'année, le mois et le jour. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)"
jq '.[] | (.created | sub("\\.\\d+Z$"; "Z") | fromdate | strftime("%d/%m/%y")), .name' people.json | head -10
echo "Commande : jq '.[] | (.created | sub("\\.\\d+Z$"; "Z") | fromdate | strftime("%d/%m/%y")), .name' people.json | head -10"
echo -e "\n---------------------------------\n"

echo "4. Certains personnages sont nés en même temps. Retrouvez toutes les pairs d'ids (2 ids) des personnages nés en même temps."
jq 'group_by(.birth_year) | map(select(length == 2)) | map({date: .[0].birth_year, character_ids: map(.id)})' people.json
echo "Commande : jq 'group_by(.birth_year) | map(select(length == 2)) | map({date: .[0].birth_year, character_ids: map(.id)})' people.json"
echo -e "\n---------------------------------\n"

echo "5. Renvoyez le numéro du premier film (de la liste) dans lequel chaque personnage a été vu suivi du nom du personnage. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)"
jq -r '.[] | (.films[0] | .[-2:-1]) as $film_char | .name as $character_name | "\($film_char) - \($character_name)"' people.json | head -n 10
echo "Commande : jq -r '.[] | (.films[0] | .[-2:-1]) as $film_char | .name as $character_name | "\($film_char) - \($character_name)"' people.json | head -n 10"
echo -e "\n---------------------------------\n"