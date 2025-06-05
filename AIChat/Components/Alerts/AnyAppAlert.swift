//
//  AnyAppAlert.swift
//  AIChat
//
//  Created by Saliha Yılmaz on 5.06.2025.
//

import Foundation
import SwiftUI

struct AnyAppAlert: Sendable {
    var title: String
    var subTitle: String?
    var buttons: @Sendable () -> AnyView
    
    init(
        title: String,
        subTitle: String? = nil,
        buttons: (@Sendable () -> AnyView)? = nil
    ) {
        self.title = title
        self.subTitle = subTitle
        self.buttons = buttons ?? {
            AnyView(
                Button("OK", action: {
                    
                })
            )
        }
    }
    
    init(error: Error) {
        self.init(title: "Error", subTitle: error.localizedDescription, buttons: nil)
    }
}

enum AlertType {
    case alert, confirmationDialog
}

extension View {
    @ViewBuilder
    func showCustomAlert(type: AlertType = .alert, alert: Binding<AnyAppAlert?>) -> some View {
        switch type {
        case .alert:
            self
                .alert(alert.wrappedValue?.title ?? "", isPresented: Binding(ifNotNil: alert)) {
                    alert.wrappedValue?.buttons()
                } message: {
                    if let subTitle = alert.wrappedValue?.subTitle {
                        Text(subTitle)
                    }
                }
        case .confirmationDialog:
            self
                .confirmationDialog(alert.wrappedValue?.title ?? "", isPresented: Binding(ifNotNil: alert)) {
                    alert.wrappedValue?.buttons()
                    } message: {
                        if let subTitle = alert.wrappedValue?.subTitle {
                            Text(subTitle)
                        }
                    }

        }
        
    }
}
