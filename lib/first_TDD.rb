def my_uniq(arr)
    new_arr = []
    arr.each {|ele| new_arr<<ele if !new_arr.include?(ele)}
    new_arr
end

# p my_uniq([1,2,3,3])

def two_sum(arr)
    pair = []
    (0...arr.length-1).each do |i1|
        (i1+1...arr.length).each do |i2|
            pair<<[i1,i2] if arr[i1]+arr[i2] == 0
        end
    end
    pair

end

# p two_sum([1, 0, 2, -1, -2])


def my_transpose(arr)
    array = []
    while array.length < arr.length
        counter = 0
        while counter < arr[0].length
            subarray = []
            arr.each {|sub| subarray<<sub[counter]}
            counter += 1
            array<<subarray
        end
    end
    array
end

# p my_transpose([
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
# ])





# profit = 0
# sell_idx = 0
# buy_idx = 1

# i = 0
# buy = 100
# j = i + 1
# sell = 130



def stock_picker(arr)
    profit = 0
    sell_idx = nil
    buy_idx = nil

    i = 0
    while i < arr.length - 1
        buy = arr[i]
        j = i + 1
        while j < arr.length
            sell = arr[j]
            if sell - buy > profit
                profit = sell - buy
                sell_idx = j
                buy_idx = i
            end
            j += 1
        end
        i += 1
    end
    return [buy_idx, sell_idx]
end

#p stock_picker([550, 100, 10, 350, 78])



class Tower
    attr_reader :stacks
    #three arrays to begin [[1,2,3][][]]
    #smaller value should always be on top
    #can only move the piece that's on top aka smallest value in the current subarray
    #wining condition is moving all of the discs from one end of the board to the other end 
        #following the corect order

   def initialize
    @stacks = Array.new(3){Array.new()}
    @stacks[0] = ['1','2','3']
   end

   def valid_move?(pos)
    if self.stacks[pos].empty?
        return true
    elsif self.stacks[pos].first < disk
        raise "You can't put your disk here!"
    else
        return true
    end

   end

   def valid_selection?(pos)
    if self.stacks[pos].empty?
        raise "That stack is empty"
    end
    return true
   end

   def get_start_pile

        begin
        puts "Please choose a disk from a pile"
        response = gets.chomp.to_i
        
        self.valid_selection?(response)
        rescue
            retry
        end
        return response
    end
        
    def get_end_pile
        begin
        puts "Please choose a new pile for your disk"
        choice = gets.chomp.to_i

        self.valid_move?(choice)
        rescue
            retry
        end
        choice
    end

   def move(response, choice)
    disk = self.stacks[response].shift
    self.stacks[choice].unshift(disk)
   end

   def won?
        self.stacks[0] == [] && self.stacks[1..2].any? { |sub| sub.length == 3}
   end


end