module API
	class AppV3 < Grape::API
		version :v3, using: :param

    helpers do 
    	def log
    	  AppV3.logger 
    	end
    end

    before do 
      log.warn "Parameters: #{params}" 
      log.warn "Route info: #{route}"
require "pry"; binding.pry
    end
		
		get "/" do
		  "Thank you." 
		end
	end
end
