//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit

/// In this class we giving an access to share with info in others applications
final class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var pickerView: UIPickerView!

    // MARK: - Private properties
    private var shareButton = UIButton()
    private var textField = UITextField()
    private var activityViewController: UIActivityViewController?
    private var news: String = ""
    private var url: String = ""

    private var pickerElements = ["Raz", "Dva", "tut nado share sdelat"]

    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
        setupDelegates()
    }

    // MARK: - Private Methods
    private func setupDelegates() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    private func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        textField.center = view.center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text to share"
        textField.delegate = self
        view.addSubview(textField)
    }

    private func createButton() {
        shareButton = UIButton(type: .roundedRect)
        shareButton.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        shareButton.setTitle("Share", for: .normal)
        shareButton.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        view.addSubview(shareButton)
    }

    @objc private func handleShare(sender: UIButton) {
        let text = textField.text
        if text?.count == 0 {
            let message = "Snachala vvedite text i potom najmit button"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let alertControllerAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)

            alertController.addAction(alertControllerAction)
            present(alertController, animated: true, completion: nil)
        }
        activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nil"],
                                                          applicationActivities: nil)
        present(activityViewController!, animated: true, completion: nil)
    }

    private func shareItFunc() -> [Any] {
            var sharingData: [Any] = [Any]()

            if let text = textField.text {
                sharingData.append(text)
            }

            return sharingData
        }

    private func shareData() {
        let url = URL(string: "google.com")
        let shareText = "Your string goes here"
        let shareItems: [Any] = [shareText, url!]

        let activityVC = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityVC.excludedActivityTypes = [.airDrop, .postToFlickr,
                                            .assignToContact, .openInIBooks,
                                            .postToFacebook, .postToTwitter]

        self.present(activityVC, animated: true, completion: nil)
        }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerElements.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerElements[row]
        }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if row == 2 {
                shareData()
            }
        }
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
