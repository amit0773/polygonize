# encoding: UTF-8

require "polygonize/version"

module Polygonize
  String.class_eval do
    def coordinates 
      ar1 = []
      ar2 = []
      ret = {}

      self.split(//).each do | char |
        u = format("%x", char.unpack("U*")[0])
        ar1 << u.scan(/../)
      end

      # 奇数の場合は "00" を追加して、偶数配列にする
      ar1.flatten!
      ar1 << "00" if ar1.flatten.size%2 == 1
  
      # Max 255 で座標の文字列を生成
      ar1.each_slice(2) do | a,b |
        ar2 << [a, b].map! { |c| c.hex }.join(",")
      end

      ret['points'] = ar2.join(" ")
      ret['text'] = self
      ret
    end
  end
end
