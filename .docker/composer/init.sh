#!/bin/sh
composer install
composer dump-autoload
composer require doctrine/doctrine-fixtures-bundle --dev