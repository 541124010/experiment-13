//
//  ViewController.swift
//  多线程大数
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 xh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    var count=0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count+=1
            self.timerLabel.text="\(self.count)"
            print("timer thread:\(Thread.current)")
        }
    }

    @IBAction func calculate(_ sender: Any) {
        var sum=0
      //  for _ in 1...100{
            DispatchQueue.global().async{
                print("run thread:\(Thread.current)")
                for i in 1...9999999{
                   // usleep(10000)
                    sum+=i
                }
                DispatchQueue.main.async {
                      self.testLabel.text = "sum:\(sum)"
                }
                
            }
      //  }
        
    }
    
}

