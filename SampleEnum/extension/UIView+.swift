//
//  UIView+.swift
//  SampleEnum
//
//  Created by sakiyamaK on 2020/09/26.
//

import UIKit

struct UIEdgePriorities {
  var top: UILayoutPriority = .required
  var leading: UILayoutPriority = .required
  var trailing: UILayoutPriority = .required
  var bottom: UILayoutPriority = .required
}

extension UIView {
  func widthEqualTo(_ width: CGFloat) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.widthAnchor.constraint(equalToConstant: width).isActive = true
  }

  func heightEqualTo(_ height: CGFloat) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.heightAnchor.constraint(equalToConstant: height).isActive = true
  }

  func sizeEqualTo(_ size: CGSize) {
    self.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      self.widthAnchor.constraint(equalToConstant: size.width),
      self.heightAnchor.constraint(equalToConstant: size.height)
    ]
    NSLayoutConstraint.activate(constraints)
  }

  func edgesEqualToSuperView(margin: UIEdgeInsets = .zero, priorities: UIEdgePriorities = .init()) {
    guard let _superview = superview else { return }
    self.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      self.topAnchor.constraint(equalTo: _superview.topAnchor, constant: margin.top),
      self.leadingAnchor.constraint(equalTo: _superview.leadingAnchor, constant: margin.left),
      _superview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: margin.right),
      _superview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: margin.bottom)
    ]
    constraints[0].priority = priorities.top
    constraints[1].priority = priorities.leading
    constraints[2].priority = priorities.trailing
    constraints[3].priority = priorities.bottom

    NSLayoutConstraint.activate(constraints)
  }

  func setHuggingCompressionResitanceAll(priority: UILayoutPriority = .defaultHigh) {
    self.setContentHuggingPriority(priority, for: .horizontal)
    self.setContentHuggingPriority(priority, for: .vertical)
    self.setContentCompressionResistancePriority(priority, for: .horizontal)
    self.setContentCompressionResistancePriority(priority, for: .vertical)
  }
}
