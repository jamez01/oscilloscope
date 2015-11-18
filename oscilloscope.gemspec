Gem::Specification.new do |g|
  g.name = "oscilloscope"
  g.version = "0.1.1"
  g.date = "2015-11-18"
  g.summary = "Osilloscope"
  g.description = "A poor man oscilloscope using ruby and an arduino."
  g.authors = ["James Paterni"]
  g.email = "james@ruby-code.com"
  g.add_runtime_dependency 'gosu', "~> 0.10.4"
  g.add_runtime_dependency 'arduino_firmata', "~> 0.3.7"
  g.files = %w{lib/analog_input.rb  lib/arduino_reader.rb  lib/display.rb  lib/oscilloscope.rb  lib/window.rb bin/oscilloscope}
  g.bindir = 'bin'
  g.executables << 'oscilloscope'
end
