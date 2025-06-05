//
//  Binding+EXT.swift
//  AIChat
//
//  Created by Saliha Yılmaz on 5.06.2025.
//

import Foundation
import SwiftUI

extension Binding where Value == Bool {
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
