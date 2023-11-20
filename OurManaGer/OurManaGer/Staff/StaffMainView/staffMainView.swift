//
//  staffMainView.swift
//  OurManaGer
//
//  Created by 방민지 on 11/16/23.
//

import UIKit
import SnapKit
import Then


class staffMainView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImageButtonsToStackView()
        setLayout()
        setUpScrollView()
        
    }
    
    private func setLayout() {
        self.view.backgroundColor = .backColor
        view.addSubViews(logo, welcomeTitle, dayList)
        logo.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(65)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.width.equalTo(60)
            $0.height.equalTo(60)
        }
        
        welcomeTitle.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(80)
            $0.leading.equalTo(logo.snp.trailing).offset(20)
        }
        
        dayList.snp.makeConstraints {
            $0.top.equalTo(welcomeTitle.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    
    private func setUpScrollView() {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        view.addSubview(scrollView)
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
    }
    
    private func addImageButtonsToStackView() {
        let imageNames = ["09mon", "10tue", "11wed", "12thu" , "13fri", "14sat", "15sun"]
        
        for imageName in imageNames {
            let button = UIButton().then {
                        $0.setImage(UIImage(named: imageName), for: .normal)
                        $0.imageView?.contentMode = .scaleAspectFit
                        $0.contentHorizontalAlignment = .fill
                        $0.contentVerticalAlignment = .fill
                        $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
                        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
                    }
            dayList.addArrangedSubview(button)
        }
    }
}

    
    private var dayList = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.distribution = .fillEqually
    }
    
    private var logo = UIImageView().then {
        $0.image = UIImage(named: "staffCharacter")
        $0.contentMode = .scaleAspectFit
    }
    
    private var welcomeTitle = UILabel().then {
        $0.text = "HI 🙌🏻  BangCong!"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }

