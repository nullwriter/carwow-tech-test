require_relative 'bitmap_command'

class ClearBitmapCommand < BitmapCommand

	def process(bitmap)
		verify_parameters(bitmap)
		bitmap = Bitmap.new(bitmap.columns, bitmap.rows)
	end
end