//
//  Form.swift
//  LichVanNien
//
//  Created by Thien on 8/27/20.
//

import SwiftUI

struct LabelView<C: View> : View {
    let childView: C
    var text: String = ""
    init(text:String,_ childView: () -> (C)) {
        self.text = text
        self.childView = childView()
    }

    var body: some View {
        HStack {
            Text(text)
                .font(.subheadline)
                .padding(.trailing, 40)
            childView
            Spacer()
        }
    }
}

struct FormInput: View {
    var text: String = ""
    @Binding var value: String
    var body: some View {
        LabelView(text: text){
            TextField(text, text: $value)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(Color.white, lineWidth: 1)
            )
        }
    }
}

struct FormDate: View {
    var text: String = ""
    @Binding var value: Date
    var body: some View {
        LabelView(text: text){
            DatePicker("", selection: $value, displayedComponents: .date)

                .frame(width: 200)
        }
    }
}

struct OptionItem: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
}

struct FormSegment: View {
    var text: String = ""
    var options:[OptionItem]
    @Binding var value: OptionItem

    var body: some View {
        LabelView(text: text){
            Picker(selection: $value, label: EmptyView()) {
                ForEach(options) { option in
                    Text(option.name).tag(option)
                }
            }.pickerStyle(SegmentedPickerStyle())

                .frame(width: 200)
        }
    }
}

struct Form_Previews: PreviewProvider {
    let selectedItem = OptionItem(id: 1, name: "First")
    let options = [
        OptionItem(id: 1, name: "First"),
        OptionItem(id: 2, name: "Second"),
        OptionItem(id: 3, name: "Third"),
    ]
    static var previews: some View {
        Group {
            FormInput(text: "Input", value: .constant("")).previewDisplayName("Input")
            FormDate(text: "FormDate", value: .constant(Date())).previewDisplayName("Input")
            FormSegment(text: "FormSegment",
                        options: [
                            OptionItem(id: 1, name: "First"),
                            OptionItem(id: 2, name: "Second"),
                            OptionItem(id: 3, name: "Third"),
                ], value: .constant(
                    OptionItem(id: 1, name: "First")
                ))
                .previewDisplayName("FormDate")
        }
    }
}
