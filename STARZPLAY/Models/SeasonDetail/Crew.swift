/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Crew : Codable {
	let job : String?
	let department : String?
	let credit_id : String?
	let adult : Bool?
	let gender : Int?
	let id : Int?
	let known_for_department : String?
	let name : String?
	let original_name : String?
	let popularity : Double?
	let profile_path : String?

	enum CodingKeys: String, CodingKey {

		case job = "job"
		case department = "department"
		case credit_id = "credit_id"
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
		job = try values.decodeIfPresent(String.self, forKey: .job)
		department = try values.decodeIfPresent(String.self, forKey: .department)
		credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
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