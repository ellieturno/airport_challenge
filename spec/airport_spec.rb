require 'airport.rb'
require 'plane.rb'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }

  describe '#land' do
    it 'should land the plane' do
      plane = Plane.new
      allow(subject).to receive(:weather) { :sunny }
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'should not allow landing if weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:weather) { :stormy }
      expect { subject.land(plane) }.to raise_error("Sorry, you can't land due to the storm.")
    end
  end

  describe '#takeoff' do
    it 'should ensure the plane has taken off' do
      plane = Plane.new
      allow(subject).to receive(:weather) { :sunny }
      subject.takeoff(plane)
      expect(subject.planes).to_not include(plane)
    end

    it 'should not allow takeoff if weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:weather) { :stormy }
      expect { subject.takeoff(plane) }.to raise_error("Sorry, the storm is preventing takeoff.")
    end

    it 'should allow takeoff if weather is sunny' do
      plane = Plane.new
      allow(subject).to receive(:weather) { :sunny }
      subject.takeoff(plane)
      expect(subject.planes).to_not include(plane)
    end
  end
end
