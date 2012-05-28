#!/usr/bin/env ruby

require 'mysql2'
require 'date'
require_relative 'dbsetup'

# Get the information from the database
connection = Mysql2::Client.new(:host => DB_SERVER, :username => DB_USERNAME, :password => DB_PASSWORD, :database=> DB_DATABASE)
results = connection.query("SELECT `id`, `sourcefile`,`filetype` FROM `analytics`.`trackings` WHERE `importqueue` is not null AND `importstart` IS NULL")

results.each do |row|
  @filename = row['sourcefile']
  @id = row['id']
  
  # update the log with started status
  connection1 = Mysql2::Client.new(:host => DB_SERVER, :username => DB_USERNAME, :password => DB_PASSWORD, :database=> DB_DATABASE)
  connection1.query("UPDATE `analytics`.`trackings` SET `importstart` = '#{Time.now.utc}' WHERE `id` = #{@id}")
  connection1.close
  
  # import the file
  connection2 = Mysql2::Client.new(:host => DB_SERVER, :username => DB_USERNAME, :password => DB_PASSWORD, :database=> DB_DATABASE)
  connection2.query("LOAD DATA INFILE '#{@filename}' INTO TABLE `analytics`.`address_information` FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\\n' IGNORE 1 LINES (`zipcode`, `zipplus4`, `deliverypointcode`, `entityid`)")
  connection2.close
  
  # update the log with completed status
  connection3 = Mysql2::Client.new(:host => DB_SERVER, :username => DB_USERNAME, :password => DB_PASSWORD, :database=> DB_DATABASE)
  connection3.query("UPDATE `analytics`.`trackings` SET `importcomplete` = '#{Time.now.utc}' WHERE `id` = #{@id}")
  connection3.close 
end

connection.close




# 
# username = 'bryanschoeff'
# password = '10faba96'
# source = 'ftp://deathandhaxes.com/schoeff.org/bryan/data/source.xml'
# destination = '/tmp/source.xml'
# 
# ##result = system "curl -I -u #{username}:#{password} #{source}" #" > #{destination}"
# system "curl -u #{username}:#{password} #{source} > #{destination}"
