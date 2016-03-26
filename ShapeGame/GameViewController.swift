//
//  GameViewController.swift
//  ShapeGame
//
//  Created by Takemi Watanuki on 2016/03/16.
//  Copyright © 2016年 watakemi725. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var myBoundSize: CGSize!
    var myBoundSizeStr: NSString!
    var kankaku = 60
    var boxSize = 50
    var boxNum = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myBoundSize = UIScreen.mainScreen().bounds.size
        myBoundSizeStr = "Bounds width: \(myBoundSize.width) height: \(myBoundSize.height)"
        print(myBoundSizeStr)
        loadBtn()

        // Do any additional setup after loading the view.
    }
    func loadBtn(){
        
        
        
        
        for ( var i = 0; i < boxNum ; i++ ) {
            for ( var j = 0; j < boxNum ; j++ ) {
                
                let margin = (myBoundSize.width/2 - CGFloat(((kankaku * boxNum - (kankaku - boxSize) ) / 2 ) - kankaku ) )
                let y = CGFloat(kankaku * (i+1) )
                let x = CGFloat(kankaku * (j+1) )
                let btn = UIButton(frame: CGRectMake(x+margin, y, CGFloat(boxSize), CGFloat(boxSize)))
                btn.backgroundColor = UIColor.redColor()
                //                btn.tag =
                //                btn.setTitle(btag.toStr(), forState: .Normal)
                //                btn.addTarget(self, action: "pushed:", forControlEvents: .TouchUpInside)
                self.view.addSubview(btn)
            }
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
