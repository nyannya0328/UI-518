//
//  ContentView.swift
//  UI-518
//
//  Created by nyannyan0328 on 2022/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
