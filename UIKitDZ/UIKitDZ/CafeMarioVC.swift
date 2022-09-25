//
//  CafeMarioVC.swift
//  UIKitDZ
//
//  Created by Эл on 25.09.2022.
//

import UIKit

class CafeMarioVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fioInfo: UITextField?
    @IBOutlet weak var countOfGuests: UITextField!
    @IBOutlet weak var tableNumber: UITextField!
    @IBOutlet weak var tableIsReserved: UISwitch!
    @IBOutlet weak var prePaid: UISwitch!
    @IBOutlet weak var isVIp: UISwitch!
    var data = Data()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showFio(_ sender: UITextField) {
        data.fio?.append(sender.text ?? "")
        print(data.fio)
    }
    @IBAction func payCheck(_ sender: Any) {
        let actionController = UIAlertController(
                    title: "Выставить счет?",
                    message: "Продолжить?",
                    preferredStyle: .alert
                )
                let cancelAction = UIAlertAction(title: "Нет", style: .default)
                let billAction = UIAlertAction(title: "Да", style: .default) { _ in
                    let thirdVC = UIStoryboard(name: "Main", bundle: nil)
                    guard let nextScreen = thirdVC.instantiateViewController(withIdentifier:
                                                                                "CheckID") as? CheckVC else { return }
                    nextScreen.modalPresentationStyle = .fullScreen
                    self.show(nextScreen, sender: nil)
                }
                actionController.addAction(cancelAction)
                actionController.addAction(billAction)
                self.present(actionController, animated: true, completion: nil)
                self.view.endEditing(true)
    }
}
