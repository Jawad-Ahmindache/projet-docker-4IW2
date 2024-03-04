#!/bin/bash
sleep 3
if [ ! -d "./src" ]; then
    echo "Le répertoire 'src' n'existe pas. Création d'un nouveau projet Symfony..."
    symfony new . --webapp
else
    echo "Le répertoire 'src' existe déjà."
fi
php bin/console d:d:d --force
php bin/console d:d:c
php bin/console make:migration
php bin/console doctrine:migrations:migrate
sleep 2
php bin/console doctrine:fixtures:load
symfony server:start --no-tls --port=8000 --daemon
tail -f /dev/null
