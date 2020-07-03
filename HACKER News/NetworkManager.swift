//
//  NetworkManager.swift
//  HACKER News
//
//  Created by Marcin Miasko on 30/06/2020.
//  Copyright © 2020 Marcin Miasko. All rights reserved.
//

import Foundation

class NetworkManager : ObservableObject {
 
    @Published var posts = [Post]()
    
    func fetchData(){
         //1. utworz obiekt klay URL np na podst. stringa (jest wiele innych opcji konstruktorów dla URL
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
                //2. Utwórz obiekt URLSession
                let session = URLSession(configuration: .default)
                //3. Przekaż zadanie do wykonania dla sesji
                //jako completionHandler trzeba przekazać wskaźnik do funkcji która zostanie wywołana
                //po zakończeniu taska. Metode tą trzeba sobie samemu napisać i dać jej takie
                //parametry jakie są podpowiedzi czyli (Data?, URLResponse?, Error?) -> Void
            
                let task = session.dataTask(with: url) { (data, reponse, error) in
                                                        if error == nil {
                                                            let decoder = JSONDecoder()
                                                            if let safeData = data {
                                                                do {
                                                                    let results = try decoder.decode(Results.self, from: safeData)
                                                                    DispatchQueue.main.async { //w głównym wątku
                                                                        self.posts = results.hits
                                                                    }
                                                                    
                                                                }
                                                                catch {
                                                                    print(error)
                                                                }
                                                            } //if let
                                                            
                                                       }
                                }

                 //4. Wystartuj zadnie
                task.resume()
        }//if let
    } //func
        
}
