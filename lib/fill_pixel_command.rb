require_relative "bitmap"
require_relative "bitmap_command"

class FillPixelCommand < BitmapCommand

	def process(bitmap)
		bitmap[args[1], args[0]] = args[2]
		bitmap
	end

end