require_relative 'custom_exceptions'

class Bitmap

	attr_reader :columns, :rows, :bitmap

	def initialize(columns, rows, colour = '0')
		@columns = columns.to_i
		@rows = rows.to_i
		@default_colour = colour
		@bitmap = create_bitmap
	end

	def [](row, column)
		@bitmap[row.to_i - 1][column.to_i - 1] || raise(OutOfBoundsPixel)
	end

	def []=(row, column, value)
		(@bitmap[row.to_i - 1][column.to_i - 1] = value || raise(OutOfBoundsPixel))
	end

	def get
		bitmap
	end

	private

	def create_bitmap
		Array.new(@rows) { 
			Array.new(@columns){ @default_colour } 
		}
	end
end