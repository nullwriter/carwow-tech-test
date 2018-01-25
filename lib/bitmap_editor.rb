require_relative 'bitmap'
require_relative 'custom_exceptions'
require_relative 'draw_bitmap_command'
require_relative 'fill_pixel_command'
require_relative 'vertical_fill_command'
require_relative 'horizontal_fill_command'
require_relative 'clear_bitmap_command'
require_relative 'show_bitmap_command'
require 'pp'

class BitmapEditor

  def initialize(file)
    raise BitmapCommandFileNotFound if file.nil? || !File.exists?(file)
    @commands = []
    map_commands(file)
  end

  def run
    @commands.inject(nil) do |bitmap, command|
      command.process(bitmap)
    end
  end

  private

  def map_commands(file)
    File.open(file).each do |line|
      line = line.chomp
      next if line.empty?

      parts = line.strip.split
      cmd, *args = parts
      @commands << (command_list[cmd.upcase].new(args) || raise(CommandNotFound))
    end
  end

  def command_list
    {
      'I' => DrawBitmapCommand,
      'C' => ClearBitmapCommand,
      'L' => FillPixelCommand,
      'V' => VerticalFillCommand,
      'H' => HorizontalFillCommand,
      'S' => ShowBitmapCommand
    }
  end
end
