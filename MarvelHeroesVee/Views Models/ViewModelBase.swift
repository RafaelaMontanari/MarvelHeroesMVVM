//
//  ViewModelBase.swift
//  MarvelHeroesVee
//
//  Created by Rafaela da Silva Cunha Montanari on 13/12/20.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
