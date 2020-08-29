//
//  ContainerView.swift
//  LichVanNien
//
//  Created by Thien on 8/9/20.
//

import SwiftUI

// Declaring ContainerView as a HOC
struct ContainerView<C: View> : View {
  let childView: C

  init(_ childView: () -> (C)) {
    self.childView = childView()
  }

  var body: some View {
    VStack {
        HStack {
            Spacer()
        }
        childView
        Spacer()
    }
    .padding(.horizontal)
  }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView {
            Text("Hello")
        }
    }
}
