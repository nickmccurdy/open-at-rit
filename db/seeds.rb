# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'open-uri'
require 'yaml'

# Based off of https://gist.github.com/toroidal-code/6235807

module LocationParser

  extend self

  @pages = {
    normal: 'http://www.rit.edu/fa/diningservices/content/hours-operation',
    commencement: 'http://www.rit.edu/fa/diningservices/node/272',
    spring_to_summer: 'http://www.rit.edu/fa/diningservices/node/273',
    summer: 'http://www.rit.edu/fa/diningservices/node/274',
    summer_to_fall: 'http://www.rit.edu/fa/diningservices/node/275'
  }

  def locations(page = :normal)
    doc = Nokogiri.HTML open @pages[page]
    #doc.css('.field-item h3').map{ |location| location.content.strip }
    doc.css('h3 a').map do |node|
      if node.content == '' && node['id'] == node['name']
        name = node.next.to_s
        table =  next_node_with(node.parent, :name, 'table')
        rows =  table.search('tr')[1..-1]
        details = rows.map do |row|
          row.search('td//text()').map { |text|  text.to_s.strip }
        end
        [name, details]
      end
    end.compact
  end

  private

  def next_node_with(current, attribute, cond)
    while current && current.send(attribute) != cond
      current = current.next
    end
    current
  end

end

locations = LocationParser.locations
puts locations.to_yaml
#Location.create! locations
