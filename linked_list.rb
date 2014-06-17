require 'benchmark'

Node = Struct.new(:value, :next_node)

def new_node(linked_list, value)
  new_node = Node.new(value, linked_list.next_node)
  linked_list.next_node = new_node
end

Benchmark.bmbm do |bm|
  bm.report('array - build') do
    1000.times do
      a = []

      1000.times do
        a.unshift(1)
      end
    end
  end

  bm.report('linked list - build') do
    1000.times do
      linked_list = Node.new(1)

      1000.times do
        new_node(linked_list, 1)
      end
    end
  end

  bm.report('array - length') do
    1000.times do
      standard_length_a = Array.new(1000, 1)
      standard_length_a.length
    end
  end

  bm.report('linked list - length') do
    1000.times do
      linked_length_l = Node.new(1)
      999.times do
        new_node(linked_length_l, 1)
      end

      length = 0
      linked_list = linked_length_l

      while linked_list.next_node != nil
        length += 1
        linked_list = linked_list.next_node
      end

      length
    end
end

  bm.report('array - average') do
    1000.times do
      standard_average_a = Array.new(1000, 1)
      length = 0
      sum = 0
      standard_average_a.each do |n|
        length += 1
        sum += n
      end

      sum / length
    end
  end

  bm.report('linked list - average') do
    1000.times do
      linked_average_l = Node.new(1)
      999.times do
        new_node(linked_average_l, 1)
      end
      length = 0
      sum = 0
      linked_list = linked_average_l

      while linked_list.next_node != nil
        length += 1
        sum += linked_list.next_node.value
        linked_list = linked_list.next_node
      end

      sum / length
    end
  end
end

# 2.0.0-p0 :001 > load 'think_like_a_programmer/linked_list.rb'
# Rehearsal ---------------------------------------------------------
# array - build           0.190000   0.000000   0.190000 (  0.193121)
# linked list - build     0.810000   0.000000   0.810000 (  0.827017)
# array - length          0.010000   0.000000   0.010000 (  0.005058)
# linked list - length    1.080000   0.000000   1.080000 (  1.092325)
# array - average         0.140000   0.000000   0.140000 (  0.139894)
# linked list - average   1.230000   0.010000   1.240000 (  1.238732)
# ------------------------------------------------ total: 3.470000sec
# 
#                             user     system      total        real
# array - build           0.180000   0.000000   0.180000 (  0.190592)
# linked list - build     0.800000   0.000000   0.800000 (  0.803471)
# array - length          0.010000   0.000000   0.010000 (  0.004581)
# linked list - length    1.080000   0.000000   1.080000 (  1.084398)
# array - average         0.140000   0.000000   0.140000 (  0.141340)
# linked list - average   1.230000   0.000000   1.230000 (  1.237020)
#  => true