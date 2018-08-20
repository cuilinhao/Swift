//
//  HttpTools.swift
//  闭包使用
//
//  Created by 崔林豪 on 2018/8/17.
//  Copyright © 2018年 崔林豪. All rights reserved.
//

import UIKit

//可以不继承
class HttpTools {
    //闭包类型 : (参数列表) -> (返回值类型)
    /*
     @escaping ： 逃逸的
     如果再swift 中， 在另外一个地方用到finishedCallBack() 就需要加上@escaping
     */
    
    /***
    func loadData( finishedCallBack : @escaping () -> ()) {
        //1. 发送异步网络请求
        DispatchQueue.global().async {
            print("发送异步网络请求:\(Thread.current)")
            
            //2. 回到主线程
            DispatchQueue.main.sync {
                print("回到主线程:\(Thread.current)")
                
                //3. 进行回调
                finishedCallBack()
            }
        }
    }
 ***/
    
    var  finishedCallBack : ((_ jsonData : String) -> ())?
    
    func loadData(_  finishedCallBack : @escaping (_ jsonData : String ) -> ()) {
        
        self.finishedCallBack = finishedCallBack
        
        //1. 发送异步网络请求
        DispatchQueue.global().async {
            print("发送异步网络请求:\(Thread.current)")
            
            //2. 回到主线程
            DispatchQueue.main.sync {
                print("回到主线程:\(Thread.current)")
                
                //3. 进行回调
                finishedCallBack("json 数据")
            }
        }
    }
    
    
    
}
