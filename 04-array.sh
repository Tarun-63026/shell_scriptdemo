#!/bin/bash

MOVIES=(
    "The Shawshank Redemption"
    "The Godfather"
    "The Dark Knight"
    "Pulp Fiction"
    "The Lord of the Rings: The Return of the King"
)

echo "First moive name is: ${MOVIES[0]}"
echo "All movies names are: ${MOVIES[@]}"