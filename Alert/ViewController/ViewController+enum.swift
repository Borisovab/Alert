//
//  ViewController+enum.swift
//  Alert
//
//  Created by Александр Борисов on 20.12.2022.
//

import Foundation
import SnapKit

extension ViewController {

    enum NameLabelConstraints: Int {
        case leading = 40
        case height = 60
        case top = 100
    }

    enum NumberLabelConstraints: Int {
        case leading = 40
        case height, top = 100
    }

    enum SumButtonConstraints: Int {
        case width = 200
        case height = 60
        case top = 100
    }

    enum GuessTheNumberButtonConstraints: Int {
        case width = 200
        case height = 60
        case top = 25
    }
}
