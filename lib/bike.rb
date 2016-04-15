

class Bike
attr_accessor :working

	def initialize
		@working = true
	end

def broken
#	!(self.working?)
	if @working == true
		@working = false
	end

end

end
