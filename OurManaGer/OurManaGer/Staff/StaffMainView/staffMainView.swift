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
        view.addSubViews(logo, welcomeTitle, dayList, startWork, goHome, statusLabel, toDo, recipe, order, schedule, staffToggle)
        logo.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(65)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.width.height.equalTo(60)
        }
        
        welcomeTitle.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(80)
            $0.leading.equalTo(logo.snp.trailing).offset(20)
        }
        
        dayList.snp.makeConstraints {
            $0.top.equalTo(welcomeTitle.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        startWork.snp.makeConstraints {
            $0.top.equalTo(dayList.snp.bottom).offset(40)
            $0.leading.equalTo(view.snp.leading).offset(100)
        }
        
        goHome.snp.makeConstraints {
            $0.top.equalTo(dayList.snp.bottom).offset(40)
            $0.leading.equalTo(startWork.snp.trailing).offset(100)
        }
        
        statusLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(startWork.snp.bottom).offset(40)
        }
        
        toDo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(statusLabel.snp.bottom).offset(40)
            $0.width.equalTo(340)
            $0.height.equalTo(170)
        }
        
        recipe.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.top.equalTo(toDo.snp.bottom).offset(50)
            $0.width.height.equalTo(100)
        }
        
        order.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(toDo.snp.bottom).offset(50)
            $0.width.height.equalTo(100)
        }
        
        schedule.snp.makeConstraints {
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.top.equalTo(toDo.snp.bottom).offset(50)
            $0.width.height.equalTo(100)
        }
        
        staffToggle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(order.snp.bottom).offset(40)
            $0.width.height.equalTo(60)
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
    
    @objc private func buttonTapped(sender: UIButton) {
        if sender == startWork {
            print("Start Work 버튼이 눌렸습니다.")
            statusLabel.text = "콩지 님이 근무중입니다!"
        } else if sender == goHome {
            print("Go Home 버튼이 눌렸습니다.")
            statusLabel.text = "출근하셨나요? 출근 기록을 잊지마세요 : )"
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
        $0.text = "HI 🙌🏻  콩지!"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    private var startWork = UIButton().then {
        let image = UIImage(named: "startWork")
        $0.setImage(image, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
    }
    
    private var goHome = UIButton().then {
        let image = UIImage(named: "goHome")
        $0.setImage(image, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
    }
    
    private var statusLabel = UILabel().then {
        $0.text = "출근하셨나요?  출근 기록을 잊지마세요 : )"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 11)
    }
    
    private var toDo = UIImageView().then {
        $0.image = UIImage(named: "todo_list")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    private var recipe = UIImageView().then {
        $0.image = UIImage(named: "recipe")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    private var order = UIImageView().then {
        $0.image = UIImage(named: "order")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    private var schedule = UIImageView().then {
        $0.image = UIImage(named: "schedule")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    private var staffToggle = UIImageView().then {
        $0.image = UIImage(named: "staffToggle")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
}
