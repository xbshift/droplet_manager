# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
	s.name = 'droplet_manager'
	s.version = '0.0.0'
	s.summary = 'Droplet Manager for Digital Ocean'
	s.description = 'A gem for managing a Digital Ocean droplet from the Interactive Ruby Shell'
	s.authors = ["Digital Ocean"]
	s.email = ["digitalocean@digitalocean.com"]
	s.files = ["lib/droplet_manager.rb"]
	s.homepage = 'https://rubygems.org/gems/droplet_manager'

	s.add_dependency 'json', '~> 0'
	s.add_dependency 'dotenv', '~> 0'
	s.add_dependency 'httparty', '~> 0'
end
