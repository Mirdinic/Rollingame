//
//  ContentView.swift
//  GameRolling
//
//  Created by Mirdin Sadykov on 8/16/21.
//

import SwiftUI

struct ContentView: View {
   @State private var symbols = ["electro","otboy","shur"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var credits = 1000
    private var betAmount = 5
    var body: some View {
        ZStack{
            Image("background")
            Rectangle()
                .foregroundColor(.green)
        VStack{
            Spacer()
                        HStack{
                        
                Image(systemName: "star.fill")
                    .font(.system(size: 30))
                    
               
                .foregroundColor(Color.orange)
             
            Text("Mirdins Slots!")
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                Image(systemName: "star.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color.orange)
            
            }
            Spacer()
                Text("Credits: " + String(credits))
                    .padding()
                    .background(Color.white
                                    .opacity(0.4))
                    .cornerRadius(25)
            Spacer()
            VStack{
                HStack{
                    Spacer()
                   CardView(symbol: $symbols[numbers[0]])
                    CardView(symbol: $symbols[numbers[1]])
                    CardView(symbol: $symbols[numbers[2]])
                    Spacer()
                }
                HStack{
                    Spacer()
                   CardView(symbol: $symbols[numbers[3]])
                    CardView(symbol: $symbols[numbers[4]])
                    CardView(symbol: $symbols[numbers[5]])
                    Spacer()
                }
                HStack{
                    Spacer()
                   CardView(symbol: $symbols[numbers[6]])
                    CardView(symbol: $symbols[numbers[7]])
                    CardView(symbol: $symbols[numbers[8]])
                    Spacer()
                }
            }
            Spacer()
            HStack(spacing:20){
            VStack{
                Button(action: {
                    self.processResults()
                }, label: {
                    Text("   Spin   ")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(25)
                })
                Text("\(betAmount) credits")
                    .font(.footnote)
                
            }
                VStack{
                Button(action: {
                    self.processResults(true)
                }, label: {
                    Text("   Maxspin   ")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(25)
                })
                Text("\(betAmount * 5) credits")
                    .font(.footnote)
            }
            }
            Spacer()
        }
        .padding()

    }
     
    }
    func processResults(_ isMax: Bool = false){
        if isMax{
            self.numbers = self.numbers.map({ _ in
                Int.random(in: 0...self.symbols.count - 1)
            })
        }
        else{
            self.numbers[3] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count - 1)
        }
       
        ProcessWin(isMax)
       
    }
   


    func ProcessWin(_ isMax:Bool = false){
        var matches = 0
        if !isMax{
            if isMatch(3, 4, 5){
                matches +=  1
            }
        
        }
        else{
            if isMatch(0, 1, 2){
                matches +=  1
            }
            if isMatch(3, 4, 5){
                matches +=  1
            }
            if isMatch(6, 7, 8){
                matches +=  1
            }
            if isMatch(0, 4, 8){
                matches +=  1
            }
            if isMatch(2, 4, 6){
                matches +=  1
            }
          
            
        }
            
            if matches>0{
                self.credits += matches * betAmount * 2
            }else if !isMax{
                self.credits -= betAmount
            }else{
                self.credits -= betAmount * 5
            }
       
    }
          
    func isMatch(_ index1: Int,_ index2: Int,_ index3: Int)->Bool{
        if self.numbers[index1] == self.numbers[index2]&&self.numbers[index2]==self.numbers[index3]{
            return true
        }
        return false
    }
}
        
        
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
