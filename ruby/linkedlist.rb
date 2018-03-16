# Linked List practice

class LinkedList
  include Enumerable
  attr_accessor :name
  
  def initialize
    @head = nil
    @tail = nil
  end
  
  def each
    return nil if @head.nil?
    node = @head
    
    until node.nil?
      yield node
      node = node.next_node
    end
  end
  
  def append(node)
    # adds a new node to the end of the list
    node = Node.new(node)
    
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end
  
  def prepend(node)
    # adds a new node to the start of the list
    node = Node.new(node)

    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end
  
  def size
    # returns the total number of nodes in the list
    
    i = 0
    self.each do |node|
      i += 1
    end
    return i
  end
  
  def head
    # returns the first node in the list
    
    return @head
  end
  
  def tail
    # returns the last node in the list
    
    return @tail
  end
  
  def at(index)
    # returns the node at the given index
    
    i = 0
    self.each do |node|
      if i == index
        return node.value
      else
        i += 1
      end
    end
  end
  
  def pop
    # removes the last element from the list
    
    return nil if @tail.nil?
    
    current = @head
    
    while current.next_node.next_node != nil
      current = current.next_node
    end
    
    @tail = current
    @tail.next_node = nil
  end
  
  def contains?(element)
    # returns true if the passed in value is in the list and otherwise returns false
    
    self.each do |node|
      if node.value == element
        return true
      end
    end
  end
  
  def find(data)
    # returns the index of the node containing data, or nil if not found
    
    i = 0
    
    self.each do |node|
      if node.value == data
        return i
      else
        i += 1
      end
    end
  end
  
  def to_s
    # represent your linked list objects as strings, so you can print them out
    # and preview them in the console. Format should be: ( data ) -> ( data ) ->
    # ( data ) -> nil
    
    output = ""
    
    self.each do |node|
      if @head == node
        output = "( #{node.value} )"
      else
        output = output + " -> " + "( #{node.value} )"
      end
    end
    return output
  end
  
  def insert_at(data, index)
    # inserts the node at the given index
    data = Node.new(data)

    if index == 0
      self.prepend(data)
    elsif index == self.size
      self.append(data)
    elsif index > self.size || index < 0
      return "Index is out of scope. The length of the linked list is #{self.size}."
    else
      i = 0
      
      self.each do |node|
        if i == index - 1
          data.next_node = node.next_node
          node.next_node = data
        end
        i += 1
      end
    end
  end
  
  def remove_at(index)
    # removes the node at the given index. (you will need to update the links
    # of your nodes in the list when you remove a node.)
    
    if index == 0
      temp = @head
      @head = temp.next_node
      temp.next_node = nil
    elsif index == (self.size - 1)
      self.pop
    else
      i = 0

      self.each do |node|
        if i == index - 1
          node.next_node = node.next_node.next_node
        end
        i += 1
      end
    end
  end
end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value)
    @value = value
    @next_node = nil
  end
end