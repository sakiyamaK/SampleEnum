//
//  CardView1.swift
//  SampleEnum
//
//  Created by sakiyamaK on 2020/09/26.
//

import UIKit

final class CardView1: UIView {
  private(set) var human: HumanModel1 = .woman
  private let nameLabel: UILabel = .init()
  private let iconView: UIImageView = .init()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
    configure(human: self.human)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(human: HumanModel1) {
    self.human = human
    switch human {
    case .man:
      self.nameLabel.text = "男性"
      self.iconView.image = UIImage.init(named: "man")
    case .woman:
      self.nameLabel.text = "女性"
      self.iconView.image = UIImage.init(named: "woman")
    }
  }

  private func setupView() {

    let containerView: UIView = .init()
    self.addSubview(containerView)
    containerView.edgesEqualToSuperView(margin: UIEdgeInsets.init(top: 8, left: 16, bottom: 8, right: 16))
    containerView.backgroundColor = .white

    let vStackView: UIStackView = .init()
    containerView.addSubview(vStackView)
    vStackView.edgesEqualToSuperView()
    vStackView.axis = .vertical
    vStackView.alignment = .fill
    vStackView.distribution = .fill
    vStackView.spacing = 4

    let hStackView = setupContentStackView()
    vStackView.addArrangedSubview(hStackView)

    let border: UIView = .init()
    vStackView.addArrangedSubview(border)
    border.backgroundColor = .gray
    border.heightEqualTo(1)
  }

  private func setupContentStackView() -> UIStackView {
    let hStackView: UIStackView = .init()
    hStackView.axis = .horizontal
    hStackView.alignment = .fill

    hStackView.addArrangedSubview(nameLabel)
    nameLabel.text = "default"
    nameLabel.setHuggingCompressionResitanceAll()

    hStackView.addArrangedSubview(iconView)
    iconView.sizeEqualTo(CGSize(width: 50, height: 50))
    iconView.setHuggingCompressionResitanceAll(priority: .required)
    iconView.contentMode = .scaleAspectFit

    return hStackView
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
private struct CardView1Representable: UIViewRepresentable {
  let view = CardView1()
  func makeUIView(context: Context) -> UIView {
    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) { }

  // 作ったViewにパラメータを与える
  func configure(human: HumanModel1) -> CardView1Representable {
    view.configure(human: human)
    return self
  }
}

@available(iOS 13.0, *)
struct CardView1_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CardView1Representable()
        .previewLayout(.fixed(width: 200, height: 100))
        .previewDisplayName("未設定")

      CardView1Representable()
        .configure(human: .woman)
        .previewLayout(.fixed(width: 200, height: 100))
        .previewDisplayName("女性")

      CardView1Representable()
        .configure(human: .man)
        .previewLayout(.fixed(width: 200, height: 100))
        .previewDisplayName("男性")
    }
  }
}
#endif


