//
//  Category.swift
//  PomodoroToDO
//
//  Created by Александр Тимофеев on 01.07.2021.
//


enum Category {
    case study
    case home
    case work
    
    var categoryTitle: String{
        switch self {
        case .home:
            return "Home"
        case .study:
            return "Study"
        case .work:
            return "Work"
        }
    }
}
