//
//  RabbitViewController.swift
//  FurryFriends
//
//  Created by Kelly Xu on 2/10/15.
//  Copyright (c) 2015 kelly. All rights reserved.
//

import UIKit

class RabbitViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var fieldView: UIImageView!
    @IBOutlet weak var rabbitView: UIImageView!
    var scale: CGFloat! = 1
    var rotate: CGFloat! = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func scrollViewDidScroll(scrollView: UIScrollView){
        var yOffset = scroll.contentOffset.y
        
        println("yOffset:\(yOffset)")
        fieldView.frame.origin.y = yOffset/5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapField(sender: UITapGestureRecognizer) {
        println("field tapped")
        var location = sender.locationInView(view)
        println("Location is \(location)")
        
        UIView .animateWithDuration(0.4, animations: { () -> Void in
            self.rabbitView.center = location
        })
    }
    @IBAction func didDragBunny(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        rabbitView.center = location
        println("when drag the bunny, the location is \(location)")
        
        if sender.state == UIGestureRecognizerState.Began{
            UIView .animateWithDuration(0.3, animations: { () -> Void in
                self.rabbitView.transform = CGAffineTransformMakeScale(1.4, 1.4)
                
//                self.rabbitView.layer.shadowOffset = CGSize(width: 10, height: 10)
            })
            
        }else if sender.state == UIGestureRecognizerState.Changed{
            
        }else if sender.state == UIGestureRecognizerState.Ended{
            UIView .animateWithDuration(0.3, animations: { () -> Void in
                self.rabbitView.transform = CGAffineTransformMakeScale(1, 1)
                
                if velocity.x > 0{
                    self.rabbitView.center = CGPoint(x: 300, y: 150)
                }else{
                    self.rabbitView.center = CGPoint(x: 50, y: 150)
                }
                
            })
        }

    }
    
    @IBAction func onDidHideBtn(sender: AnyObject) {
        UIView .animateWithDuration(0.3, animations: { () -> Void in
            self.rabbitView.transform = CGAffineTransformMakeScale(0.1, 0.1)
            self.rabbitView.alpha = 0
        })
    }

    @IBAction func onDidShowBtn(sender: AnyObject) {
        UIView .animateWithDuration(0.3, animations: { () -> Void in
            self.rabbitView.transform = CGAffineTransformMakeScale(1, 1)
            self.rabbitView.alpha = 1
        })
    }

    @IBAction func onTapUpBtn(sender: AnyObject) {
        UIView .animateWithDuration(0.3, animations: { () -> Void in
                self.rabbitView.center.y -= 20
        })
        
    }
    @IBAction func onTapDownBtn(sender: AnyObject) {
        UIView .animateWithDuration(0.3, animations: { () -> Void in
            self.rabbitView.center.y += 20
        })
        
    }
    @IBAction func onTapLeftBtn(sender: AnyObject) {
        UIView .animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.rabbitView.center.x -= 20
        }, completion: nil)
        
    }

    @IBAction func onTapRightBtn(sender: AnyObject) {
        UIView .animateWithDuration(0.3, animations: { () -> Void in
            self.rabbitView.center.x += 20
        })
    }
    

    
    @IBAction func onTapRotateLeft(sender: AnyObject) {
        rotate = rotate - 10
        var scaleTransform = CGAffineTransformMakeScale(scale, scale)
        var roationTransform = CGAffTransformMakeDegree(rotate)
        var transform = CGAffineTransformConcat(scaleTransform, roationTransform)
        rabbitView.transform = transform
    }
    
    @IBAction func onTapRotateRight(sender: AnyObject) {

        rotate = rotate + 10
        var scaleTransform = CGAffineTransformMakeScale(scale, scale)
        var roationTransform = CGAffTransformMakeDegree(rotate)
        var transform = CGAffineTransformConcat(scaleTransform, roationTransform)
        rabbitView.transform = transform
    }
    
    @IBAction func onDidFeedBtn(sender: AnyObject) {
        if scale < 5 {
            scale = scale + 0.2
        }
        
        var scaleTransform = CGAffineTransformMakeScale(scale, scale)
        var roationTransform = CGAffTransformMakeDegree(rotate)
        var transform = CGAffineTransformConcat(scaleTransform, roationTransform)
        
        UIView .animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in

            self.rabbitView.transform = transform
        }, completion: nil)
        

    }
    
    
    @IBAction func onRestBtn(sender: AnyObject) {
        scale = 1
        rotate = 0
        UIView .animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            var scaleTransform = CGAffineTransformMakeScale(self.scale, self.scale)
            var roationTransform = CGAffTransformMakeDegree(self.rotate)
            var transform = CGAffineTransformConcat(scaleTransform, roationTransform)
            self.rabbitView.transform = transform
        }, completion: nil)
    }
    
}
