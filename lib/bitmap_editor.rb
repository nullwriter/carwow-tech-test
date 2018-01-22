require_relative 'bitmap'
require_relative 'custom_exceptions'
require 'pp'

class BitmapEditor

  def initialize(file)
    raise BitmapCommandFileNotFound if file.nil? || !File.exists?(file)
    @commands = []
    map_commands(file)
  end

  def run
    @commands.each do |command, bitmap|
      puts command
    end
  end

  private

  def map_commands(file)
    File.open(file).each do |line|
      line = line.chomp
      next if line.empty?

      parts = line.strip.split
      cmd, *args = parts
      @commands << (command_list[cmd] || raise(CommandNotFound))
    end
  end

  def command_list
    {
      'I' => 'I',
      'C' => 'C',
      'L' => 'L',
      'V' => 'V',
      'H' => 'H',
      'S' => 'S'
    }
  end

end
