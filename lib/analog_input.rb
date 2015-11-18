class AnalogInput
  attr_reader :data, :pin, :value, :window
  attr_accessor :visible

  COLORS = [Gosu::Color::GREEN,Gosu::Color::CYAN,Gosu::Color::YELLOW,Gosu::Color::FUCHSIA,Gosu::Color::BLUE,Gosu::Color::WHITE,Gosu::Color::GRAY]

  def self.[](p)
    i=@@inputs.select {|x| x.pin == p }.first
    return i || nil
  end

  def self.all
    @@inputs ||= []
    @@inputs
  end

  def initialize(args={})
    @@inputs ||=[]

    @window = args[:window]
    @pin = args[:pin]
    @data = []
    @value = 0
    @visible = args[:visible]||false
    @font_large ||= Gosu::Font.new(30)
    @font_small ||= Gosu::Font.new(20)
    @yscale = @window.yscale
    @height = @window.height

    @@inputs << self
  end

  def callback(v)
    @value = v
  end

  def update
    @data.shift if @data.count > (@window.scope_width / @window.update_interval)
    @data << {
      voltage: @value/204.6,
      value: @value,
      time: Gosu::milliseconds
      }
  end

  def draw
    draw_line if visible
    draw_label
  end

  def draw_label
    margin = 60*self.pin
    @font_large.draw("Analog #{self.pin}",@window.scope_width+5,10+margin,0,1.0,1.0, COLORS[self.pin])
    @font_small.draw("#{sprintf('%.2fv',@data[-1][:voltage])} #{ self.visible ? @data[-1][:value] : "(hidden)"}",@window.scope_width+5,40+margin,0,1.0,1.0, COLORS[self.pin])
    return true
  end

  def draw_line
    (0..self.data.length - 2).each do |i|
      x1=self.data[i][:time] - self.data[0][:time]
      y1=@height-(self.data[i][:voltage]*@yscale)

      x2=@data[i+1][:time] - @data[0][:time]
      y2=@height-(self.data[i+1][:voltage]*@yscale)

      @window.draw_line(x1,y1,COLORS[self.pin],x2,y2,COLORS[self.pin])
    end
  end

end
