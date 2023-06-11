//
//  ModelData.swift
//  Landmarks
//
//  Created by HikaruKondo on 2023/06/09.
//

import Foundation

// var landmarks: [Landmark] = load("landmarkData.json")

// q: このクラスに関してswift初心者でもわかるように説明をしてください。
// a: このクラスは、Landmarkのデータを読み込むためのクラスです。
//    このクラスは、ObservableObjectを継承しています。
//    ObservableObjectは、データの変更を監視するためのプロトコルです。
//    このクラスは、@Publishedをつけることで、データの変更を監視することができます。
// q: ObservableObjectについてより詳しく説明してください
// a: ObservableObjectは、データの変更を監視するためのプロトコルです。
//    このプロトコルを継承したクラスは、@Publishedをつけることで、データの変更を監視することができます。
// q: ObservableObjectを継承していない場合、@Publishedをつけることはできますか？
// a: できません。
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")

    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }

    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)

    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
