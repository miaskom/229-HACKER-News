//
//  PostData.swift
//  HACKER News
//
//  Created by Marcin Miasko on 30/06/2020.
//  Copyright © 2020 Marcin Miasko. All rights reserved.
//

import Foundation


//odwzorowanie struktury rezultatu zwracanego w formacie JSON w wyniku zapytania
//   https://hn.algolia.com/api/v1/search?tags=front_page


struct Results: Decodable {
    let hits: [Post]  //hits zawiera listę obiektów, którą nazywamy tutaj sobie Post
                      //i definiujemy ich strukturę w dalszej części pliku
   
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
