//
//  Character.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 20.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

struct Character {
    let nameCharacter: String
    let classCharacter: String
    let descriptionCharacter: String
    let imageUrl: String
}

extension Character {
    static func getCharacter() -> [Character] {
        var charactersList = [Character]()

        for index in 0 ..< Characters().nameCharacters.count {
            charactersList.append (
                Character (
                    nameCharacter: Characters().nameCharacters[index],
                    classCharacter: Characters().classCharacters[index],
                    descriptionCharacter: Characters().descriptionCharacters[index],
                    imageUrl: Characters().imagesUrl[index]
                )
            )
        }
        return charactersList
    }
}
