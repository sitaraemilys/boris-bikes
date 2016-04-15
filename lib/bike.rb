

class Bike
attr_accessor :working

	def initialize
		@working = true
	end

def broken
	#	!(self.working?)
	@working = false
	self
end

end
