# encoding: UTF-8

require 'spec_helper'

include Polygonize

describe "Polygonize" do
  context "空テキスト" do
    it "空テキストは何も返さない" do
      "".coordinates.should eql ""
    end
  end
  
  context "テキスト" do
    txt = "こんにちは"
    it "はxy座標の文字列を返す" do
      txt.coordinates.should eql "48,83 48,147 48,107 48,97 48,111"
    end

    it "要素は偶数個である" do
      ar = txt.coordinates.split(" ").inject([]) { |mem, x| mem << x.split(",") }
      (ar.flatten.size%2).should eql 0
    end
    
    it "各要素は255(FF)以下である" do
      txt.coordinates.split(" ").flatten.reject! { |x| x.to_i < 255}
    end
  end

  context "1バイトテキスト" do
    txt_e = "x"
    it "ゼロで補完する" do
      txt_e.coordinates.split(",")[1].should eql "0"
    end
    
    it "x = 0x78" do
      txt_e.coordinates.split(",")[0].should eql "78".hex.to_s
    end
  end
  
  context "メソッド" do
    it "coordinatesは Stringのインスタンスメソッドがある" do
      String.instance_methods.grep(/^coordinates/).should eql [:coordinates]
    end
  end
end