//
//  WhatsappSenderiOS_WidgetBundle.swift
//  WhatsappSenderiOS Widget
//
//  Created by Andreas Alexandru Cretu on 15/11/22.
//

import SwiftUI
import WidgetKit

@main

// swiftlint:disable type_name
struct WhatsappSenderiOS_WidgetBundle: WidgetBundle {
    var body: some Widget {
        WhatsappSenderiOS_Widget()
        WhatsappSenderiOS_WidgetLiveActivity()
    }
}
// swiftlint:enable type_name
