//
//  Common.swift
//  FurryFriends
//
//  Created by Kelly Xu on 2/10/15.
//  Copyright (c) 2015 kelly. All rights reserved.
//

import UIKit

func CGAffTransformMakeDegree(rotation: CGFloat) -> CGAffineTransform {
    return CGAffineTransformMakeRotation(rotation * CGFloat(M_PI / 180))
}
