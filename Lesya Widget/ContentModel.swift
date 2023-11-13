//
//  ComtentModel.swift
//  lesyawidgett
//
//  Created by mll on 13.09.2023.
//
import SwiftUI
import Foundation

class ContentModel: ObservableObject {
    @AppStorage("togx1") var togx1 = true
    @AppStorage("simonbio") var simonbio = "Народився 8 січня 1935 р. в селищі Біївці Лубенського району на Полтавщині. Батьки його були колгоспники, усе дитинство пройшло на селі у важкі воєнні та повоєнні часи. Улітку 1962р. міліціонери заарештували та жорстоко побили його. Відмовлялися друкувати твори, друзі відвернулися. На початку вересня 1963р. ліг у лікарню, оскільки після побиття його мучили болі, було діагностовано рак нирок. Помер він 14 грудня 1963 р. Поет прожив лише 28 років."
    // Показ розділів
    @Published var showingCredtable: Bool = false
    @Published var showingTimetableSheet: Bool = false
    @Published var showingLunchSheet: Bool = false
    @Published var showingSettings: Bool = false
    
    @Published var bgtog: Bool = false
    
    @Published var savedColors: [String] = ["42", "124", "180"]
    @Published var isFluent: Bool = true
    @Published var selected: Int = 0

    @AppStorage("appColor") var appColor: Double = 0
    
    @AppStorage("timetableColor") var timetableColor: Double = 0
    @AppStorage("timetableRotation") var timetableRotation: Double = 0
    
    @AppStorage("lunchColor") var lunchColor: Double = 0
    @AppStorage("lunchRotation") var lunchRotation: Double = 180
    
    
    

}
