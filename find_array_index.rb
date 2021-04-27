# 目的：
#   指定の配列の要素のうち、条件に該当する要素のインデックスを出力する
# 
# 例：
#   合計して１０になる2つの要素のインデックス
# 
# 前提：
#   解となる組み合わせは１パターンのみ
#   要素の並びはランダム
#   重複する可能性あり
# 
# 注意点：
#   求めるのは配列のインデックスである為、ソートはしない方が良い
#   hash（連想配列）化は有効だが、一気に変換してしまうと重複要素が勝手に上書きされてしまう
# 
# テストケース：
#   nums = [2, 4, 8, 9]
#   nums = [5, 2, 3, 5]
# 
# 備考：
#   再代入するので、実務ではあまり使わない気がする

nums = [5, 2, 3, 5]
target = 10

def find_array_index(nums, target)
  hash = {}
  nums.each.with_index { |num, index|
    result = hash[target - num]
    return [result, index] if result != nil
    hash[num] = index
  }
end

p find_array_index(nums, target)
