require_relative 'bitmap'
require 'pp'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      parts = line.strip.split
      cmd, *args = parts
      map_commands(cmd, args)
    end
  end

  def map_commands(cmd, args)
    puts cmd
    pp args
  end
end
