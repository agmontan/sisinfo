
class Assistance < ApplicationRecord
  belongs_to :user

  
  def self.import(file)
  		CSV.foreach(file.path, headers: true) do |row|
  		Assistance.create! row.to_hash	
  	end
  	
  end
end
