//
//  Button.swift
//  ozinsheSnapKit
//
//  Created by Bauyrzhan Seidazymov on 13.02.2024.
//

import Foundation
import UIKit

class Button: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customize()
    }
}

private extension Button {
    func customize() {
        backgroundColor = UIColor(named: "Violet")
        titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 16)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 12
    }
}
