# エラトステネスの篩
# やっつけ実装3パターン

max = 12000

# 再代入しまくりバージョン
def eratosthenes０(numbers, max)
  sqrt = Math.sqrt(max)
  numbers.delete(1)
  prime = []
  while true do
    target = numbers.first
    break if target > sqrt
    prime << target
    i = 1
    while true do
      numbers.delete(target * i)
      i += 1
      break if target * i > max
    end
  end
  prime + numbers
end

def eratosthenes1(nums, max)
  sqrt = Math.sqrt(max)
  nums.delete(1)
  prime = []
  
  while nums.first <= sqrt do
    target = nums.first
    prime << target
    nums = nums.filter { |n| n % target != 0 }
  end
  
  prime + nums
end

def eratosthenes2(nums, max)
  sqrt = Math.sqrt(max)
  nums.delete(1)
  hash = nums.map { |n| [n, n] }.to_h
  
  prime = []
  
  while hash.keys.first <= sqrt do
    target = hash.keys.first
    prime << target
    (1..(hash.keys.last / target)).map { |i| i * target }.each { |i| hash.delete(i) }
  end
  
  prime + hash.keys
end

require 'benchmark'

Benchmark.bm 10 do |r|
  r.report "Nantoka" do
    eratosthenes０((1..max).to_a, max)
  end
  r.report "Kantoka" do
    eratosthenes1((1..max).to_a, max)
  end
  r.report "Kantoko" do
    eratosthenes2((1..max).to_a, max)
  end
end

#                  user     system      total        real
# Nantoka      1.148480   0.000000   1.148480 (  1.148636)
# Kantoka      0.006553   0.000000   0.006553 (  0.006554)
# Kantoko      0.012244   0.000000   0.012244 (  0.012247)
