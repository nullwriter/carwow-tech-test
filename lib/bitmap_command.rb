class BitmapCommand

	attr_reader :args

	def initialize(args = [])
		@args = args
	end

	def is_number? string
		# handles numbers with commas
		no_commas =  string.gsub(',', '')
		matches = no_commas.match(/-?\d+(?:\.\d+)?/)
		(!matches.nil? && matches.size == 1 && matches[0] == no_commas)
	end
	
end