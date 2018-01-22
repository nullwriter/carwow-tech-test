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
