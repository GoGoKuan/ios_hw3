//
//  ContentView.swift
//  ios_hw3
//
//  Created by 官鼎鈞 on 2021/12/5.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user_name = ""
    @State private var does_shownextpage = false
    @State private var alert_showing = false
    @State private var alert_showing2 = false
    @State private var start_to_recommend = false
    @State private var alert_content = ""
    @State private var alert_content2 = ""
    @State private var comment = ""
    @State private var sortindex = 0
    @State private var dateindex = 0
    @State private var singer_year = Date()
    @State private var theSize: Double = 25
    @State private var selected_color = Color.white
    
    var handsome_name = ["金城武", "彼得潘", "郭富城", "木村拓哉"]
    var sort = ["歌手", "樂團"]
    var singer_date = ["1990s", "2000s", "2010s"]
    var isSinger = false
    
    var body: some View {
        VStack {
            Text("日本女歌手/樂團介紹")
                .fontWeight(.bold)
                .padding()
                .font(.system(size: theSize * 1.25))
                .position(x: 185, y: 50)
            Form {
                if !does_shownextpage {
                    TextField("請輸入您的名字", text: $user_name)
                        .padding()
                        .font(.system(size: theSize * 1.25))
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 2.5))
                    
                    DatePicker("生日", selection: $singer_year, displayedComponents: .date)
                    
                    Button(action: {user_name = handsome_name.randomElement()!}) {
                        Text("隨機生成帥氣名字")
                            .padding()
                            .font(.system(size: theSize))
                            
                    }
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.red, lineWidth: 2.5))
                    .position(x: 150, y: 30)
                    
                    
                    Button(action: {
                        if user_name == "" {
                            alert_showing = true
                        }
                        else {
                            does_shownextpage = true
                        }
                    }) {
                        Text("輸入完畢")
                            .padding()
                            .font(.system(size: theSize))
                            
                    }
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.red, lineWidth: 2.5))
                    .position(x: 150, y: 30)
                    .alert(isPresented: $alert_showing) { () -> Alert in
                        let alert_content = "請輸入名字！"
                            return Alert(title: Text(alert_content))
                    }
                    
                    HStack {
                        Text("版面大小")
                        Slider(value: self.$theSize, in: 20...25,
                                minimumValueLabel: Image(systemName:
                                "tv").imageScale(.small), maximumValueLabel: Image(systemName: "tv").imageScale(.large)) {
                                        Text("")
                        }
                    }

                }
                
                if does_shownextpage {
                    Text("歡迎您的到來，\(user_name)")
                        .padding()
                        .font(.system(size: 20))
                    
                    DisclosureGroup("介紹使用說明") {
                        Text("此處介紹個人喜愛之日本女歌手/樂團，使用方式為選擇要看歌手或樂團，以及想知道哪個年代的歌手或樂團，依照選擇結果會推薦一位歌手或樂團，並加以介紹以及會推薦兩首最喜歡的歌。")
                    }
                    
                    Picker(selection: $sortindex, label: Text("")) {
                        ForEach(0 ..< sort.count) { i in
                            Text(self.sort[i]).tag(i)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                    
                    Picker(selection: $dateindex, label: Text("")) {
                        ForEach(0 ..< singer_date.count) { i in
                            Text(self.singer_date[i]).tag(i)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                    
                    Toggle("選擇完成", isOn: $start_to_recommend.animation())
                    
                    ColorPicker("設定背景顏色", selection: $selected_color)
                }
                
                
            }
                .position(x: 185, y: -100)
                .background(selected_color)
            
            if start_to_recommend {
                if sortindex == 0 && dateindex == 0 {
                    List {
                        Image("zard")
                            .resizable()
                            .scaledToFill()
                        Text("Zard(坂井泉水)")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("ZARD原為一個已停止活動的日本搖滾樂團名，但在活動期間隨著 成員一一離開，最後用來直接指主唱坂井泉水。ZARD於1991年出道，1993年推出的《別認輸》與《搖擺的想念》獲得巨大迴響，也從此奠定了樂壇地位。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("別認輸", destination: URL(string: "https://www.youtube.com/watch?v=NCPH9JUFESA")!)
                        Link("搖擺的想念", destination: URL(string: "https://www.youtube.com/watch?v=nabLCezmvTE")!)
                    }
                        .position(x: 185, y: -100)
                        
                }
                else if sortindex == 0 && dateindex == 1 {
                    List {
                        Image("大塚愛")
                            .resizable()
                            .scaledToFill()
                        Text("大塚愛")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("大塚愛從１５歲開始作曲作詞，很多音樂是在出道前完成，數量高達６０曲。２００２年送到艾迴唱片的作品試聽帶吸引眾多審查員目光，得到出道的機會，２００３年９月１０日以單曲《桃花花瓣》出道。其作曲風格屬於搞怪或開朗元氣型，但仍不乏抒情歌，旋律常有樂團風格；歌詞方面則近生活化，或是仍然存在其風格的搞怪式。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("櫻桃", destination: URL(string: "https://www.youtube.com/watch?v=upODO6OuOOk")!)
                        Link("星象儀", destination: URL(string: "https://www.youtube.com/watch?v=ehdUh4Lekv8")!)
                    }
                        .position(x: 185, y: -80)
                }
                else if sortindex == 0 && dateindex == 2 {
                    List {
                        Image("milet")
                            .resizable()
                            .scaledToFill()
                        Text("milet")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("milet 從2018年開始有音樂活動，2019年正式出道，除此之外沒有公開其他資料，所以也不知道她的年齡，出道單曲《inside you》就是《醜聞專業律師 QUEEN》的主題曲，之後陸續參與許多日劇主題曲的製作，清亮又有力的歌聲搭配上扣人心弦的歌詞，讓milet逐漸受到大家的注目")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("inside you", destination: URL(string: "https://www.youtube.com/watch?v=yy7oP37lU4A")!)
                        Link("us", destination: URL(string: "https://www.youtube.com/watch?v=AIMjbleH394")!)
                    }
                        .position(x: 185, y: -80)
                }
                else if sortindex == 1 && dateindex == 0 {
                    List {
                        Image("elt")
                            .resizable()
                            .scaledToFill()
                        Text("小事樂團(Every Little Thing)")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("小事樂團由持田香織（主唱）、伊藤一朗（吉他手）、五十嵐充（鍵盤手）三人組成，於1996年正式出道。其作品絕大部分由三人共同創作，持田香織負責作詞，伊藤一朗負責作曲編曲，五十嵐充則詞曲皆有創作，曲風輕快、柔和。出道首張專輯銷售量便高達10萬。到了2000年，五十嵐充決意專心於幕後製作，並宣告退出，從此維持兩人組合的形式。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("fragile", destination: URL(string: "https://www.youtube.com/watch?v=NP60Qqjfdhs")!)
                        Link("戀文", destination: URL(string: "https://www.youtube.com/watch?v=XXHM2_SpZXE")!)
                    }
                        .position(x: 185, y: -80)
                }
                else if sortindex == 1 && dateindex == 1 {
                    List {
                        Image("perfume")
                            .resizable()
                            .scaledToFill()
                        Text("Perfume")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("Perfume自 2000 年於廣島縣廣島演藝學校 ASH (ACTOR’S SCHOOL HIROSHIMA) 發跡至今，由樫野有香（Kashiyuka）、西脇綾香（A~chan）、大本彩乃（Nocchi）所組建，以精湛的舞蹈設計、先進的燈光特效與帶有中毒感的舞曲旋律，走過地方偶像與地下時期的艱辛，2008 年起在競爭激烈的女子偶像界構築無法撼動的頂點，並走出世界成為代表日本的重要識別。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("Chocolate Disco", destination: URL(string: "https://www.youtube.com/watch?v=1WTy2yqKI4w")!)
                        Link("Polyrhythm", destination: URL(string: "https://www.youtube.com/watch?v=KbiSxunJatM")!)
                    }
                    .position(x: 185, y: -80)
                }
                else if sortindex == 1 && dateindex == 2 {
                    List {
                        Image("babymetal")
                            .resizable()
                            .scaledToFill()
                        Text("BabyMetal")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("BABYMETAL是一個在2010年結成的日本少女偶像暨重金屬樂團。由Amuse公司的製作室長之一、同時是重金屬音樂愛好者的小林啟（KOBAMETAL）擔任製作人。他以主唱中元鈴香（SU-METAL）為中心，水野由結（YUIMETAL）和菊地最愛（MOAMETAL）為雙翼輔佐，創立了BABYMETAL。BABYMETAL成軍短短數年間持續打破多項紀錄，躋身為國際知名樂團。2013年鞭擊金屬龍頭樂團金屬製品越洋觀賞演出並與其合照，引起海外樂迷討論。2014年發行首張專輯登告示牌排行榜全球專輯榜第1名，開始在歐美地區走紅，同年舉辦第一次世界巡演，成為多個知名音樂節的演出常客。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("Gimme chocolate!!", destination: URL(string: "https://www.youtube.com/watch?v=WIKqgE4BwAY")!)
                        Link("Distortion", destination: URL(string: "https://www.youtube.com/watch?v=nabLCezmvTE")!)
                    }
                        .position(x: 185, y: -80)
                }
                
                VStack {
                    Text("留下個評論讓我們知道吧！")
                        .padding()
                        .font(.system(size: 25))
                    TextEditor(text: $comment)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.yellow, lineWidth: 1))
                }
                Button(action: {
                    if comment != "" {
                        alert_showing2 = true
                        comment = ""
                    }
                }) {
                    Text("評論完畢")
                        .padding()
                        .font(.system(size: theSize))
                }
                .position(x: 185, y: -80)
                .alert(isPresented: $alert_showing2) { () -> Alert in
                    let alert_content2 = "感謝您的評論！"
                        return Alert(title: Text(alert_content2))
                }
                .position(x: 185, y: 180)
            }
            
        }
        .background(selected_color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
