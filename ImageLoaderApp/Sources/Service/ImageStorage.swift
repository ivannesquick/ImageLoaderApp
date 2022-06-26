//
//  ImageStorage.swift
//  ImageLoaderApp
//
//  Created by Иван Нескин on 22.06.2022.
//

import Foundation

class ImageStorage {
    static let shared: ImageStorage = {
       return ImageStorage()
    }()
    
    func getFullURLList() -> [CollectionImage] {
        return [
        CollectionImage(imageURL: "https://s.auto.drom.ru/photo/aMRBmiu4QPYfPN3vieEKSHA97KLl68krxOLrnotCWYMGcrvYTeNbRqa_0GK4hOXhYgfm0kvROVZxqZGE_fWv6NFDn9Uh.jpg"),
        CollectionImage(imageURL: "https://s.auto.drom.ru/photo/B6gZeNWd1gaexMTfno4YD4x8MsO8Mk_tRP2kP29ZswuNn2faeggKhlurp3f3P22Gr9899mU-V5pABYU2nR8jHGof5kCZ.jpg"),
        CollectionImage(imageURL: "https://s.auto.drom.ru/photo/mlu1auTqkvbr9F8OM1EGvgVU-i1SdDBV8WE0-f7Y74zH2I5G5m0xGjsHIKETLOA8XOWrHNjTVWQo_aHYqMCvKeZsA6-r.jpg"),
        CollectionImage(imageURL: "https://s.auto.drom.ru/photo/KAYEdgC9NfCbthO46uCFquTy99OdGfW-Z4Z3vVF765EJPZQS8xlam34cstNwNMjjdA6PANwKkIFpz4I7bao0qQT1LI4e.jpg"),
        CollectionImage(imageURL: "https://s.auto.drom.ru/photo/WgzFGmuU0m-n6KBup60fb2cbB2wZeHrzyqU2tEHYJxtEwTZe7yIpZVKm7NvXzowqkLfzEdnC_AndCURYwg331hVby5R2.jpg"),
        CollectionImage(imageURL: "https://s.auto.drom.ru/photo/EcyVXko6fq6jEqbvx_f82GMQMf5_mFh5MZGxG8dxXIk41PUr2kyYZeE5dDbNP-v-W0hii3cAEGaMW8z8Dsbh4FkMbqeW.jpg")
        ]
    }
}
