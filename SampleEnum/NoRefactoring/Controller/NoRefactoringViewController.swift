//
//  NoRefactoringViewController.swift
//  SampleEnum
//
//  Created by sakiyamaK on 2020/09/26.
//

import UIKit

final class NoRefactoringViewController: UIViewController {

  @IBOutlet private weak var stackView: UIStackView!

  let humans: [HumanModel1] = [.man, .woman]

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()

  }

  private func configureView() {
    for human in humans {
      let cardView = CardView1()
      cardView.configure(human: human)
      stackView.addArrangedSubview(cardView)
      let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapCard(sender:)))
      cardView.addGestureRecognizer(tapGesture)
    }
  }

  private func showAlert(message: String) {
    let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction.init(title: "キャンセル", style: .destructive))
    self.present(alert, animated: true)
  }

  @objc func tapCard(sender: UITapGestureRecognizer) {
    guard let cardView = sender.view as? CardView1 else { return }
    switch cardView.human {
    case .man:
      showAlert(message: "これは男性です")
      break
    case .woman:
      showAlert(message: "これは女性です")
      break
    }
  }
}
