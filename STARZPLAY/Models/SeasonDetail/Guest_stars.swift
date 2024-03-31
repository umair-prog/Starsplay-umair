

import Foundation
struct Guest_stars : Codable {
	let character : String?
	let credit_id : String?
	let order : Int?
	let adult : Bool?
	let gender : Int?
	let id : Int?
	let known_for_department : String?
	let name : String?
	let original_name : String?
	let popularity : Double?
	let profile_path : String?

	enum CodingKeys: String, CodingKey {

		case character = "character"
		case credit_id = "credit_id"
		case order = "order"
		case adult = "adult"
		case gender = "gender"
		case id = "id"
		case known_for_department = "known_for_department"
		case name = "name"
		case original_name = "original_name"
		case popularity = "popularity"
		case profile_path = "profile_path"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		character = try values.decodeIfPresent(String.self, forKey: .character)
		credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
		order = try values.decodeIfPresent(Int.self, forKey: .order)
		adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
		gender = try values.decodeIfPresent(Int.self, forKey: .gender)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		known_for_department = try values.decodeIfPresent(String.self, forKey: .known_for_department)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
		profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
	}

}
