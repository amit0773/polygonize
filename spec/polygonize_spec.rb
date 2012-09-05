# encoding: UTF-8

require 'spec_helper'

include Polygonize

describe "Polygonizeモジュールをインクルードする" do
  describe ":coordinates メソッド" do
    context "空テキスト" do
      it "は何も返さない" do
        "".coordinates.should eql ""
      end
    end
  
    context "Stringのメソッドである" do
      it "Fixnumはエラーになる" do
        proc {
          123.coordinates
        }.should raise_error
      end
    
      it "Arrayはエラーになる" do
        proc {
          ["foo","bar"].coordinates
          }.should raise_error
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
        ret = txt.coordinates.split(" ").flatten.reject! { |x| x.to_i < 255}
        ret.should eql []
      end
    end

    context "1バイトテキスト" do
      txt_e = "x"
      it "は奇数要素、ゼロで補完する" do
        txt_e.coordinates.split(",")[1].should eql "0"
      end
    
      it "#{txt_e}の文字コードは0x78である" do
        txt_e.coordinates.split(",")[0].should eql "78".hex.to_s
      
      end
      it "0x78 = 120である" do
        txt_e.coordinates.split(",")[0].should eql "120"
      end
    end
  
    context "メソッド" do
      it ":coordinatesは Stringのインスタンスメソッドがある" do
        String.instance_methods.grep(/^coordinates/).should eql [:coordinates]
      end
    end    
  end

end