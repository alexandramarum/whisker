import Foundation
import UIKit
// Frontend pet model
// probably not necessary. Might move the logic back to Animal struct for concision.
struct Pet: Identifiable, Hashable {
    let id = UUID()
    let ageGroup: String
    let ageString: String
    let birthDate: String
    let breedPrimary: String
    let breedSecondary: String
    let colorDetails: String
    let descriptionText: String
    let name: String
    let pictureThumbnailUrl: UIImage?
    let sex: String
    let sizeUOM: String
    let createdDate, updatedDate: String
    
    static var example: Pet {
        let url = URL(string: "https://cdn.rescuegroups.org/16/pictures/animals/100/100000/175990.jpg?width=100")
        var image: UIImage?
        do {
            let data = try Data(contentsOf: url!)
            let image = UIImage(data: data)
        } catch {
            print("Image failed")
        }
        
        return Pet(
            ageGroup: "Young",
            ageString: "1",
            birthDate: "February 1",
            breedPrimary: "Bulldog",
            breedSecondary: "Poodle",
            colorDetails: "Brown and white",
            descriptionText: "Looks like my cousin's ugly dog. Has a good heart though.",
            name: "Monster",
            pictureThumbnailUrl: image,
            sex: "Male",
            sizeUOM: "Pounds",
            createdDate: "2008",
            updatedDate: "2010")
    }
}



// Request structs
struct AnimalSearchRequest: Codable {
    let apikey: String
    let objectType: String
    let objectAction: String
    let search: Search
}

struct Search: Codable {
    let resultStart: Int
    let resultLimit: Int
    let resultSort: String
    let resultOrder: String
    let calcFoundRows: String
    let filters: [Filter]
    let fields: [String]
}

struct Filter: Codable {
    let fieldName: String
    let operation: String
    let criteria: String
}

// Response structs

struct AnimalData: Codable {
    let data: [Animal]
}

struct Animal: Codable {
    let attributes: AnimalAttributes
//    let relationships: Relationships
}

struct AnimalAttributes: Codable {
    let ageGroup: String?
    let ageString: String?
    let birthDate: String?
    let isBirthDateExact: Bool?
    let breedPrimary: String?
    let breedSecondary: String?
    let colorDetails: String?
    let descriptionText: String?
    let name: String?
    let pictureThumbnailUrl: String?
    let sex: String?
    let sizeUOM: String?
    let createdDate, updatedDate: String?
    // Add more attributes as needed
}




// Additional data including location stuffs


//struct Relationships: Codable {
//    let breeds: BreedRelationship?
//    let species: SpeciesRelationship?
//    let statuses: StatusRelationship?
//    let locations: LocationRelationship?
//    let orgs: OrgRelationship?
//}
//
//struct BreedRelationship: Codable {
//    let data: [BreedData]
//}
//
//struct BreedData: Codable {
//    let type: String
//    let id: String
//}
//
//struct SpeciesRelationship: Codable {
//    let data: [SpeciesData]
//}
//
//struct SpeciesData: Codable {
//    let type: String
//    let id: String
//}
//
//struct StatusRelationship: Codable {
//    let data: [StatusData]
//}
//
//struct StatusData: Codable {
//    let type: String
//    let id: String
//}
//
//struct LocationRelationship: Codable {
//    let data: [LocationData]
//}
//
//struct LocationData: Codable {
//    let type: String
//    let id: String
//}
//
//struct OrgRelationship: Codable {
//    let data: [OrgData]
//}
//
//struct OrgData: Codable {
//    let type: String
//    let id: String
//}
//
//struct PictureRelationship: Codable {
//    let data: [PictureData]
//}
//
//struct PictureData: Codable {
//    let type: String
//    let id: String
//}

// Decode JSON data into Swift structs
