require_relative 'bitmap_command'

class ShowBitmapCommand < BitmapCommand

	def process(bitmap)
		verify_parameters(bitmap)

		string_bitmap = ''
		(bitmap.rows).times do |row|
			(bitmap.columns).times do |column|
				string_bitmap += bitmap[row, column].to_s
			end
			string_bitmap += "\n"
		end

		puts string_bitmap
	end
end