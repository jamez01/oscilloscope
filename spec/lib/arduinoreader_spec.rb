describe 'ArduinoReader' do
  before do
    @window = double
    allow(@window).to receive(:height).and_return(1024)
    allow(@window).to receive(:scope_width).and_return(1024)
    allow(@window).to receive(:update_interval).and_return(16)
    allow(@window).to receive(:yscale).and_return(1024.0/5.0)
  end

  it "can be created" do
    @arduino = double
    expect(ArduinoFirmata).to receive(:connect).and_return(@arduino)
    expect(@arduino).to receive(:analog_write).and_return(true)
    expect(@arduino).to receive(:on).and_return(true)

    ArduinoReader.new(@window)
  end


end
