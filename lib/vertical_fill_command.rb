require_relative "bitmap_command"
require_relative 'fill_pixel_command'

class VerticalFillCommand < BitmapCommand

	def process(bitmap)
		verify_parameters(bitmap)

		(from_row..to_row).each do |row|
			FillPixelCommand.new([column, row, colour]).process(bitmap)
		end
		
		bitmap
	end

	def column
		args[0]
	end

	def from_row
		args[1]
	end

	def to_row
		args[2]
	end

	def colour
		args[3]
	end

	def verify_parameters(bitmap)
		raise IncompleteCommand if not (args[0] && args[1] && args[2] && args[3])
		raise IncorrectParameter if not (is_number?(args[0]) && is_number?(args[1]) && is_number?(args[2]))
		# from_row must be lower than to_row
		raise IncorrectParameter if args[1].to_i > args[2].to_i
		raise OutOfBoundsPixel if args[0].to_i > bitmap.columns || args[1].to_i > bitmap.rows || args[2].to_i > bitmap.rows
		raise OutOfBoundsPixel if args[0].to_i < 0 || args[1].to_i < 0 || args[1].to_i < 0
	end

end