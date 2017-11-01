//
//  StretchyViewController.swift
//  StretchyLayouts
//
//  Created by Simeon on 26/10/17.
//  Copyright © 2017 Enabled. All rights reserved.
//

import UIKit
import SnapKit

class StretchyViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let infoText = UILabel()
    private let imageView = UIImageView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        imageView.image = UIImage(named: "Header")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        infoText.textColor = .white
        infoText.numberOfLines = 0
        let text =  """
                    Lorem ipsum dolor sit amet, in alia adhuc aperiri nam. Movet scripta tractatos cu eum, sale commodo meliore ea eam, per commodo atomorum ea. Unum graeci iriure nec an, ea sit habeo movet electram. Id eius assum persius pro, id cum falli accusam. Has eu fierent partiendo, doming expetenda interesset cu mel, tempor possit vocent in nam. Iusto tollit ad duo, est at vidit vivendo liberavisse, vide munere nonumy sed ex.
                            
                    Quod possit expetendis id qui, consequat vituperata ad eam. Per cu elit latine vivendum. Ei sit nullam aliquam, an ferri epicuri quo. Ex vim tibique accumsan erroribus. In per libris verear adipiscing. Purto aliquid lobortis ea quo, ea utinam oportere qui.
                    """
        infoText.text = text + text + text
        
        let textContainer = UIView()
        textContainer.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1235740449, blue: 0.2699040081, alpha: 1)
        
        let imageContainer = UIView()
        imageContainer.backgroundColor = .darkGray
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(imageContainer)
        scrollView.addSubview(imageView)
        scrollView.addSubview(textContainer)
        
        textContainer.addSubview(infoText)
        
        scrollView.snp.makeConstraints {
            make in
            
            make.edges.equalTo(view)
        }
        
        imageContainer.snp.makeConstraints {
            make in
            
            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(imageContainer.snp.width).multipliedBy(0.7)
        }
        
        imageView.snp.makeConstraints {
            make in
            
            make.left.right.equalTo(imageContainer)

            //** Note the priorities
            make.top.equalTo(view).priority(.high)
            
            //** We add a height constraint too
            make.height.greaterThanOrEqualTo(imageContainer.snp.height).priority(.required)
            
            //** And keep the bottom constraint
            make.bottom.equalTo(imageContainer.snp.bottom)
        }
    
        textContainer.snp.makeConstraints {
            make in
            
            make.top.equalTo(imageContainer.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(scrollView)
        }
        
        infoText.snp.makeConstraints {
            make in
            
            make.edges.equalTo(textContainer).inset(14)
        }
    }
}
