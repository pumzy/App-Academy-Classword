require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_link!(@map[key])
    elsif count == @max
      eject!
      calc!(key)
    else
      calc!(key)
    end
    @store.last.val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    value = @prc.call(key)
    @store.append(key,value)
    @map.set(key, @store.last)
  end

  def update_link!(link)
    # @map.set(link.key, link)
    @store.remove(link.key)
    @store.append(link.key,link.val)
  end

  def eject!
    @map.delete(@store.first.key)
    @store.remove(@store.first.key)
  end
end
