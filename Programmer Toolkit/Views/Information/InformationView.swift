//
//  InformationView.swift
//  Programer Toolkit
//
//  Created by ThienMD on 8/29/20.
//  Copyright © 2020 ThienMD. All rights reserved.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        ContainerView {
            VStack {
                Text("PROGRAMMING TOOLKIT")
                    .font(.headline)
                    .padding(.bottom, 50)
                Text("This application created for personal purpose, please don't use it in commercial purpose")
                    .font(.caption)
                    .padding(.bottom)
                Text("Copyright dotVN Corp 2020")
                    .font(.caption)
                    .padding(.bottom)
            }

        }
        
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
