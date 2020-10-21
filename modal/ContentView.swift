//
//  ContentView.swift
//  modal
//
//  Created by Macbook Pro on 10/21/20.
//  Copyright © 2020 tendi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isPresentedStandard = false
    @State var isPresentedFull = false
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    Button(action: {
                        withAnimation {
                            self.isPresentedFull.toggle()
                        }
                    }, label: {
                        Text(" Full Modal")
                    }).padding(.bottom, 20)
                    
                    Button(action: {
                        self.isPresentedStandard.toggle()
                    }, label: {
                        Text(" Standard Modal")
                    })
                }.navigationBarTitle("Modal")
                    .sheet(isPresented: $isPresentedStandard, content: {
                        Button(action: {
                            self.isPresentedStandard.toggle()
                        }, label: {
                            Text("close modal")
                        })
                    })
            }
            
            ZStack{
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {
                                withAnimation{
                                    self.isPresentedFull.toggle()
                                }
                            }, label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.black)
                            }).padding(.trailing, 10)
                        }
                        Spacer()
                    }.padding(.top, 50)
                    Spacer()
                }
                 
            }.background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
                .offset(x:0,y:self.isPresentedFull ? 0 : 1000)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
