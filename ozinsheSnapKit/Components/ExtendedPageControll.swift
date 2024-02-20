//
//  ExtendedPageControll.swift
//  ozinsheSnapKit
//
//  Created by Bauyrzhan Seidazymov on 13.02.2024.
//

import Foundation
import UIKit

class ExtendedPageControll: UIView {
    var numberOfPage: Int
    var currentPage: Int = 0 { didSet { reloadView() } }
    var currentIndicatorColor: UIColor = UIColor(named: "pagerSelected") ?? .orange
    var indicatorColor: UIColor = UIColor(named: "pagerUnselected") ?? .gray
    var circleIndicator: Bool = false
    private var dotView = [UIView]()
    private let minSpacing: CGFloat = 4
    private var standardIndicatorSize: CGSize { CGSize(width: 6, height: 6) }
    private var currentIndicatorSize: CGSize { CGSize(width: 20, height: 6) }
    private var cornerRadius: CGFloat = 3
    
    init(numberOfPages: Int, currentPage: Int, isCircular: Bool) {
        self.numberOfPage = numberOfPages
        self.currentPage = currentPage
        self.circleIndicator = isCircular
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        backgroundColor = .clear
        (0..<numberOfPage).forEach { _ in
            let view = UIView()
            addSubview(view)
            dotView.append(view)
        }
    }
    
    private func reloadView() {
        dotView.forEach { $0.backgroundColor = indicatorColor }
        dotView[currentPage].backgroundColor = currentIndicatorColor
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicators()
        }
    }
    
    private func layoutIndicators() {
        var totalIndicatorWidth: CGFloat = 0
        var totalSpacing: CGFloat = 0
        
        for i in 0..<numberOfPage {
            let indicatorWidth = (i == currentPage) ? currentIndicatorSize.width : standardIndicatorSize.width
            totalIndicatorWidth += indicatorWidth
            if i > 0 {
                totalSpacing += minSpacing
            }
        }
        
        let scaleFactor = min(1, bounds.width / (totalIndicatorWidth + totalSpacing))
        let scaledIndicatorWidth = scaleFactor * standardIndicatorSize.width
        
        var currentX = (bounds.width - (scaledIndicatorWidth * CGFloat(numberOfPage) + minSpacing * CGFloat(numberOfPage - 1))) / 2
        
        for i in 0..<numberOfPage {
            let indicatorWidth = (i == currentPage) ? currentIndicatorSize.width * scaleFactor : scaledIndicatorWidth
            let indicatorHeight = (i == currentPage) ? currentIndicatorSize.height * scaleFactor : standardIndicatorSize.height * scaleFactor
            
            let x = currentX
            let y = (bounds.height - indicatorHeight) / 2
            
            dotView[i].frame = CGRect(x: x, y: y, width: indicatorWidth, height: indicatorHeight)
            dotView[i].layer.cornerRadius = 3
            currentX += indicatorWidth + minSpacing
        }
    }
}
