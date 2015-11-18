class ScopeWindow < Gosu::Window
  attr_reader :max_volts, :yscale, :clock, :scope_width
  attr_accessor :display_pins
  def initialize
    super 1024+124,768

    @scope_width = 1023
    self.caption = "Oscilloscope"

    @font = Gosu::Font.new(18)

    @max_volts = 5
    @yscale=(self.height/@max_volts)
    @paused = false

    @center_line = CenterLine.new(self)
    @minmaxtext = MinMaxText.new(self)
    @right_line = RightLine.new(self)
    # @ar = ArduinoReader.new(self)
    @ar = FakeArduinoReader.new(self)
    AnalogInput[0].visible = true
  end

  def button_down(id)
    close if id == Gosu::KbEscape or id == Gosu::KbQ
    @paused = ! @paused if id == Gosu::KbP

    [Gosu::Kb0,Gosu::Kb1,Gosu::Kb2,Gosu::Kb3,Gosu::Kb4,Gosu::Kb5].each_with_index {|b,i|
        AnalogInput[i].visible = ! AnalogInput[i].visible if AnalogInput[i] if id == b
    }

  end

  def update
    return if @paused
    AnalogInput.all.each {|i| i.update }
  end

  def draw
    # Draw interface
    @center_line.draw
    @right_line.draw
    @minmaxtext.draw
    AnalogInput.all.each {|i| i.draw }
  end
end
