

//  ViewController.swift
//  ozinsheSnapKit
//
//  Created by Bauyrzhan Seidazymov on 13.02.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    private let onoboardingArray: [OnboardingModel] = [
        OnboardingModel(description: "Фильмдер, телехикаялар, ситкомдар, \nанимациялық жобалар, телебағдарламалар \nмен реалити-шоулар, аниме және тағы \nбасқалары", onboardingImage: "onboarding1"),
        OnboardingModel(description: "Кез келген құрылғыдан қара \nСүйікті фильміңді  қосымша төлемсіз \nтелефоннан, планшеттен, ноутбуктан қара", onboardingImage:"onboarding2" ),
        OnboardingModel(description: "Тіркелу оңай. Қазір тіркел де қалаған \nфильміңе қол жеткіз", onboardingImage: "onboarding3")
    ]
    
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage

            if currentPage != onoboardingArray.count - 1 {
                skipButton.isHidden = false
                nextButton.isHidden = true
            } else {
                nextButton.isHidden = false
                skipButton.isHidden = true
            }
        }
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collection = UICollectionView(
            frame: .zero,
        collectionViewLayout: layout)
        
        collection.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        
        collection.backgroundColor = UIColor(named: "backgroundColor")
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "white")
        button.setTitle("Өткізу", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 12)
        button.setTitleColor(UIColor(named: "black"), for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let nextButton: Button = {
        let button = Button()
        button.setTitle("Әрі қарай", for: .normal)
        button.isHidden = true
        return button
    }()
    
    private lazy var pageControl: ExtendedPageControll = {
        let pc = ExtendedPageControll(numberOfPages: 3, currentPage: 0, isCircular: true)
        pc.currentPage = 0
        pc.currentIndicatorColor = UIColor(named: "pagerSelected") ?? .orange
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        configureUI()
    }
}


extension OnboardingViewController {
    private func configureUI() {
        setCollectionView()
        setNextButton()
        setSkipButton()
        setPageControl()
    }
    private func setCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(-65)
            make.bottom.left.right.equalToSuperview()
        }
    }
    private func setNextButton() {
        view.addSubview(nextButton)
        
        nextButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
            make.bottom.equalToSuperview().inset(72)
        }
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    private func setSkipButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: skipButton)
        
        skipButton.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(24)
        }
        
        skipButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    private func setPageControl() {
        view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(-152)
            make.width.equalTo(56)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onoboardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.configureData(data: onoboardingArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width
        let cellHeight = UIScreen.main.bounds.height
        
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}

extension OnboardingViewController {
    @objc func nextButtonTapped() {
        let signInViewController = SignInViewController()
        navigationController?.pushViewController(signInViewController, animated: true)
    }
}
