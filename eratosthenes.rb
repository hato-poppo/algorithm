# エラトステネスの篩

# 指定された値までに存在する素数を全て抽出するアルゴリズム

# やっつけ実装3パターン

max = 12000

# 実装パターン１
# 派手な多重ループ＆再代入しまくりバージョン
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

# 実装パターン２
# パフォーマンスを意識してみた
# 少しお淑やかな多重ループになったが、再代入は無くせず
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

# 実装パターン３
# パターン２からハッシュ化してみたけどあまり意味なくて結局変換のコストの方が大きそう
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
  r.report "eratosthenes０" do
    eratosthenes０((1..max).to_a, max)
  end
  r.report "eratosthenes１" do
    eratosthenes1((1..max).to_a, max)
  end
  r.report "eratosthenes２" do
    eratosthenes2((1..max).to_a, max)
  end
end

#                        user     system      total        real
# eratosthenes０      1.148480   0.000000   1.148480 (  1.148636)
# eratosthenes１      0.006553   0.000000   0.006553 (  0.006554)
# eratosthenes２      0.012244   0.000000   0.012244 (  0.012247)
