//
//  CardView.swift
//  GameRolling
//
//  Created by Mirdin Sadykov on 8/18/21.
//

import SwiftUI

struct CardView: View {
    @Binding var symbol:String
    var body: some View {
        Image (symbol)
            .resizable()
            .cornerRadius(20)
            .scaledToFit()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("otboy"))
    }
}
