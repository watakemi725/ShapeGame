//
//  GameViewController.swift
//  ShapeGame
//
//  Created by Takemi Watanuki on 2016/03/16.
//  Copyright © 2016年 watakemi725. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var scoreLabel:UILabel!
    
    var myBoundSize: CGSize!
    var myBoundSizeStr: NSString!
    var kankaku = 42
    var boxSize = 40
    var boxNum = 6
    var btnBox:[UIButton] = []
    var randomNum = 0
    
    var correctNum = 0
    
    var angleArray = [2.0,4.0,6.0,8.0,10.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myBoundSize = UIScreen.mainScreen().bounds.size
        myBoundSizeStr = "Bounds width: \(myBoundSize.width) height: \(myBoundSize.height)"
        print(myBoundSizeStr)
        loadBtn()
        randomChangeBtn()
        
        // Do any additional setup after loading the view.
    }
    func loadBtn(){
        
        for ( var i = 0; i < boxNum ; i++ ) {
            for ( var j = 0; j < boxNum ; j++ ) {
                
                //                let margin = ((myBoundSize.width/2)-CGFloat(((kankaku*boxNum-(kankaku-boxSize))/2)-kankaku))
                let marginfirst = (kankaku*boxNum-(kankaku-boxSize))/2 //- kankaku
                let margin = (myBoundSize.width/2)-CGFloat(marginfirst)
                
                let y = CGFloat(kankaku * (i+1) )
                let x = CGFloat(kankaku * (j+1) )
                let btn = UIButton(frame: CGRectMake(x+margin, y, CGFloat(boxSize), CGFloat(boxSize)))
                btn.backgroundColor = UIColor.blackColor()
                btn.tag = btnBox.count
                //                btn.setTitle(btag.toStr(), forState: .Normal)
                btn.addTarget(self, action: "btnHantei:", forControlEvents: .TouchUpInside)
                self.view.addSubview(btn)
                
                btnBox.append(btn)
            }
        }
        
    }
    
    func randomChangeBtn(){
        
        randomNum = Int(arc4random_uniform(UInt32(btnBox.count)))
        
        //        let randomAngle = Double(arc4random_uniform(9))
        let randomAngle = makeRandom(btnBox.count)
        
        // radianで回転角度を指定(30度)する.
        let angle:CGFloat = CGFloat((randomAngle * M_PI) / 180.0)
        
        // 回転用のアフィン行列を生成する.
        btnBox[randomNum].transform = CGAffineTransformMakeRotation(angle)
        
        scoreLabel.text = "正解は\( randomNum ),点数\(correctNum)"
        
    }
    
    func makeRandom(num:Int) -> Double {
        let randomAngle =  Int(arc4random_uniform(5))
        let randomPlusMinus = arc4random_uniform(2)
        var returnNumber = 0.0
        
        if randomPlusMinus == 0 {
            returnNumber = 1.0 * angleArray[randomAngle]
        }else if randomPlusMinus == 1 {
            returnNumber = -1.0 * angleArray[randomAngle]
        }
        
        return returnNumber
    }
    
    func fixBackBtn(){
        // radianで回転角度を指定(30度)する.
        let angle:CGFloat = CGFloat((0 * M_PI) / 180.0)
        
        // 回転用のアフィン行列を生成する.
        btnBox[randomNum].transform = CGAffineTransformMakeRotation(angle)
        
    }
    
    func btnHantei(sender: UIButton){
        
        print(sender.tag)
        
        
        if sender.tag == randomNum{
            print("正解!!")
            correctNum++
            scoreLabel.text = "せいかいーーー"
            fixBackBtn()
            //            btnAnimation(btnBox[randomNum])
            allbtnAnimation()
            
            let delay = 1.0 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), {
                self.randomChangeBtn()
            })
            
        }else{
            print("うんこ!!")
            scoreLabel.text = "アウトーーー"
            
            
        }
        
        
    }
    
    func btnAnimation(selectedBtn:UIButton){
        
        selectedBtn.transform = CGAffineTransformMakeRotation(0)
        
        // radianで回転角度を指定(180度).
        let angle:CGFloat = CGFloat(M_PI)
        
        // アニメーションの秒数を設定(1秒).
        UIView.animateWithDuration( 1.0,
            
            delay : 0.0,
            
            usingSpringWithDamping : 0.1,
            
            initialSpringVelocity : 0.5,
            
            options : UIViewAnimationOptions.CurveEaseIn,
            
            animations: { () -> Void in
                
                // 回転用のアフィン行列を生成.
                
                selectedBtn.transform = CGAffineTransformMakeRotation(angle)
                selectedBtn.transform = CGAffineTransformIdentity
                
                //                self.btnBox[self.randomNum].transform = CGAffineTransformMakeScale(1.5, 1.5)
                self.btnBox[self.randomNum].backgroundColor = UIColor.grayColor()
                self.backcolor(self.btnBox[self.randomNum])
            },
            completion: { (Bool) -> Void in
                
                //                self.btnBox[self.randomNum].transform = CGAffineTransformMakeScale(1, 1)
//                self.btnBox[self.randomNum].backgroundColor = UIColor.blackColor()
                
                
        })
    }
    
    func backcolor(selectedBtn:UIButton){
        UIView.animateWithDuration( 1.5,
            
            delay : 1.0,
            
            usingSpringWithDamping : 0.5,
            
            initialSpringVelocity : 0.1,
            
            options : UIViewAnimationOptions.CurveEaseIn,
            
            animations: { () -> Void in
                
                //                self.btnBox[self.randomNum].transform = CGAffineTransformMakeScale(1.5, 1.5)
                selectedBtn.backgroundColor = UIColor.blackColor()
            },
            completion: { (Bool) -> Void in

        })
    }
    
    func btnZoomAnimation(selectedBtn:UIButton){
        
        selectedBtn.transform = CGAffineTransformMakeRotation(0)
        
        // radianで回転角度を指定(180度).
        let angle:CGFloat = CGFloat(M_PI)
        
        // アニメーションの秒数を設定(1秒).
        UIView.animateWithDuration(1.0,
            
            animations: { () -> Void in
                
                // 回転用のアフィン行列を生成.
                //                selectedBtn.transform = CGAffineTransformMakeScale(<#T##sx: CGFloat##CGFloat#>, <#T##sy: CGFloat##CGFloat#>)
                selectedBtn.transform = CGAffineTransformIdentity
            },
            completion: { (Bool) -> Void in
        })
    }
    
    func allbtnAnimation(){
        for ( var j = 0; j < btnBox.count ; j++ ) {
            btnAnimation(btnBox[j])
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
