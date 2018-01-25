require_relative 'bitmap_command'
require_relative 'fill_pixel_command'

class HorizontalFillCommand < BitmapCommand

	def process(bitmap)
		verify_parameters(bitmap)

		(from_column..to_column).each do |column|
			FillPixelCommand.new([column, row, colour]).process(bitmap)
		end

		bitmap
	end

	def from_column
		args[0]
	end

	def to_column
		args[1]
	end

	def row
		args[2]
	end

	def colour
		args[3]
	end

	def verify_parameters(bitmap)
		super
		raise IncompleteCommand if not (args[0] && args[1] && args[2] && args[3])
		raise IncorrectParameter if not (is_number?(args[0]) && is_number?(args[1]) && is_number?(args[2]))
		# from_column must be lower than to_column
		raise IncorrectParameter if args[0].to_i > args[1].to_i
		raise OutOfBoundsPixel if args[0].to_i > bitmap.columns || args[1].to_i > bitmap.columns || args[2].to_i > bitmap.rows
		raise OutOfBoundsPixel if args[0].to_i < 0 || args[1].to_i < 0 || args[1].to_i < 0
	end
end