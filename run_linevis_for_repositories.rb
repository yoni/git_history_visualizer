#!/usr/bin/env ruby
require 'open-uri'
require 'json'

# JSON file of repositories. See get_all_repositories.rb
repositories_file = ARGV[0]
pattern = ARGV[1]
path = ARGV[2]


repositories = JSON.parse(open(repositories_file).read)
selected_repositories = repositories.select{|repository| repository['name'] =~ /#{pattern}/ }

selected_repositories.each{|repository|
  name = repository['name']
  full_path = File.join(path, name)
  Dir.mkdir(full_path)
  puts "Running linevis for repository: #{ name }"
  `run.sh #{ repository['html_url'] } #{ full_path }`
}
