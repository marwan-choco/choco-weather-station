//
//  DetailStrategy.swift
//  ChocoWeather
//
//  Created by Marwan Al Masri on 05.12.21.
//  Copyright © 2021 kor45cw. All rights reserved.
//

import Foundation

protocol DetailStrategy {
    func getViewModel(with weather: Weather, in city: City) -> DetailViewModel
}
