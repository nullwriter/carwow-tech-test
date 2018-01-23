require_relative 'custom_exceptions'

class Bitmap

	def initialize(columns, rows, colour = '0')
		@columns = columns
		@rows = rows
		@default_colour = colour
		@bitmap = create_bitmap
	end

	def [](row, column)
		@bitmap[row.to_i - 1][column.to_i - 1] || raise(OutOfBoundsPixel)
	end

	def []=(row, column, value)
		(@bitmap[row.to_i - 1][column.to_i - 1] = value || raise(OutOfBoundsPixel))
	end

	private

	def create_bitmap
		Array.new(@rows) { 
			Array.new(@columns){ @default_colour } 
		}
	end
end