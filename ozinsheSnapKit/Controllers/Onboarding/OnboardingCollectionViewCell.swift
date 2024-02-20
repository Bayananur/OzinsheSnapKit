//
//  OnboardingCollectionViewCell.swift
//  ozinsheSnapKit
//
//  Created by Bauyrzhan Seidazymov on 13.02.2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = "OnboardingCell"
    
    private let gradientView: GradientView = {
        let gradient = GradientView()
        gradient.startColor = UIColor(named: "gradientStartColor")!
        gradient.endColor = UIColor(named: "gradientEndColor")!
        gradient.startLocation = 0.02
        gradient.endLocation = 1
        
        return gradient
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.text = "ÖZINŞE-ге қош келдің!"
        label.textAlignment = .center
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "greyScale")
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        label.numberOfLines = 0
        
        label.text = "Фильмдер, телехикаялар, ситкомдар, \nанимациялық жобалар, телебағдарламалар \nмен реалити-шоулар, аниме және тағы \nбасқалары"
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        let attributedString = NSMutableAttributedString(string: label.text!)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))

        label.attributedText = attributedString
        label.textAlignment = .center
        
        return label
    }()
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.sizeToFit()
        return imageView
    }()
}

extension OnboardingCollectionViewCell {
    func configureData(data: OnboardingModel) {
        self.backgroundColor = UIColor(named: "backgroundColor")
        descriptionLabel.text = data.description
        onboardingImageView.image = UIImage(named: data.onboardingImage)
        setUI()
    }
}

extension OnboardingCollectionViewCell {
    private func setUI() {
        setOnboardingImageView()
        setGradientView()
        setTitleLabel()
        setDescriptionLabel()
    }
    private func setGradientView() {
        addSubview(gradientView)
        gradientView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(234)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(onboardingImageView.snp.bottom).offset(2)
        }
    }
    
    private func setTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(onboardingImageView.snp.bottom).inset(18)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
    }
    private func setDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
    }
    private func setOnboardingImageView() {
        addSubview(onboardingImageView)
        onboardingImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(504)
        }
    }
}

