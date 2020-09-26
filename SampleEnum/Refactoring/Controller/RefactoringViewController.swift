//
//  RefactoringViewController.swift
//  SampleEnum
//
//  Created by sakiyamaK on 2020/09/26.
//

import UIKit

final class RefactoringViewController: UIViewController {


  @IBOutlet private weak var stackView: UIStackView!

  let humans: [HumanModel2] = [.man, .woman]

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
  }

  private func configureView() {
    for human in humans {
      let cardView = CardView2()
      cardView.configure(human: human)
      let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapCard(sender:)))
      cardView.addGestureRecognizer(tapGesture)
      stackView.addArrangedSubview(cardView)
    }
  }

  private func showAlert(message: String) {
    let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction.init(title: "キャンセル", style: .destructive))
    self.present(alert, animated: true)
  }

  @objc func tapCard(sender: UITapGestureRecognizer) {
    guard let cardView = sender.view as? CardView2 else { return }
    showAlert(message: cardView.human.alertMessage)
  }
}
