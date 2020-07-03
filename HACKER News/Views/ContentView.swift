//
//  ContentView.swift
//  HACKER News
//
//  Created by Marcin Miasko on 30/06/2020.
//  Copyright © 2020 Marcin Miasko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in //post=pojedynczy element z posts
                       //NavigationLink(destination: <#T##_#>, label: <#T##() -> _#>)
                //przekaż do docelowego okna po naciśnięciu elementu listy adres url
                //skojarzony z danym kliknięty postem
                NavigationLink(destination: DetailView(url: post.url)) {
                            //dla każdego elementu post z listy posts zwróć mini widok View zawierający
                            //np labelke Text()
                            HStack{
                                Text(String(post.points))
                                Text(post.title)
                                }
                        }
                    }
            .navigationBarTitle("H4CKER News")
        } //NavigationView
            
        .onAppear {  //onAppear() - odpowiednik Swiftowego viewDidLoad()
            self.networkManager.fetchData()
        }
        
        .onLongPressGesture {
            // testowy branch
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
