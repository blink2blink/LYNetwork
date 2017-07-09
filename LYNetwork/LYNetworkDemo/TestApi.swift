//
//  TestApi.swift
//  LYNetwork
//
//  Created by XuHaonan on 2017/7/9.
//  Copyright © 2017年 yangqianguan.com. All rights reserved.
//

import Foundation

class registerApi: LYRequest {
  
  private var username: String
  private var password: String
  
  public init(_ username: String, _ password: String) {
    self.username = username
    self.password = password
    super.init()
  }
  
  public func userId() -> String {
    let response = self.responseJSON as! Dictionary<String, Any>
    return response["userId"] as! String
  }
  
  func requestUrl() -> String {
    return "/iphone/register"
  }
  
  func requestMethod() -> LYRequestMethod {
    return .POST
  }
  
  func responseSerializerType() -> LYResponseSerializerType {
    return .JSON
  }
  
  func requestArgument() -> [String : Any]? {
    return ["username" : self.username, "password" : self.password]
  }
  
}

class getUserInfoApi: LYRequest {
  private var userId: String
  
  public init(_ userId: String) {
    self.userId = userId
    super.init()
  }
  
  func requestUrl() -> String {
    return "/iphone/users"
  }
  
  func requestArgument() -> [String : Any]? {
    return ["userId" : self.userId]
  }
  
  override func cacheTimeInSeconds() -> Int {
    return 60 * 3
  }
}

class getImageApi: LYRequest {
  private var imageId: String
  
  public init(_ imageId: String) {
    self.imageId = imageId
    super.init()
  }
  
  func requestUrl() -> String {
    return "/iphone/images/" + self.imageId
  }
  
  func useCDN() -> Bool {
    return true
  }
  
  
  
}







