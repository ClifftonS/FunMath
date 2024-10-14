import SwiftUI
import AVKit


var o = ["+","-","x","÷"]
var o2 = o.randomElement()!
var o3 = o.randomElement()!



struct ContentView: View {
    @State var music: AVAudioPlayer!
    @State var music2: AVAudioPlayer!
    @State var a = randomNumber()
    @State var b = randomNumber()
    @State var c = randomNumber()
    @State var d = randomNumber()
    @State var key = ""
    @State var key2 = ""
    @State var rr = 0.0
    @State var space2 = 0
    @State var space = 0
    @State var hasil = 0
    @State var hasil2 = 0
    @State var k1 = 0
    @State var k2 = 0
    @State var start = false
    @State var yoffset = 0.3 * UIScreen.main.bounds.height
    @State var y2offset = 0.3 * UIScreen.main.bounds.height
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack(spacing: 0){
                    Rectangle()
                        .foregroundColor(Color(.blue))
                        .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
                        .offset(y: rr * UIScreen.main.bounds.height)
                    
                    Rectangle().foregroundColor(Color(.red))
                        .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
                        .offset(y: rr * UIScreen.main.bounds.height)
                    
                }
                if start == false{
                    Button("Start") {
                        random()
                        random2()
                        start = true
                    }.font(.title).padding().background(.white).cornerRadius(10)
                }else{
                    VStack(spacing:UIScreen.main.bounds.height + 200){
                        VStack{
                            Text("Congratulation")
                                .foregroundColor(.white)
                                .font(.system(size: 45, weight:.bold, design:.rounded))
                            Text("Red Wins The Game")
                                .foregroundColor(.white)
                                .font(.system(size: 40, weight:.bold, design:.rounded)).padding(.bottom,5)
                            
                            
                            Button("Play Again") {
                                key2 = ""
                                key = ""
                                random()
                                random2()
                                start = true
                                space2 = 0
                                rr = 0
                                space = 0
                                yoffset = 0.3 * UIScreen.main.bounds.height
                                y2offset = 0.3 * UIScreen.main.bounds.height
                            }.font(.title3).fontWeight(.bold).foregroundColor(.black).padding(.horizontal, 80).padding(.vertical, 12).background(Color(.white)).cornerRadius(10)
                            
                            
                            NavigationLink(destination: MenuView()) {
                                Text("Home").font(.title3).fontWeight(.bold).foregroundColor(.white).padding(.horizontal, 100).padding(.vertical, 12).background(Color("Colorbtn")).cornerRadius(10)
                            }
                            
                        }.offset(y: CGFloat(space2))
                        
                        VStack{
                            Text("Congratulation")
                                .foregroundColor(.white)
                                .font(.system(size: 45, weight:.bold, design:.rounded))
                            Text("Blue Wins The Game")
                                .foregroundColor(.white)
                                .font(.system(size: 40, weight:.bold, design:.rounded)).padding(.bottom,5)
                            
                            
                            Button("Play Again") {
                                key2 = ""
                                key = ""
                                random()
                                random2()
                                start = true
                                space2 = 0
                                rr = 0
                                space = 0
                                yoffset = 0.3 * UIScreen.main.bounds.height
                                y2offset = 0.3 * UIScreen.main.bounds.height
                            }.font(.title3).fontWeight(.bold).foregroundColor(.black).padding(.horizontal, 80).padding(.vertical, 12).background(Color(.white)).cornerRadius(10)
                            
                            
                            NavigationLink(destination: MenuView().preferredColorScheme(.light)) {
                                Text("Home").font(.title3).fontWeight(.bold).foregroundColor(.white).padding(.horizontal, 100).padding(.vertical, 12).background(Color("Colorbtn")).cornerRadius(10)
                            }
                            
                        }.offset(y: CGFloat(space)).rotationEffect(.degrees(180))
                        
                    }.rotationEffect(.degrees(90))
                    
                    VStack(alignment: .trailing){
                        
                        
                        VStack(spacing: 0){
                            
                            
                            HStack(spacing:20){
                                Text(String(c))
                                    .foregroundColor(.white)
                                    .font(.system(size: 50, weight:.bold, design:.rounded))
                                Text(o2)
                                    .foregroundColor(.white)
                                    .font(.system(size: 50, weight:.bold, design:.rounded))
                                Text(String(d))
                                    .foregroundColor(.white)
                                    .font(.system(size: 50, weight:.bold, design:.rounded))
                                Text("=")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50, weight:.bold, design:.rounded))
                                if key2 != ""{
                                    Text(key2)
                                        .padding(.horizontal,10).background(.white).cornerRadius(10) .font(.system(size: 50, weight:.bold, design:.rounded))
                                }else{
                                    Text("")
                                        .padding(.horizontal,40).padding(.vertical,23).background(.white).cornerRadius(10) .font(.system(size: 50, weight:.bold, design:.rounded))
                                }
                            }
                            .padding(10)
                            
                            
                            
                            VStack{
                                
                                HStack{
                                    
                                    Button("Reset") {
                                        key2 = ""
                                    }.padding(.horizontal).background(.white).cornerRadius(10).font(.system(size: 30, weight:.bold, design:.rounded))
                                }.offset(x: 130)
                                
                                
                                
                                
                                
                                HStack{
                                    Button("0") {
                                        key2 += "0"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("1") {
                                        key2 += "1"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 25).padding(.vertical,6).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("2") {
                                        key2 += "2"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("3") {
                                        key2 += "3"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("4") {
                                        key2 += "4"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    
                                    
                                }
                                HStack{
                                    Button("5") {
                                        key2 += "5"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("6") {
                                        key2 += "6"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("7") {
                                        key2 += "7"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("8") {
                                        key2 += "8"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("9") {
                                        key2 += "9"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    
                                }
                            }
                            .padding(20)
                        }
                        
                    }
                    .offset(y:yoffset)
                    VStack(alignment: .trailing){
                        
                        
                        VStack(spacing: 0){
                            
                            
                            HStack(spacing:20){
                                Text(String(a))
                                    .foregroundColor(.white)
                                    .font(.system(size: 50, weight:.bold, design:.rounded))
                                Text(o3)
                                    .foregroundColor(.white)
                                    .font(.system(size: 50, weight:.bold, design:.rounded))
                                Text(String(b))
                                    .foregroundColor(.white)
                                    .font(.system(size: 50, weight:.bold, design:.rounded))
                                Text("=")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50, weight:.bold, design:.rounded))
                                if key != ""{
                                    Text(key)
                                        .padding(.horizontal,10).background(.white).cornerRadius(10) .font(.system(size: 50, weight:.bold, design:.rounded))
                                }else{
                                    Text("")
                                        .padding(.horizontal,40).padding(.vertical,23).background(.white).cornerRadius(10) .font(.system(size: 50, weight:.bold, design:.rounded))
                                }
                            }
                            .padding(10)
                            
                            
                            
                            VStack{
                                
                                HStack{
                                    
                                    Button("Reset") {
                                        key = ""
                                    }.padding(.horizontal).background(.white).cornerRadius(10).font(.system(size: 30, weight:.bold, design:.rounded))
                                }.offset(x: 130)
                                
                                
                                
                                
                                
                                HStack{
                                    Button("0") {
                                        key += "0"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("1") {
                                        key += "1"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 25).padding(.vertical,6).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("2") {
                                        key += "2"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("3") {
                                        key += "3"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("4") {
                                        key += "4"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    
                                    
                                }
                                HStack{
                                    Button("5") {
                                        key += "5"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("6") {
                                        key += "6"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("7") {
                                        key += "7"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("8") {
                                        key += "8"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("9") {
                                        key += "9"
                                        if Int(key) == hasil2{
                                            random2()
                                            key = ""
                                            blue()
                                            
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    
                                }
                            }
                            .padding(20)
                        }
                        
                    }
                    .offset(y:y2offset).rotationEffect(.degrees(180))
                }
                
            }.navigationBarBackButtonHidden(true)
        }
    }
    func random(){
        key2 = ""
        o2 = o.randomElement()!
        if o2 == "+"{
            c = randomNumber()
            d = randomNumber()
            hasil = c + d
        }else if o2 == "-"{
            c = randomNumber()
            d = randomNumber()
            while c<d {
                c = randomNumber()
            }
            hasil = c - d
        } else if o2 == "x"{
            c = randomNumber()
            d = randomNumber()
            hasil = c * d
        } else if o2 == "÷"{
            k1 = randomNumber()
            d = randomNumber()
            c = k1 * d
            hasil = c / d
        }
       
    }
    func random2(){
        key = ""
        o3 = o.randomElement()!
        if o3 == "+"{
            a = randomNumber()
            b = randomNumber()
            hasil2 = a + b
        }else if o3 == "-"{
            a = randomNumber()
            b = randomNumber()
            while a<b {
                a = randomNumber()
            }
            hasil2 = a - b
        } else if o3 == "x"{
            a = randomNumber()
            b = randomNumber()
            hasil2 = a * b
        } else if o3 == "÷"{
            k2 = randomNumber()
            b = randomNumber()
            a = k2 * b
            hasil2 = a / b
        }
       
    }
    func red() {
        trueMusic()
            withAnimation{
                rr -= 0.1
                if rr <= -0.5{
                    space2 = 800
                    yoffset = UIScreen.main.bounds.height + 200
                    y2offset = UIScreen.main.bounds.height + 200
                    tadaMusic()
                }
            }
        }
    func blue() {
        trueMusic()
            withAnimation{
                rr += 0.1
                
                if rr >= 0.5{
                    space = 800
                    yoffset = UIScreen.main.bounds.height + 200
                    y2offset = UIScreen.main.bounds.height + 200
                    tadaMusic()
                }
            }
        }
    func trueMusic() {
            if let musicURL = Bundle.main.url(forResource: "correct-choice-43861", withExtension: "mp3") {
                if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                    music = audioPlayer
                    music.numberOfLoops = 0
                    music.play()
                }
            }
        }
    func tadaMusic() {
            if let musicURL = Bundle.main.url(forResource: "tada-fanfare-a-6313", withExtension: "mp3") {
                if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                    music2 = audioPlayer
                    music2.numberOfLoops = 0
                    music2.play()
                }
            }
        }
}
func randomNumber() -> Int {
    let randomNumber = Int.random(in: 1..<10)
    return randomNumber
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
