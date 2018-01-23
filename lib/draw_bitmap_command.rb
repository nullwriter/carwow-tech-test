require_relative "bitmap"
require_relative "bitmap_command"

class DrawBitmapCommand < BitmapCommand

	def process(bitmap)
		Bitmap.new(args[0].to_i, args[1].to_i)
	end

end