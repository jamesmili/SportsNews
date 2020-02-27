//
//  HostingController.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-27.
//  Copyright © 2020 James Militante. All rights reserved.
//

import Foundation
import SwiftUI

final class HostingController<T: View>: UIHostingController<T> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
