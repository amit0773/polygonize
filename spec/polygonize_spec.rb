# encoding: UTF-8

require 'spec_helper'

include Polygonize

describe "Polygonize" do
  context "空テキスト" do
    it "空テキストはreturn[point]に何も返さない" do
      coordinates("")['points'].should eql ""
    end
    
    it "空テキストはreturn[text]に何も返さない" do
      coordinates("")['text'].should eql ""
    end
    
  end
  
  context "テキスト" do
    txt = "こんにちは"
    it "return[text] は元の文章を返す" do
      coordinates(txt)['text'].should eql txt
    end
  
    it "要素は偶数個である" do
      ar = coordinates(txt)['points'].split(" ").inject([]) { |mem, x| mem << x.split(",") }
      (ar.flatten.size%2).should eql 0
    end
    
    it "各要素は255(FF)以下である" do
      coordinates(txt)['points'].split(" ").flatten.reject! { |x| x.to_i < 255}
    end
  end

  context "1バイトテキスト" do
    txt_e = "x"
    it "ゼロで補完する" do
      coordinates(txt_e)['points'].split(",")[1].should eql "0"
    end
    
    it "x = 0x78" do
      coordinates(txt_e)['points'].split(",")[0].should eql "78".hex.to_s
    end
  end
end