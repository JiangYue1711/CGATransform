//
//  TransformTypes.swift
//  CGATransform
//
//  Created by leeco on 2019/2/10.
//  Copyright © 2019 JiangYue. All rights reserved.
//

public enum TransformTypes: String, CaseIterable {
    case translation
    case transScale
    case transRotationAngle
    case transInverted
    case transConcatenating
    
    var direction: String {
        switch self {
        case .translation:
            return "移动"
        case .transScale:
            return "缩放"
        case .transRotationAngle:
            return "旋转"
        case .transInverted:
            return "反转"
        case .transConcatenating:
            return "组合"
            
        }
    }
}
