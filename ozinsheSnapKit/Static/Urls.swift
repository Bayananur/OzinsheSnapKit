//
//  Urls.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 27.06.2023.
//

import Foundation

class Urls {
    static let BASE_URL = "http://api.ozinshe.com/core/V1/"
    
    static let SIGN_UP_URL = "http://api.ozinshe.com/auth/V1/signup"
    static let SIGN_IN_URL = "http://api.ozinshe.com/auth/V1/signin"
    static let FAVORITE_URL = BASE_URL + "favorite/"
    static let PROFILE_URL = BASE_URL + "user/profile"
    static let CATEGORY_URL = BASE_URL + "categories"
    static let SEARCH_MOVIES_URL = BASE_URL + "movies/search"
    static let MOVIES_BY_CATEGORY_URL = BASE_URL + "movies/page"
    static let MAIN_MOVIES_URL = BASE_URL + "movies/main"
    static let MAIN_BANNERS_URL = BASE_URL + "movies_main"
    static let USER_HISTORY_URL = BASE_URL + "history/userHistory"
    static let GET_GENRES = BASE_URL + "genres"
    static let GET_AGES = BASE_URL + "category-ages"
    static let GET_SIMILAR = BASE_URL + "movies/similar/"
    static let GET_SEASONS = BASE_URL + "seasons/"
    static let CHANGE_PASSWORD = BASE_URL + "user/profile/changePassword"
    static let UPDATE_USER_DATA = BASE_URL + "user/profile/"
}
