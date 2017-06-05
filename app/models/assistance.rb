
class Assistance < ApplicationRecord
  belongs_to :user

  
  def self.import(file)
  		CSV.foreach(file.path, headers: true) do |row|
  		Assistance.create! row.to_hash	
  	end
  	
  end

  def calculate(one)
  	if one.month ==	Time.now.month
	  	if User.find(one.user_id).work == "Hour"
	  		if User.find(one.user_id).position == "Jefe"
	  		salary = one.hours_worked * 60
	  		else
	  		salary = one.hours_worked * 35

	  		end	
	  	else
	  		if User.find(one.user_id).position =="Jefe"
	  		salary = 20000
	  		else
	  		salary = 14000
	  		end 
	  	end
	 end
  end
end
