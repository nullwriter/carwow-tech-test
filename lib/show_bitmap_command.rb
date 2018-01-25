require_relative 'bitmap_command'

class ShowBitmapCommand < BitmapCommand

	def process(bitmap)
		verify_parameters(bitmap)

		bitmap.get.each do |row|
			puts row.join
		end
	end
end