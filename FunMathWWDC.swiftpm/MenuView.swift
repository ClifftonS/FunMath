//
//  MenuView.swift
//  FunMath
//
//  Created by Cliffton S on 07/05/23.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("Home").resizable().ignoresSafeArea()
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    NavigationLink(destination: SoloView().preferredColorScheme(.light)) {
                        Text("1 Player").font(.title3).fontWeight(.bold).foregroundColor(.white).padding(.horizontal, 100).padding(.vertical, 12).background(Color("Colorbtn")).cornerRadius(10)
                    }.padding(.vertical)
                    NavigationLink(destination: ContentView().preferredColorScheme(.light)) {
                        Text("2 Player").font(.title3).fontWeight(.bold).foregroundColor(.white).padding(.horizontal, 100).padding(.vertical, 12).background(Color("Colorbtn")).cornerRadius(10)
                    }
                    Spacer()
                    
                }
                
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
