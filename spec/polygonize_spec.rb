# encoding: UTF-8

require 'spec_helper'

include Polygonize

describe "Polygonize" do
  context "空テキスト" do
    it "空テキストはreturn[point]に何も返さない" do
      "".coordinates['points'].should eql ""
    end
    
    it "空テキストはreturn[text]に何も返さない" do
      "".coordinates['text'].should eql ""
    end
  end
  
  context "テキスト" do
    txt = "こんにちは"
    it "return[points]はxy座標の文字列を返す" do
      txt.coordinates['points'].should eql "48,83 48,147 48,107 48,97 48,111"
      
    end
  
    it "return[text] は元の文章を返す" do
      txt.coordinates['text'].should eql txt
    end
    
    it "要素は偶数個である" do
      ar = txt.coordinates['points'].split(" ").inject([]) { |mem, x| mem << x.split(",") }
      (ar.flatten.size%2).should eql 0
    end
    
    it "各要素は255(FF)以下である" do
      txt.coordinates['points'].split(" ").flatten.reject! { |x| x.to_i < 255}
    end
  end

  context "1バイトテキスト" do
    txt_e = "x"
    it "ゼロで補完する" do
      txt_e.coordinates['points'].split(",")[1].should eql "0"
    end
    
    it "x = 0x78" do
      txt_e.coordinates['points'].split(",")[0].should eql "78".hex.to_s
    end
  end
  
  context "メソッド" do
    it "coordinatesは Stringのインスタンスメソッドがある" do
      String.instance_methods.grep(/^coordinates/).should eql [:coordinates]
    end
  end
end