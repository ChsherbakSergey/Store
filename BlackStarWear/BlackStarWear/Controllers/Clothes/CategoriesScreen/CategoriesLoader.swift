//
//  CategoriesLoader.swift
//  BlackStarWear
//
//  Created by Sergey on 6/23/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import Foundation

// MARK: - CategoriesValue
struct CategoriesValue: Codable {
    let name, sortOrder, image, iconImage: String
    let iconImageActive: String
    let subcategories: [Subcategory]
}

// MARK: - Subcategory
struct Subcategory: Codable {
    let id: ID
    let iconImage: String
    let sortOrder: ID
    let name: String
    let type: TypeEnum
}

enum ID: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ID.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ID"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum TypeEnum: String, Codable {
    case category = "Category"
    case collection = "Collection"
}

typealias Categories = [String: CategoriesValue]


var listOfCategories: Categories?
    
    func loadCategories(completed: @escaping () -> ()) {
        let urlString = "https://blackstarshop.ru/index.php?route=api/v1/categories"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                do {
                    let categories = try JSONDecoder().decode(Categories.self, from: data)
                    listOfCategories = categories
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
var listOfSubcategories: Categories?

func loadSubcategories(completed: @escaping () -> ()) {
    let urlString = "https://blackstarshop.ru/index.php?route=api/v1/categories"
    let url = URL(string: urlString)

    URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if let data = data {
            do {
                let subcategories = try JSONDecoder().decode(Categories.self, from: data)
                listOfSubcategories = subcategories
                DispatchQueue.main.async {
                    completed()
                }
            } catch {
                print(error)
            }
        }
    }.resume()
}
