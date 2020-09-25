require 'rspec'
require 'first_TDD'

# describe "Array#merge_sort" do
#   let(:array) { [1, 2, 3, 4, 5].shuffle }

#   before(:each) do
#     expect_any_instance_of(Array).not_to receive(:sort)
#     expect_any_instance_of(Array).not_to receive(:sort!)
#     expect_any_instance_of(Array).not_to receive(:sort_by!)
#   end
# end
describe "#my_uniq(arr)" do
  let(:arr){ arr=[1, 2, 1, 3, 3] }
    it "accept an array as an argument" do
      expect{my_uniq([1,2,3])}.to_not raise_error
    end
    it 'will not use the #uniq built-in method' do
        expect(arr).not_to receive(:uniq)
    end
    it 'should return an array with duplicates deleted' do
      expect(my_uniq(arr)).to eq([1,2,3])
    end
  end

describe "#two_sum(arr)" do
  let(:arr){arr = [-1, 0, 2, -2, 1]}
  it"accept an array as an argument" do
    expect{two_sum([1,2,3])}.to_not raise_error
  end
  it "each of the pairs should have smaller index sorted before bigger index" do
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
    #[x,y]
    #if [[x>y]], then raise error
  end



end

describe "#my_transpose(arr)" do
  let(:arr){arr = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]} 
  it 'accept a 2-D array as an argument' do
    expect{my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])}.to_not raise_error
  end
  it "should return a 2-D array where each subarray contains the elements found in the same index position in the original array" do
    expect(my_transpose(arr)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe "stock_picker(arr)" do
  let(:arr){arr = [20, 100, 10, 350, 78]}
  it "should accept an array as argument" do
    expect{stock_picker(arr)}.to_not raise_error
  end
  it "should find the pair of indices that generates the most profit" do
    expect(stock_picker(arr)).to eq([2,3])
  end
  it "you can't sell the stock before you buy it first" do
    expect(stock_picker([550, 100, 10, 350, 78])).to_not eq([0,2])
  end

describe "Tower" do
  subject(:tower){ Tower.new }
  it "there should be three rods to begin with" do 
    expect(tower.stacks.length).to eq(3)
  end
  it "first stack should have three disks" do
    expect(tower.stacks[0]).to eq(['1','2','3'])
  end
  it "only one disk can be moved at a time" do
    expect(tower.move(0,1)).to_not eq(tower)
  end
  it "no larger disk can be placed on smaller disk" do
    expect(tower.stacks[0]).to eq(tower.stacks[0].sort)
  end
  it "the player wins if he/she move the entire stack to another rod" do 
    expect(tower.stacks[0]).to eq([])
    expect(tower.stacks.any?{|stack| stack.length == 3}).to eq(true)
  end
end