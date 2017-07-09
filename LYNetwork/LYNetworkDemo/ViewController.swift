//
//  ViewController.swift
//  LYNetwork
//
//  Created by zakariyyasv on 2017/6/22.
//  Copyright © 2017年 yangqianguan.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LYChainRequestDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.sendChainRequest()
  }

  private func sendChainRequest() {
    let reg = registerApi.init("username", "password")
    let chainReq = LYChainRequest()
    chainReq.addRequest(reg) { (chainRequest, baseRequest) -> (Void) in
      let register = baseRequest as! registerApi
      print("\(register.responseStatusCode)")
      let getUser = getUserInfoApi.init(register.userId())
      chainRequest.addRequest(getUser)
    }
    chainReq.delegate = self
    chainReq.start()
  }
  
  func chainRequestFinished(_ request: LYChainRequest) {
    print("request success")
  }
  
  func chainRequestFailed(_ chainRequest: LYChainRequest, failedBaseRequest baseRequest: LYBaseRequest) {
    print("request failed")
  }

}

