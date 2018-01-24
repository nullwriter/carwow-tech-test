require_relative "bitmap_command"
require_relative 'custom_exceptions'

class FillPixelCommand < BitmapCommand

	def process(bitmap)
		verify_parameters(bitmap)
		bitmap[args[1], args[0]] = args[2]
		bitmap
	end

	def verify_parameters(bitmap)
		raise IncompleteCommand if not (args[2] && args[1] && args[0])
		raise IncorrectParameter if not (is_number?(args[1]) && is_number?(args[0]))
		raise OutOfBoundsPixel if args[0].to_i > bitmap.columns || args[1].to_i > bitmap.rows
		raise OutOfBoundsPixel if args[1].to_i < 0 || args[0].to_i < 0
	end

end