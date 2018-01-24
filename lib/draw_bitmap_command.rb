require_relative "bitmap"
require_relative "bitmap_command"

class DrawBitmapCommand < BitmapCommand

	def process(bitmap)
		verify_parameters
		Bitmap.new(args[0].to_i, args[1].to_i)
	end

	def verify_parameters
		raise IncompleteCommand if not (args[0] && args[1])
		raise IncorrectParameter if not (is_number?(args[0]) && is_number?(args[1]))
		raise OutOfBoundsPixel if args[1].to_i < 0 || args[0].to_i < 0
	end

end