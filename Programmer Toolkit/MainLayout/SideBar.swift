//
//  SideBar.swift
//  LichVanNien
//
//  Created by Thien on 7/23/20.
//

import SwiftUI

struct SideBar: View {
    @EnvironmentObject var userData: UserData


    var body: some View {
        VStack {
            List {
                Text("P Toolkit")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ForEach(appModules) { module in
                    SideBarItem(isSelected: module.id == self.userData.currentmodule.id, image: Image(module.image), title: module.name)
                        .onTapGesture {
                            self.userData.currentmodule = module
                    }
                }

            }

        }
        .frame(width: 300)


    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
