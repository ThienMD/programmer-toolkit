//
//  TrimmingView.swift
//  Programer Toolkit
//
//  Created by ThienMD on 8/29/20.
//  Copyright © 2020 ThienMD. All rights reserved.
//

import SwiftUI

struct TrimOption {
    var replace: String
    var with: String
    var recursive: Bool
}

struct TrimmingView: View {
    @State var input = ""
    
    var body: some View {
        ContainerView{
            VStack(alignment: .leading) {
                Text("Please input text")
                FormInput(text: "Input", value: $input)
                    .padding(.bottom)
                Text("Results")
                    .font(.subheadline)
                    .padding(.bottom)
                FormInput(text: "Output", value: .constant(getResult()) )
                                   .padding(.bottom)
            }
            
        }
    }
    
    func trim(text: String, option: TrimOption ) -> String {
        let trimmedText = text.replacingOccurrences(of: option.replace, with: option.with)
        if option.recursive {
            if trimmedText.range(of: option.replace) != nil {
                return trim(text: trimmedText, option: option)
            }
        }
        return trimmedText
    }
    
    func getResult() -> String {
        let options = [
            TrimOption(replace: "[", with: "_", recursive: false),
            TrimOption(replace: "]", with: "_", recursive: false),
            TrimOption(replace: ":", with: "_", recursive: false),
            TrimOption(replace: "<", with: "_", recursive: false),
            TrimOption(replace: ">", with: "_", recursive: false),
            TrimOption(replace: " ", with: "_", recursive: false),
            TrimOption(replace: "-", with: "_", recursive: false),
            TrimOption(replace: "__", with: "_", recursive: true)
        ]
        var output = input
        for option in options {
            output = trim(text: output, option: option)
        }
        return output
    }
}

struct TrimmingView_Previews: PreviewProvider {
    static var previews: some View {
        TrimmingView()
    }
}
