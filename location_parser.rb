require 'nokogiri'
require 'open-uri'

# Old parser

module LocationParser

  extend self

  @pages = {
    normal: 'http://www.rit.edu/fa/diningservices/content/hours-operation',
    commencement: 'http://www.rit.edu/fa/diningservices/node/272',
    spring_to_summer: 'http://www.rit.edu/fa/diningservices/node/273',
    summer: 'http://www.rit.edu/fa/diningservices/node/274',
    summer_to_fall: 'http://www.rit.edu/fa/diningservices/node/275'
  }

  def locations page=:normal
    doc = Nokogiri::HTML open @pages[page]
    doc.css('.field-item h3').map{ |location| location.content.strip }
  end

end

p LocationParser.locations

# New parser (based off of https://gist.github.com/toroidal-code/6235807)

def next_node_with(current, attribute, cond)
  while current && current.send(attribute) != cond
    current = current.next
  end
  current
end

doc = Nokogiri::HTML(open('http://www.rit.edu/fa/diningservices/content/hours-operation'))
doc.css('h3 a').each do |node|
  if node.content == "" && node['id'] == node['name']
    puts node
    table =  next_node_with(node.parent, :name, "table")
    rows =  table.search('tr')[1..-1]
    details = rows.collect do |row|
      row.search('td//text()').collect{|text|  text.to_s.strip}
    end
    puts details
  end
end
