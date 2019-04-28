//
//  CGAffineViewController.swift
//  CGATransform
//
//  Created by leeco on 2019/2/10.
//  Copyright © 2019 JiangYue. All rights reserved.
//

import UIKit

class CGAffineViewController: UIViewController {
    
    public var  transformTypes: TransformTypes = .translation
    
    private let tranformView: UIView = {
        let tranformView:UIView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        tranformView.backgroundColor = UIColor.red
        return tranformView
    }()
    
    init(transformTypes: TransformTypes) {
        self.transformTypes = transformTypes
        super.init(nibName: nil, bundle: nil)
        title = "\(transformTypes.direction)"
        view.backgroundColor = UIColor.white
        view.addSubview(tranformView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5, delay: 0.5, options: UIView.AnimationOptions.curveLinear, animations: {
            switch self.transformTypes{
            case .translation:
                // 移动
                self.tranformView.transform = CGAffineTransform.init(translationX: 0, y: 200)
            case .transScale:
                // 缩放
                self.tranformView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            case .transRotationAngle:
                // 旋转
                self.tranformView.transform = CGAffineTransform.init(rotationAngle: 0.5)
            case .transInverted:
                // 反转
                self.tranformView.transform = CGAffineTransform.init(translationX: 0, y: 200)
                self.tranformView.transform  = self.tranformView.transform.inverted()
            case .transConcatenating:
                // 组合
                self.tranformView.transform = CGAffineTransform.init(rotationAngle: 0.5)
                self.tranformView.transform = self.tranformView.transform.concatenating(CGAffineTransform.init(scaleX: 1.5, y: 1.5))
            }
        }) { (completion: Bool) in
        }
    }
}
