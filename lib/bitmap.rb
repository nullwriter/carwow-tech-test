class Bitmap

	def initialize(columns, rows, colour = '0')
		@columns = columns
		@rows = rows
		@default_colour = colour
		@bitmap = create_bitmap
	end

	def create_bitmap()
		Array.new(@rows, Array.new(@columns){ @default_colour })
	end
end