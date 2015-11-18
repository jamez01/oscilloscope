
class ArduinoReader
  def initialize(window)
    @window = window

    @inputs = []
    connect
    pwm
    setup_callbacks
  end

  private
  
  def pwm
    # Setup PWM on pin 9 for 50% cycle to produce a square wave for testing.
    @arduino.analog_write 9,127
  end

  def connect
    # Use first arduino found
    @arduino = ArduinoFirmata.connect nil, :nonblock_io => true
  end

  def setup_callbacks
    @arduino.on :analog_read do |pin, value|
      AnalogInput.new(window: @window, pin: pin) unless AnalogInput[pin]
      AnalogInput[pin].callback(value)
    end
  end

end

class FakeArduinoReader < ArduinoReader

  def connect
    @inputs << AnalogInput.new(window: @window, pin: 0)
    @inputs << AnalogInput.new(window: @window, pin: 1)
  end

  def pwm
    return true
  end

  def setup_callbacks
    Thread.new {
      loop do
        AnalogInput[0].callback(0)
        AnalogInput[1].callback(rand(1023))
        sleep 0.09
        AnalogInput[0].callback(1023)
        sleep 0.09
      end
    }
  end

end
