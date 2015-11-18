
describe 'AnalogInput' do

  class AnalogInput
    def self.clear_inputs
      @@inputs = []
    end
  end

  before do
    AnalogInput.clear_inputs
    @window = double
    allow(@window).to receive(:height).and_return(1024)
    allow(@window).to receive(:scope_width).and_return(1024)
    allow(@window).to receive(:update_interval).and_return(16)
    allow(@window).to receive(:yscale).and_return(1024.0/5.0)
    AnalogInput.new(window: @window, pin: 0)

  end

  it "can be created" do
    expect(AnalogInput.new(window: @window, pin: 1)).to be_an AnalogInput
  end

  it "receives callbacks" do
    expect(AnalogInput[0].callback(100)).to eql(100)
  end

  it "can update" do
    expect(AnalogInput[0].update).to be_an Array
  end

  it "contains no data until updated" do
    AnalogInput[0].callback(100)
    expect(AnalogInput[0].data).to eql([])
  end

  it "contains data after updated" do
    AnalogInput[0].callback(1023)
    AnalogInput[0].update
    expect(AnalogInput[0].data[0][:voltage]).to eql(5.0)
  end

  it "draws the lines" do
      AnalogInput[0].callback(1023)
    4.times { AnalogInput[0].update }
    expect(@window).to receive(:draw_line).exactly(3).times
    AnalogInput[0].draw_line
  end

  it "draws lables" do
    AnalogInput[0].callback(1023)
    4.times { AnalogInput[0].update }
    allow_any_instance_of(Gosu::Font).to receive(:draw)
    expect(AnalogInput[0].draw_label).to eql(true)
  end
end
