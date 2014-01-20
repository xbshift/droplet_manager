#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'json'
require 'dotenv'
require 'httparty'

Dotenv.load("droplet.env")

CLIENT_ID   = ENV['CLIENT_ID']
API_KEY     = ENV['API_KEY']
DROPLET_ID  = ENV['DROPLET_ID']

class Droplet
  include HTTParty
  format :json

  base_uri 'https://api.digitalocean.com'

  def initialize
    @client_id = ENV['CLIENT_ID']
    @api_key = ENV['API_KEY']
    @droplet_id = ENV['DROPLET_ID']
  end

  def self.id
    get("/droplets/#{DROPLET_ID}?client_id=#{CLIENT_ID}&api_key=#{API_KEY}")
  end

  def self.status
    Droplet.id['droplet']['status']
  end

  def self.reboot
    post("/droplets/#{DROPLET_ID}/reboot/?client_id=#{CLIENT_ID}&api_key=#{API_KEY}")
  end

  def self.power_cycle
    post("/droplets/#{DROPLET_ID}/power_cycle/?client_id=#{CLIENT_ID}&api_key=#{API_KEY}")
  end

  def self.shutdown
    post("/droplets/#{DROPLET_ID}/shutdown/?client_id=#{CLIENT_ID}&api_key=#{API_KEY}")
  end
  
  def self.poweroff
    post("/droplets/#{DROPLET_ID}/power_off/?client_id=#{CLIENT_ID}&api_key=#{API_KEY}")
  end

  def self.poweron
    post("/droplets/#{DROPLET_ID}/power_on/?client_id=#{CLIENT_ID}&api_key=#{API_KEY}")
  end

  def self.snapshot
    post("/droplets/#{DROPLET_ID}/snapshot/?name=#{Time.now.strftime('%m_%d_%Y')}&client_id=#{CLIENT_ID}&api_key=#{API_KEY}")
  end

  def self.snapshots
    Droplet.id['droplet']['snapshots']
  end

  def self.destroy
    post("/droplets/#{DROPLET_ID}/destroy/?client_id=#{CLIENT_ID}&api_key=#{API_KEY}")
  end
end