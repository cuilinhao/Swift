//
//  ViewController.swift
//  闭包使用
//
//  Created by 崔林豪 on 2018/8/17.
//  Copyright © 2018年 崔林豪. All rights reserved.
///Users/cuilinhao/Desktop/闭包使用/闭包使用

import UIKit


class ViewController: UIViewController {

    var httpTools : HttpTools?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        httpTools = HttpTools()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("----------")
        
        /*
         
        httpTools?.loadData(finishedCallBack: {
         print("在viewcontroller 获取数据")
        })
         */
        
        //有没有行程循环引用？
        /*
         解决方法一：
 
        weak var weakSelf : ViewController? = self
        
        httpTools?.loadData({ (jsonData : String ) in
            print("在viewcontroller 获取数据 \(jsonData)")
            
            weakSelf?.view.backgroundColor = UIColor.red
        })
    }
     */
        
        //解决方法二：
        
        httpTools?.loadData({ [weak self](jsonData : String ) in
            print("在viewcontroller 获取数据 \(jsonData)")
            
            self?.view.backgroundColor = UIColor.red
        })
    }
    
    //尾随闭包的概念
    //如果再函数中， 闭包是最后一个参数，则可以写成尾随闭包
    //如果是唯一的参数， 也可以将前面的()省略掉
    
        
    
    deinit {
        print("viewController-----销毁")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

