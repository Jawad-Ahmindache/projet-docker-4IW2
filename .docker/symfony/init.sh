#!/bin/bash

if [ ! -d "./src" ]; then
    echo "Le répertoire 'src' n'existe pas. Création d'un nouveau projet Symfony..."
    symfony new app
else
    echo "Le répertoire 'src' existe déjà."
fi

symfony server:start --no-tls --port=8000 --daemon
tail -f /dev/null
