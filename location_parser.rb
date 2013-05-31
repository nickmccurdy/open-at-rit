require 'nokogiri'
require 'open-uri'

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
