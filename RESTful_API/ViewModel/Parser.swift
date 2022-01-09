//
//  Parser.swift
//  RESTful_API
//
//  Created by Naveen Varma on 2022-01-08.
//  Copyright © 2022 naveen. All rights reserved.
//

import Foundation

struct Parser {
    
    func parse(complete: @escaping ([Datum]) -> ()){
        
        let api = URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population")
        
        let task = URLSession.shared.dataTask(with: api!) { (data, res, err) in
            
            if err != nil {
                print(err?.localizedDescription)
                return
            }
            
            do{
                let result = try JSONDecoder().decode(Nation.self, from: data!)
                complete(result.data)
            }
            catch{
                
            }
        }
        task.resume()
    }

}
