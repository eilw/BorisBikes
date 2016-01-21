require 'bike'

describe Bike do

  it {is_expected.to respond_to('working?')}

  it {is_expected.to respond_to('bike_broken')}

  it 'if reported broken, then bike does not work' do
    subject.bike_broken
    expect(subject).to be_broken
  end

# is expecting subject.working? to retrun true
  #it do
    #expect (subject.working?).to eq('true')
  #end
end
