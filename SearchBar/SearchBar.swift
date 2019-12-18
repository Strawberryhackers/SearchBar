//
//  SearchBar.swift
//  SearchBar
//
//  Created by 根本翔希 on 2019/12/18.
//  Copyright © 2019 根本翔希. All rights reserved.
//

import SwiftUI
import UIKit

struct SearchBar : UIViewRepresentable {

    @Binding var text : String

    class Cordinator : NSObject, UISearchBarDelegate {

        @Binding var text : String

        init(text : Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Cordinator {
        return Cordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
