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
    let материал: Материал?
    let типЧехлов: ТипЧехлов?

    enum CodingKeys: String, CodingKey {
        case декоративныйЭлемент = "Декоративный элемент"
        case сезон = "Сезон"
        case состав = "Состав"
        case странаПроизводителя = "Страна производителя"
        case уходЗаВещами = "Уход за вещами"
        case рисунок = "Рисунок"
        case материал = "Материал"
        case типЧехлов = "Тип чехлов"
    }
}

//if title == "Чехлы на телефон" -> madeInLabel.text == "Тип Чехлов"

enum ТипЧехлов: String, Codable {
    case накладной = "накладной"
}


enum Материал: String, Codable {
    case натуральнаяКожа = "100% натуральная кожа"
    case ПВХ = "ПВХ"
    case пвх = "пвх"
    case силикон = "силикон"
    case деревоПвх = "дерево, пвх"
    case деревоПВХ = "дерево; ПВХ"
    case текстиль = "текстиль"
    case экокожа = "экокожа"
    case текстильЭкокожа = "текстиль; экокожа"
    case натуральныйКамень = "натуральный камень: черный - шунгит; зеленый - малахит; красный - майорка; коричневый - тигровый глаз; серый - яшма; белый - кахолонг; синий - содалит "
    case нержавеющаяСталь = "нержавеющая сталь; гематит"
    case шунгитАгатГематит = "шунгит; агат; гематит"
    case лава100ГематитШунгит = "лава - 100%; гематит; шунгит"
    case пластмасса = "пластмасса"
    case керамика = "керамика"
    case металл = "металл"
    case бумага = "бумага"
    case алюминиевыйСплав = "Алюминиевый сплав\r\nСостав: Алюминий - Al, Магний - Mg, Кремний - Si, Цинк -Zn, Марганец - Mn, ,Бериллий - Be."
    case велюроваяТкань = "велюровая ткань"
}

enum ДекоративныйЭлемент: String, Codable {
    case вышивка = "вышивка"
    case нашивка = "нашивка"
    case принт = "принт"
    case принтнашивка = "принт; нашивка"
    case принтованноеПолотно = "принтованное полотно"
    case тиснение = "тиснение"
    case print3D = "3D принт"
    case безЭлементов = "без элементов"
    case аппликация = "аппликация"
    case звезда = "звезда"
    case серыйЯшмаЧерныйОниксЦепьХирургическаяСталь = "серый - яшма; черный - оникс; цепь - хирургическая сталь"
}

enum Рисунок: String, Codable {
    case другое = " другое"
    case звезды = "звезды"
    case логотип = "логотип"
    case надпись = " надпись"
    case звезда = "звезда"
    case животные = " животные"
    case животные2 = "животные"
    case орнамент = "орнамент"
    case животныеНадпись = " животные; надпись"
    case надписьГерб = " надпись; герб"
    case сюжет = "сюжет"
    case номер = "номер"
    case вышивка = "вышивка"
    case цифры = "цифры"
}

enum Сезон: String, Codable {
    case круглогодичный = "круглогодичный"
    case демисезон = "демисезон"
    case лето = "лето"
    case зима = "зима"
    case внесезон = "Всесезон"
    case веснаЛето = "весна-лето"
}

enum Состав: String, Codable {
    case the100Хлопок = "100% хлопок"
    case the80Хлопок20Полиэстер = "80% хлопок; 20% полиэстер"
    case the80Хлопок20Эластан = "80% хлопок; 20% эластан"
    case хлопок = "100%  хлопок"
    case the100полиэстер = "100%  полиэстер"
    case the100полиэстер2 = "100% полиэстер"
    case the60Хлопок40Полиэстер = "60% хлопок; 40% полиэстер"
    case the80хлопок20полиэстер = "80%  хлопок; 20% полиэстер"
    case the65хлопок35полиэстер = "65% хлопок; 35% полиэстер"
    case хлопок8020Полиэстер = "80% хлопок, 20% полиэстер"
    case the95хлопок5эластан = "95% хлопок; 5% эластан"
    case the50хлопок50эластан = "50% хлопок; 50% эластан"
    case хлопок8020полиэстер = "80% хлопок; 20%  полиэстер"
    case the90хлопок10эластан = "90% хлопок; 10% эластан"
    case ПВХ = "ПВХ"
    case пвх = "пвх"
    case хлопок88эластан10полиамид2 = "88% хлопок, 10% эластан, 2% полиамид"
    case хлопок8015полиамидэластан5 = "80% хлопок, 15% полиамид, 5% эластан"
    case пластмасса = "пластмасса"
}

enum СтранаПроизводителя: String, Codable {
    case россия = "Россия"
    case китай = "Китай"
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
    case imageCatalogStyleColorCamouflageJPG = "image/catalog/style/color/camouflage.jpg"
    case imageCatalogStyleColorKhakic3b091JPG = "image/catalog/style/color/khaki_c3b091.jpg"
    case imageCatalogStyleColorOrangeffa500PNG = "image/catalog/style/color/orange-ffa500.png"
    case imageCatalogStyleColorBlackRed000000 = "image/catalog/style/color/black_red_000000.jpg"
    case imageCatalogStyleColorLightPinkJPG = "image/catalog/style/color/lightpink.jpg"
    case imageCatalogStyleColorBeigeF5F5DCJPG = "image/catalog/style/color/beige_F5F5DC.jpg"
    case imageCatalogStyleColorGrayMelangeDbd6dcJPG = "image/catalog/style/color/gray_melange_dbd6dc.jpg"
    case imageCatalogStyleColorLime00ff00PNG = "image/catalog/style/color/lime_00ff00.png"
    case imageCatalogStyleColorYellowFFFF00JPG = "image/catalog/style/color/yellow_ffff00.jpg"
    case imageCatalogStyleColorBlackCamJPG = "image/catalog/style/color/black-cam.jpg"
    case imageCatalogStyleColorDarkGrayMelange60606dJPG = "image/catalog/style/color/dark_gray_melange_60606d.jpg"
    case imageCatalogStyleColorBrown964b00JPG = "image/catalog/style/color/brown_964b00.jpg"
    case imageCatalogStyleColorGoldJPG = "image/catalog/style/color/gold.jpg"
    case imageCatalogStyleColorBlue000ffJPG = "image/catalog/style/color/blue_0000ff.jpg"
    case imageCatalogStyleColorBlackWhite000fff = "image/catalog/style/color/black_white_000fff.jpg"
    case imageCatalogStyleColorSerebroJPG = "image/catalog/style/color/serebro.jpg"
    case imageCatalogStyleColorBlackGreyJPG = "image/catalog/style/color/black-grey.jpg"
    case imageCatalogStyleColorGreen008000JPG = "image/catalog/style/color/green_008000.jpg"
    case imageCatalogStyleColorPersikJPG = "image/catalog/style/color/persik.jpg"
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
    case камуфляж = "Камуфляж"
    case хаки = "Хаки"
    case темныйХаки = "Тёмный хаки"
    case оранжевый = "Оранжевый"
    case черныйКрасный = "Черный/Красный"
    case антрацитМеланж = "Антрацит меланж"
    case розовый = "Розовый"
    case бежевый = "Бежевый"
    case серыйМеланж = "Серый меланж"
    case лаймовый = "Лаймовый"
    case темноЗеленый = "Темно-зеленый"
    case изумрудный = "Изумрудный"
    case желтый = "Желтый"
    case сиреневый = "Сиреневый"
    case черныйКамуфляж = "Черный/Камуфляж"
    case серыйСиний = "Серый/Синий"
    case темноСерый = "Темно-серый"
    case прозрачный = "Прозрачный"
    case черныйФиолетовый = "Черный/Фиолетовый"
    case коричневый = "Коричневый"
    case черныйСалатовый = "Черный/Салатовый"
    case черныйЖелтый = "Черный/Желтый"
    case золотой = "Золотой"
    case черныйБирюзовый = "Черный/Бирюзовый"
    case синий = "Синий"
    case черныйБелый = "Черный/Белый"
    case мультиколор = "Мультиколор"
    case серебряный = "Серебряный"
    case черныйСеребряный = "Черный/Серебряный"
    case градиент = "Градиент"
    case зеленый = "Зеленый"
    case персиковый = "Персиковый"
    case коричневыйГрадиент = "Коричневый градиент"
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
    case xxxs = "XXXS"
    case lxl = "L/XL"
    case sm = "S/M"
    case единыйразмер = "Единый размер"
    case threeYears = "3 года"
    case fourYears = "4 года"
    case sixYears = "6 лет"
    case sevenYears = "7 лет"
    case eightYears = "8 лет"
    case fiveYears = "5 лет"
    case oneToTwoYears = "1-2 лет"
    case nineToTenYears = "9-10 лет"
    case elevenToTwelveYears = "11-12 лет"
    case threeToFourYears = "3-4"
    case threeToFourYears2 = "3-4 лет"
    case fourToFiveYears = "4-5 лет"
    case sevenToNineYears = "7-9 лет"
    case eightyFiveCM = "85 см"
    case nintyFiveCM = "95 см"
    case oneHundredAndFiveCM = "105 см"
    case oneHundredAndFifteenCM = "115 см"
    case oneHundredAndTwentyCM = "120 см"
    case iphone10 = "X (10)/XS (10S)"
    case iphoneSeven = "7"
    case iphone7and8 = "7/8"
    case iphone7and8plus = "7+/8+"
    case iphoneEight = "8"
    case iphone6 = "6"
    case iphone6plus = "6+"
    case xsmax = "XSMax (10SMax)"
    case eleven = "11"
    case elevenPro = "11 Pro"
    case elevenProMax = "11 Pro MAX"
    case iphoneXR = "XR"
    case iphoneX10 = "X (10)"
    case samsungS8plus = "SAMSUNG S8+"
    case samsungS9 = "SAMSUNG S9"
    case samsungS9plus = "SAMSUNG S9+"
    case fortyOneToFortyThree = "41-43"
    case thirtySixToThirtyEight = "36/38"
    case thirtyNineToForty = "39/40"
    case thirtyFiveToThirtySeven = "35/37"
    case fortyOneToFortyTwo = "41/42"
    case thirtyFiveToThirtySeven2 = "35-37"
    case thirtyEightToForty = "38-40"
    case thirtySevenToThirtyEight = "37/38"
    case the21x15x5 = "21*15*5"
    case the20x30x12 = "20*30*12"
    case the50x36x16 = "50*36*16"
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
