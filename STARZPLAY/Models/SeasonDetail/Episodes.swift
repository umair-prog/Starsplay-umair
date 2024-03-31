/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Episodes : Codable {
	let air_date : String?
	let episode_number : Int?
	let episode_type : String?
	let id : Int?
	let name : String?
	let overview : String?
	let production_code : String?
	let runtime : Int?
	let season_number : Int?
	let show_id : Int?
	let still_path : String?
	let vote_average : Double?
	let vote_count : Int?
	let crew : [Crew]?
	let guest_stars : [Guest_stars]?

	enum CodingKeys: String, CodingKey {

		case air_date = "air_date"
		case episode_number = "episode_number"
		case episode_type = "episode_type"
		case id = "id"
		case name = "name"
		case overview = "overview"
		case production_code = "production_code"
		case runtime = "runtime"
		case season_number = "season_number"
		case show_id = "show_id"
		case still_path = "still_path"
		case vote_average = "vote_average"
		case vote_count = "vote_count"
		case crew = "crew"
		case guest_stars = "guest_stars"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		air_date = try values.decodeIfPresent(String.self, forKey: .air_date)
		episode_number = try values.decodeIfPresent(Int.self, forKey: .episode_number)
		episode_type = try values.decodeIfPresent(String.self, forKey: .episode_type)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		production_code = try values.decodeIfPresent(String.self, forKey: .production_code)
		runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
		season_number = try values.decodeIfPresent(Int.self, forKey: .season_number)
		show_id = try values.decodeIfPresent(Int.self, forKey: .show_id)
		still_path = try values.decodeIfPresent(String.self, forKey: .still_path)
		vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
		vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
		crew = try values.decodeIfPresent([Crew].self, forKey: .crew)
		guest_stars = try values.decodeIfPresent([Guest_stars].self, forKey: .guest_stars)
	}

}