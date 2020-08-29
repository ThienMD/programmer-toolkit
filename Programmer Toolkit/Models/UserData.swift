//
//  UserData.swift
//  LichVanNien
//
//  Created by Thien on 8/2/20.
//

import Foundation
import Combine
import SwiftUI

enum AppModuleEnum {
    case home
    case information
}

struct AppModule: Hashable, Identifiable {
    var id: AppModuleEnum
    var name: String
    var image: String
}


let appModules:[AppModule] = [
    AppModule(id: .home, name: "Trimming", image: "home"),
    AppModule(id: .information, name: "Informations", image: "feedback"),
]

final class UserData: ObservableObject {
    @Published var currentmodule = appModules[0]

}
