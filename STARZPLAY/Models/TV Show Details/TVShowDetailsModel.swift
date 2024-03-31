

import Foundation
struct TVShowDetailsModel : Codable {
	let adult : Bool?
	let backdrop_path : String?
	let created_by : [Created_by]?
	let episode_run_time : [Int]?
	let first_air_date : String?
	let genres : [Genres]?
	let homepage : String?
	let id : Int?
	let in_production : Bool?
	let languages : [String]?
	let last_air_date : String?
	let last_episode_to_air : Last_episode_to_air?
	let name : String?
	let next_episode_to_air : String?
	let networks : [Networks]?
	let number_of_episodes : Int?
    let number_of_seasons : Int?
	let origin_country : [String]?
	let original_language : String?
	let original_name : String?
	let overview : String?
	let popularity : Double?
	let poster_path : String?
	let production_companies : [Production_companies]?
	let production_countries : [Production_countries]?
	let seasons : [Seasons]?
	let spoken_languages : [Spoken_languages]?
	let status : String?
	let tagline : String?
	let type : String?
//	let vote_average : Double?
	let vote_count : Int?

	enum CodingKeys: String, CodingKey {

		case adult = "adult"
		case backdrop_path = "backdrop_path"
		case created_by = "created_by"
		case episode_run_time = "episode_run_time"
		case first_air_date = "first_air_date"
		case genres = "genres"
		case homepage = "homepage"
		case id = "id"
		case in_production = "in_production"
		case languages = "languages"
		case last_air_date = "last_air_date"
		case last_episode_to_air = "last_episode_to_air"
		case name = "name"
		case next_episode_to_air = "next_episode_to_air"
		case networks = "networks"
		case number_of_episodes = "number_of_episodes"
		case number_of_seasons = "number_of_seasons"
		case origin_country = "origin_country"
		case original_language = "original_language"
		case original_name = "original_name"
		case overview = "overview"
		case popularity = "popularity"
		case poster_path = "poster_path"
		case production_companies = "production_companies"
		case production_countries = "production_countries"
		case seasons = "seasons"
		case spoken_languages = "spoken_languages"
		case status = "status"
		case tagline = "tagline"
		case type = "type"
//		case vote_average = "vote_average"
		case vote_count = "vote_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
		backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
		created_by = try values.decodeIfPresent([Created_by].self, forKey: .created_by)
		episode_run_time = try values.decodeIfPresent([Int].self, forKey: .episode_run_time)
		first_air_date = try values.decodeIfPresent(String.self, forKey: .first_air_date)
		genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
		homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		in_production = try values.decodeIfPresent(Bool.self, forKey: .in_production)
		languages = try values.decodeIfPresent([String].self, forKey: .languages)
		last_air_date = try values.decodeIfPresent(String.self, forKey: .last_air_date)
		last_episode_to_air = try values.decodeIfPresent(Last_episode_to_air.self, forKey: .last_episode_to_air)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		next_episode_to_air = try values.decodeIfPresent(String.self, forKey: .next_episode_to_air)
		networks = try values.decodeIfPresent([Networks].self, forKey: .networks)
		number_of_episodes = try values.decodeIfPresent(Int.self, forKey: .number_of_episodes)
		number_of_seasons = try values.decodeIfPresent(Int.self, forKey: .number_of_seasons)
		origin_country = try values.decodeIfPresent([String].self, forKey: .origin_country)
		original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
		original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
		poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
		production_companies = try values.decodeIfPresent([Production_companies].self, forKey: .production_companies)
		production_countries = try values.decodeIfPresent([Production_countries].self, forKey: .production_countries)
		seasons = try values.decodeIfPresent([Seasons].self, forKey: .seasons)
		spoken_languages = try values.decodeIfPresent([Spoken_languages].self, forKey: .spoken_languages)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
		type = try values.decodeIfPresent(String.self, forKey: .type)
//		vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
		vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
	}

}
