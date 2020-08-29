//
//  SideBarItem.swift
//  LichVanNien
//
//  Created by Thien on 7/30/20.
//

import SwiftUI

struct SideBarItem: View {
    var isSelected: Bool
    var image: Image
    var title: String
    var body: some View {
        HStack {
            image
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isSelected ? Color.white : Color.init(hex: "#007AFF"))
                .frame(width: 22, height: 22)

            Text(title)
                .foregroundColor(isSelected ? Color.white : Color("sidebar-text"))
            Spacer()
        }
        .contentShape(Rectangle())
        .frame( height: 44)
        .padding(.horizontal, 5)
        .background(isSelected ? Color.init(hex: "#007AFF"): Color.clear)
        .cornerRadius(8)
        .animation(.easeInOut)

    }

}

struct SideBarItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SideBarItem(isSelected: true, image:  Image("home"), title: "Lich")
                .previewDisplayName("Selected Item")
            SideBarItem(isSelected: false, image:  Image("home"), title: "Cai dat")
                .previewDisplayName("Normal Item")
        }

    }
}
