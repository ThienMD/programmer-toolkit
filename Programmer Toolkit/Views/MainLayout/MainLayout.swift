//
//  MainLayout.swift
//  LichVanNien
//
//  Created by Thien on 7/23/20.
//

import SwiftUI

struct MainLayout: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
             SideBar()
             detailView()
        }
        .padding(1.0)

        .frame(width: 800, height: 500)
    }

    func detailView() -> AnyView {
        switch userData.currentmodule.id {
        case .home:
            return AnyView(TrimmingView())

        case .information:
            return AnyView(InformationView())
        default:
            return AnyView(TrimmingView())
        }
    }
}

struct MainLayout_Previews: PreviewProvider {
    static var previews: some View {
        MainLayout().environmentObject(UserData())
    }
}
