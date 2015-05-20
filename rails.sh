#!/bin/bash

APPS_PATH=~/work/WeLike

rails_composer() {
	APP_NAME=$1
	RUBY_VERSION=2.2.1
	APP_PATH=$APPS_PATH/$APP_NAME
	COMPOSER_URL=https://raw.github.com/RailsApps/rails-composer/master/composer.rb

	mkdir $APP_PATH
	cd $APP_PATH
	
	rvm use $RUBY_VERSION@$APP_NAME --ruby-version --create
	gem install rails
	
	rails new . -m $COMPOSER_URL
}

alias rc="rails_composer $1"
