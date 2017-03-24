class User
	attr_accessor  :email , :first , :last
	
	def initialize(attributes = {})
		@first_name = attributes[:first]
		@last_name = attributes[:last]
		@email = attributes[:email]
	end
	
	def full_name
		"#{@first_name} #{@last_name}"
	end

	def alphabetical_name 
		"#{@last_name} , #{@first_name}"
	end

	def formatted_email
		full_name + " <#{@email}>"
	end
end