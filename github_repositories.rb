#!/usr/bin/env ruby
require 'open-uri'
require 'json'

@host = ARGV[0]
@user = ARGV[1]

repositories = []

def url(page)
  "https://#{@host}/api/v3/users/#{@user}/repos?page=#{page}"
end

page = 1
until (page_repositories = JSON.parse(open(url(page)).read)).empty?
  repositories += page_repositories
  page += 1
end

puts repositories.to_json
