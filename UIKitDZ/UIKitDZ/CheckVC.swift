//
//  CheckVC.swift
//  UIKitDZ
//
//  Created by Эл on 25.09.2022.
//

import UIKit

class CheckVC: UIViewController {

    @IBOutlet weak var firResult: UILabel!
    @IBOutlet weak var tableNumberResult: UILabel!
    @IBOutlet weak var priceResult: UILabel!
    var fioResult = CafeMarioVC()
    var dataFromModel = Data()
    override func viewDidLoad() {
        super.viewDidLoad()
        firResult.text = dataFromModel.fio
    }
}
