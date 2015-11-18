class MinMaxText
  def initialize(w,min=0,max=5)
    @window = w
    @width = @window.scope_width
    @height = @window.height
    @font = Gosu::Font.new(12)

    @min = min
    @max = max

  end

  def draw
    @font.draw("#{@max}v", @width-20, 10, 0, 1.0, 1.0, 0xff_ffff00)
    @font.draw("#{@min}v", @width-20, @height-20, 0, 1.0, 1.0, 0xff_ffff00)
  end
end

class CenterLine
  def initialize(w)
    @window = w
    @interval = @window.update_interval
    @height = @window.height
    @width = @window.scope_width
    @font = Gosu::Font.new(12)
  end

  def draw
    line
    time
  end

  private

  def line
    @window.draw_line(0,@height/2,Gosu::Color::RED, @width,@height/2,Gosu::Color::RED)
  end

  def time
    (0..@width/@interval).each do |i|
      t=(@interval*i)
      @font.draw("#{t.to_i}", @width-8-(@width/@interval)*i,@height/2+10,0,1.0,1.0,Gosu::Color::GRAY)
    end
  end
end

class RightLine
  def initialize(w)
    @window = w
    @width = @window.scope_width
    @height = @window.height
  end

  def draw
    line
  end

  private
  def line
    @window.draw_line(@width,0,Gosu::Color::RED, @width, @height,Gosu::Color::RED)
  end
end
