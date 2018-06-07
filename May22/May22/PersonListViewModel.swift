//
//  PersonListViewModel.swift
//  May22
//
//  Created by Daniel Kong on 5/23/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

import Foundation

protocol PersonListProtocol: class {
    func updatedData()
}
class PersonListViewModel {
    private let kFileName = "Jack_Johnson"

    weak var presenter: PersonListProtocol?
    var persons: [Person] = []
    
    
    func fetchData() {
        DispatchQueue.global().async {
            if let url = Bundle.main.url(forResource: self.kFileName, withExtension: "json") {
                self.persons.removeAll()
                if let data = try? Data(contentsOf: url) {
                    // serialization
//                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
//                        if let dict = json as? NSDictionary {
//                            if let arr = dict["results"] as? NSArray {
//                                for item in arr {
//                                    if let personJSON = item as? NSDictionary {
//                                        let person = Person.init(id: personJSON["id"] as? Int, firstName: (personJSON["firstName"] as? String), lastName: personJSON["lastName"] as? String, role: (personJSON["role"] as! String), url: personJSON["url"] as? String)
//                                        self.persons.append(person)
//                                    }
//                                }
//                            }
//                        }
//                    }
                    // Decoder
                    if let json = try? JSONDecoder().decode([Person].self, from: data) {
                        self.persons = json
//                        self.persons = json.results ?? []
                    }
                    DispatchQueue.main.async {
                        self.presenter?.updatedData()
                    }
                   
                }
            }
            
        }
    }
}
