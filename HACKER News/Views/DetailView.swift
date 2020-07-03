//
//  DetailView.swift
//  HACKER News
//
//  Created by Marcin Miasko on 01/07/2020.
//  Copyright © 2020 Marcin Miasko. All rights reserved.
//

import SwiftUI

    struct DetailView: View {
        
        let url:  String?
        
        var body: some View {
            WebView(urlString: url)
            .navigationBarTitle(url!)
        }
    }






struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
