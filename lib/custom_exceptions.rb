class CommandNotFound < StandardError
  def initialize(msg="Unidentified command was supplied.")
    super
  end
end

class BitmapCommandFileNotFound < StandardError
  def initialize(msg="Bitmap command file was not found.")
    super
  end
end

class OutOfBoundsPixel < StandardError
  def initialize(msg="Bitmap command attemped to access a non existent pixel.")
    super
  end
end

class IncompleteCommand < StandardError
	def initialize(msg="Can't process an incomplete Bitmap command.")
		super
	end
end

class IncorrectParameter < StandardError
	def initialize(msg="Incorrect type of parameter was found in the command.")
		super
	end
end
