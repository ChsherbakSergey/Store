//
//  GoodsLoader.swift
//  BlackStarWear
//
//  Created by Sergey on 7/4/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import Foundation

// MARK: - GoodsValue
struct GoodsValue: Codable {
    let name, englishName, sortOrder, article: String
    let collection: JSONNull?
    let goodsDescription: String
    let colorName: ColorName
    let colorImageURL: ColorImageURL
    let mainImage: String
    let productImages: [ProductImage]
    let offers: [Offer]
    let recommendedProductIDs: [String]
    let instagramPhotos: [JSONAny]
    let price: String
    let oldPrice, tag: String?
    let attributes: [Attribute]

    enum CodingKeys: String, CodingKey {
        case name, englishName, sortOrder, article, collection
        case goodsDescription = "description"
        case colorName, colorImageURL, mainImage, productImages, offers, recommendedProductIDs, instagramPhotos, price, oldPrice, tag, attributes
    }
}

// MARK: - Attribute
struct Attribute: Codable {
    let декоративныйЭлемент: ДекоративныйЭлемент?
    let сезон: Сезон?
    let состав: Состав?
    let странаПроизводителя: СтранаПроизводителя?
    let уходЗаВещами: УходЗаВещами?
    let рисунок: Рисунок?

    enum CodingKeys: String, CodingKey {
        case декоративныйЭлемент = "Декоративный элемент"
        case сезон = "Сезон"
        case состав = "Состав"
        case странаПроизводителя = "Страна производителя"
        case уходЗаВещами = "Уход за вещами"
        case рисунок = "Рисунок"
    }
}

enum ДекоративныйЭлемент: String, Codable {
    case вышивка = "вышивка"
    case нашивка = "нашивка"
    case принт = "принт"
    case принтнашивка = "принт; нашивка"
}

enum Рисунок: String, Codable {
    case другое = " другое"
    case звезды = "звезды"
    case логотип = "логотип"
    case надпись = " надпись"
    case звезда = "звезда"
    case животные = " животные"
    case орнамент = "орнамент"
}

enum Сезон: String, Codable {
    case круглогодичный = "круглогодичный"
}

enum Состав: String, Codable {
    case the100Хлопок = "100% хлопок"
    case the80Хлопок20Полиэстер = "80% хлопок; 20% полиэстер"
    case the80Хлопок20Эластан = "80% хлопок; 20% эластан"
    case хлопок = "100%  хлопок"
    case the100полиэстер = "100%  полиэстер"
}

enum СтранаПроизводителя: String, Codable {
    case россия = "Россия"
}

enum УходЗаВещами: String, Codable {
    case бережнаяСтиркаПри30Градусах = "бережная стирка при 30 градусах"
}

enum ColorImageURL: String, Codable {
    case imageCatalogStyleColorBlack000000Jpg = "image/catalog/style/color/black_000000.jpg"
    case imageCatalogStyleColorBlackGoldJpg = "image/catalog/style/color/black-gold.jpg"
    case imageCatalogStyleColorRedFf0000Jpg = "image/catalog/style/color/red_ff0000.jpg"
    case imageCatalogStyleColorVinousJpg = "image/catalog/style/color/vinous.jpg"
    case imageCatalogStyleColorPustoPng = "image/catalog/style/color/pusto.png"
    case imageCatalogStyleColorWhiteGif = "image/catalog/style/color/white.gif"
    case imageCatalogStyleColorGrey838383Jpg = "image/catalog/style/color/grey_838383.jpg"
    case imageCatalogStyleColorPurpleJpg = "image/catalog/style/color/purple.jpg"
}

enum ColorName: String, Codable {
    case бордовый = "Бордовый"
    case красный = "Красный"
    case черный = "Черный"
    case черныйЗолотой = "Черный/Золотой"
    case темноСиний = "Темно-синий"
    case белый = "Белый"
    case серый = "Серый"
    case фиолетовый = "Фиолетовый"
    case чайнаяроза = "Чайная роза"
    case белыйСерый = "Белый/Серый"
    case серыйЧерный = "Серый/Черный"
    case серыйТерракот = "Серый/Терракот"
}

// MARK: - Offer
struct Offer: Codable {
    let size: Size
    let productOfferID, quantity: String
}

enum Size: String, Codable {
    case l = "L"
    case m = "M"
    case s = "S"
    case xl = "XL"
    case xs = "XS"
    case xxl = "XXL"
    case xxs = "XXS"
    case xxxl = "XXXL"
    case единыйразмер = "Единый размер"
}

// MARK: - ProductImage
struct ProductImage: Codable {
    let imageURL, sortOrder: String
}

typealias Goods = [String: GoodsValue]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


// MARK: - Parse JSON

var listOfGoods: Goods?

func loadGoods(goodsID: Int, completed: @escaping () -> ()) {
    let urlString = "https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(goodsID)"
    let url = URL(string: urlString)
    
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if let data = data {
            do {
                let goods = try JSONDecoder().decode(Goods.self, from: data)
                listOfGoods = goods
                DispatchQueue.main.async {
                    completed()
                }
            } catch {
                print(error)
            }
        }
    }.resume()
}
