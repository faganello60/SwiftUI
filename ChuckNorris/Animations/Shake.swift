//
//  Shake.swift
//  ChuckNorris
//
//  Created by Bruno Faganello Neto on 01/11/19.
//  Copyright © 2019 Bruno Faganello Neto. All rights reserved.
//

import SwiftUI

struct ShakeEffect: GeometryEffect {
    
    //--------------------------------------------------
    // MARK: - Public Properties
    //--------------------------------------------------
    
    var position: CGFloat
    
    var animatableData: CGFloat {
        get { position }
        set { position = newValue }
    }

    //--------------------------------------------------
    // MARK: - Inits
    //--------------------------------------------------
    
    init(shakes: Int) {
        position = CGFloat(shakes)
    }
    
    //--------------------------------------------------
    // MARK: - GeometryEffect Funcs
    //--------------------------------------------------
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(
            CGAffineTransform(
                translationX: -30 * sin(position * 2 * .pi),
                y: 0
            )
        )
    }
}
