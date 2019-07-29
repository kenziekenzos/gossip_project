require 'csv'

class Gossip
 attr_accessor :author, :content, :id
 
    def initialize (author, content, id)
        @author=author
        @content=content
        @id=id
    end 

    def save
        CSV.open("./lib/db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
    end

    def self.all
        all_gossips = []
        CSV.read("./lib/db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
     return all_gossips
    end
 end