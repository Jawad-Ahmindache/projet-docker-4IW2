#!/bin/sh
composer install
composer dump-autoload
composer require symfony/maker-bundle --dev
composer require symfony/orm-pack
composer require doctrine/doctrine-fixtures-bundle --dev