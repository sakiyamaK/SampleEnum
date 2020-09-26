//
//  HumanModel2.swift
//  SampleEnum
//
//  Created by sakiyamaK on 2020/09/26.
//

import Foundation
import UIKit.UIImage

enum HumanModel2 {
  case man, woman

  var text: String {
    switch self {
    case .man:
      return "男性"
    case .woman:
      return "女性"
    }
  }

  var icon: UIImage? {
    switch self {
    case .man:
      return UIImage.init(named: "man")
    case .woman:
      return UIImage.init(named: "woman")
    }
  }

  var alertMessage: String {
    print(self)
    switch self {
    case .man:
      return "これは男性です"
    case .woman:
      return "これは女性です"
    }
  }
}
