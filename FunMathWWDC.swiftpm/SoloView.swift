//
//  SoloView.swift
//  FunMath
//
//  Created by Cliffton S on 06/05/23.
//

import SwiftUI
import AVKit


struct SoloView: View {
    @AppStorage("username") var highscore: Int = 0
    @State var c = randomNumber()
    @State var d = randomNumber()
    @State var rr = 0.0
    @State var key2 = ""
    @State var space2 = 50
    @State var score = 0
    @State var time = 0
    @State var hasil = 0
    @State var k1 = 0
    @State var start = false
    @State var music: AVAudioPlayer!
    @State var music2: AVAudioPlayer!
    @State var timeSpacing = UIScreen.main.bounds.width * 2
    @State var yoffset = 0.3 * UIScreen.main.bounds.height
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack(spacing: 0){
                    Image("Image1").resizable().foregroundColor(.blue).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y:rr*UIScreen.main.bounds.height)
                }
                if start == false{
                    VStack{
                        VStack{
                            Text("How to play?").font(.largeTitle)
                            Text("1. fill the blanks with the answers of the questions").font(.title2).multilineTextAlignment(.center)
                            Text("2. Keep the water not run out").font(.title2).multilineTextAlignment(.center)
                        }.padding(.horizontal)
                        Button("Start") {
                            random()
                            start = true
                        }.font(.title).padding().background(.white).cornerRadius(10)
                    }
                }else{
                    HStack(spacing: timeSpacing){
                        Text(String(time)+"S")
                            .font(.system(size: 35, weight:.bold, design:.rounded))
                            .foregroundColor(.white)
                            .padding(20)
                            .rotationEffect(.degrees(180))
                        
                        
                        Text(String(time)+"S")
                            .font(.system(size: 35, weight:.bold, design:.rounded))
                            .foregroundColor(.white)
                            .padding(20)
                        
                        
                    }
                    .onReceive(timer) { _ in
                        if rr < 1 {
                            time += 1
                            if time <= 20{
                                withAnimation{
                                    rr += 0.03333334
                                }
                            }
                            else if time <= 45 && time > 20{
                                withAnimation{
                                    rr += 0.03333334 * 2
                                }
                            }
                            else{
                                withAnimation{
                                    rr += 0.03333334 * 3
                                }
                            }
                            if rr > 1{
                                self.timer.upstream.connect().cancel()
                                withAnimation{
                                    yoffset = UIScreen.main.bounds.height + 200
                                    space2 = -750
                                    timeSpacing = 1.1 * UIScreen.main.bounds.width
                                }
                                if score > highscore {
                                    highscore = score
                                }
                                tadaMusic()
                                
                                
                            }
                        }else{
                            self.timer.upstream.connect().cancel()
                            withAnimation{
                                yoffset = UIScreen.main.bounds.height + 200
                                space2 = -750
                                timeSpacing = 1.1 * UIScreen.main.bounds.width
                            }
                            if score > highscore {
                                highscore = score
                            }
                            tadaMusic()
                            
                            
                        }
                        
                        
                    }
                    VStack(spacing:UIScreen.main.bounds.height + 200){
                        Text("")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight:.bold, design:.rounded))
                            .rotationEffect(.degrees(180))
                        VStack{
                            
                            Text(score == 0 ? "Try to answer the question" :"Good job!")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight:.bold, design:.rounded))
                            Text("Score : \(score)")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight:.bold, design:.rounded)).padding(.bottom)
                            
                            Text("High Score : \(highscore)")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight:.bold, design:.rounded)).padding(.bottom)
                            
                            
                            
                            Button("Play Again") {
                                key2 = ""
                                score = 0
                                random()
                                time = 0
                                start = true
                                space2 = 0
                                rr = 0
                                yoffset = 0.3 * UIScreen.main.bounds.height
                            }.font(.title3).fontWeight(.bold).foregroundColor(.black).padding(.horizontal, 80).padding(.vertical, 12).background(Color(.white)).cornerRadius(10)
                                
                            
                            NavigationLink(destination: MenuView().preferredColorScheme(.light)) {
                                Text("Home").font(.title3).fontWeight(.bold).foregroundColor(.white).padding(.horizontal, 100).padding(.vertical, 12).background(Color("Colorbtn")).cornerRadius(10)
                            }
                            
                            
                        }.offset(y: CGFloat(space2))
                        
                    }
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
                                            score += 1
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("1") {
                                        key2 += "1"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            score += 1
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 25).padding(.vertical,6).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("2") {
                                        key2 += "2"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            score += 1
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("3") {
                                        key2 += "3"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            score += 1
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("4") {
                                        key2 += "4"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            score += 1
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
                                            score += 1
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("6") {
                                        key2 += "6"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            score += 1
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("7") {
                                        key2 += "7"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            score += 1
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("8") {
                                        key2 += "8"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            score += 1
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    Button("9") {
                                        key2 += "9"
                                        if Int(key2) == hasil{
                                            random()
                                            key2 = ""
                                            red()
                                            score += 1
                                        }
                                    }.foregroundColor(.black).padding(.horizontal, 23).padding(.vertical,5).background(.white).cornerRadius(5).font(.largeTitle)
                                    
                                }
                            }
                            .padding(20)
                        }
                        
                    }
                    .offset(y:yoffset)
                }
                
            }
        }.navigationBarBackButtonHidden(true)
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
    func red() {
        trueMusic()
        withAnimation{
            if rr >= 0.10000002{
                rr -= 0.10000002
            }
            if rr < 0.10000002 && rr > 0.06666668{
                rr -= 0.06666668
            }
            if rr < 0.06666668 && rr > 0.03333334{
                rr -= 0.03333334
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


struct SoloView_Previews: PreviewProvider {
    static var previews: some View {
        SoloView()
    }
}
