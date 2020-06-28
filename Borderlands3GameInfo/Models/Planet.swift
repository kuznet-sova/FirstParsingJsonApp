//
//  Planet.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 21.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

struct Planet {
    let namePlanet: String
    let descriptionPlanet: String
    let imageUrl: String
}

extension Planet {
    static func getPlanet() -> [Planet] {
        var planetsList = [Planet]()

        for index in 0 ..< Planets().namePlanets.count {
            planetsList.append (
                Planet (
                    namePlanet: Planets().namePlanets[index],
                    descriptionPlanet: Planets().descriptionPlanets[index],
                    imageUrl: Planets().imagesUrl[index]
                )
            )
        }
        return planetsList
    }
}
