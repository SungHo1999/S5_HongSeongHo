puts '===============================自販機　プログラム====================================='

class Drink
  def initialize(name,price,stock)
    @name = name #品名です
    @price = price　#値段です
    @stock = stock　#在庫です
  end
  def getprice()
    return @price
  end
  def setprice(v)
    @price = v
  end
  def getstock()
    return @stock
  end
  def setstock(v)
    @stock=v
  end
  def getName()
    return @name
  end
  def setName(v)
    @name =v
  end
  def toString() #===ジュースの情報を全部出力
    return puts'品名:'+@name+"\n値段:"+@price.to_s+"\n在庫:"+@stock.to_s+"\n\n======================="
  end
end
class Coke <Drink
  def initialize()
    @name = 'コーラ'
    @price = 120
    @stock = 5
  end
end
class Redbull <Drink
  def initialize()
    @name = 'レッドブル'
    @price = 200
    @stock = 5
  end
end
class Water <Drink
  def initialize()
    @name = '水'
    @price = 100
    @stock = 5
  end
end
def canbuy(juice,totalmoney) #購入できるジュースを判別するメソッド
  if juice.getprice<=totalmoney&&juice.getstock>0
    puts juice.toString()
  end
end
totalmoney=0 #投入されているお金の総計です
benefit=0 #売上です
dcoke = Coke.new()
dwater = Water.new()
dredbull = Redbull.new()
while true do
  puts'====1.投入 2.払い戻し3.ジュースの管理 4.購入====='
  puts'====メニューを選択してください===='
  menuchoice = gets.chomp.to_i
  if menuchoice == 1#＝＝＝＝投入＝＝＝＝＝
     puts'投入金額を入力してください'
     puts'投入できるお金は　10円、50円、100円、500円、1000円です 数字だけ入力してください'
     inputmoney=gets.chomp.to_i#＝＝投入金額入力＝＝inputmoneyは投入した金額です
    if inputmoney==10||inputmoney==50||inputmoney==100||inputmoney==500||inputmoney==1000
       totalmoney+=inputmoney#投入されている総額+=投入金額
         puts '総計:' +totalmoney.to_s
         puts "購入できるジュース \n"
         puts "============================\n"
         canbuy(dcoke,totalmoney)#==購入できるジュースを判別するメソッド
         canbuy(dwater,totalmoney)
         canbuy(dredbull,totalmoney)
    else
       puts'扱えないお金です'
    end
  elsif menuchoice == 2#払い戻し===================
    puts'投入金額の 総額を 払い戻します'
    puts'釣り銭:'+totalmoney.to_s
    totalmoney=0
  elsif menuchoice == 3#ジュースの管理、売上=====================
    dcoke.toString()
    dwater.toString()
    dredbull.toString()
    puts '売上:'+benefit.to_s
  elsif menuchoice == 4#購入========================
      puts'ジュースを選択してください'
      puts'1.コーラ 2.水 3.レッドブル'
      selectdrink = gets.chomp.to_i
      if selectdrink == 1#コーラを選択　コーラ購入
        if(totalmoney<=dcoke.getprice)#投入されている総額<=コーラの値段
          puts'投入金額が足りないです'
        end
        if(dcoke.getstock==0)#在庫==0
          puts'在庫がありません'
        end
         if(totalmoney>=dcoke.getprice&&dcoke.getstock!=0)
           dcoke.setstock(dcoke.getstock-1)
           benefit +=dcoke.getprice
           totalmoney-=dcoke.getprice
           puts '釣り銭:'+totalmoney.to_s
           puts '在庫:'+dcoke.getstock.to_s
         end
      elsif selectdrink ==2#水を選択　水購入
        if(totalmoney<=dwater.getprice)#投入されている総額<=水の値段
          puts'投入金額が足りないです'
        end
        if(dwater.getstock==0)#在庫==0
          puts'在庫がありません'
        end
         if(totalmoney>=dwater.getprice&&dwater.getstock!=0)
           dwater.setstock(dwater.getstock-1)
           benefit +=dwater.getprice
           totalmoney-=dwater.getprice
           puts '釣り銭:'+totalmoney.to_s
           puts '在庫:'+dwater.getstock.to_s
         end
      elsif selectdrink ==3#レッドブル選択　レッドブル購入
        if(totalmoney<=dredbull.getprice)#投入されている総額<=レッドブルの値段
          puts'投入金額が足りないです'
        end
        if(dredbull.getstock==0)#在庫==0
          puts'在庫がありません'
        end
         if(totalmoney>=dredbull.getprice&&dredbull.getstock!=0)
           dredbull.setstock(dredbull.getstock-1)
           benefit +=dredbull.getprice
           totalmoney-=dredbull.getprice
           puts '釣り銭:'+totalmoney.to_s
           puts '在庫:'+dredbull.getstock.to_s
         end
      else#存在しないジュースの番号を選択した時
        puts'1, 2, 3の中で選択してください'
      end
  else#メニューの選択を間違えた時
    puts"１、2、3、4のメニューの中で選んでください"
  end
end
