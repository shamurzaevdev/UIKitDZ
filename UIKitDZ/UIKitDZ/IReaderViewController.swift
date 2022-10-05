//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit
/// There are our iReader body
///
final class IReaderViewController: UIViewController {

    // MARK: - Constants
    enum Constants {
        static let iReader = """
    France's railway network, which stretches 29,473 kilometres (18,314 mi) as of 2008,
 is the second most extensive in Western Europe after Germany. It is operated by the SNCF,
 and high-speed trains include the Thalys, the Eurostar and TGV, which travels at 320 km/h (199 mph).
 The Eurostar, along with the Eurotunnel Shuttle, connects with the United Kingdom through the Channel Tunnel.
Rail connections exist to all other neighbouring countries in Europe except Andorra.
Intra-urban connections are also well developed, with most major cities having underground or tramway services
complementing bus services.
    There are approximately 1,027,183 kilometres (638,262 mi) of serviceable roadway in France,
ranking it the most extensive network of the European continent.
The Paris region is enveloped with the densest network of roads and highways,
which connect it with virtually all parts of the country.
French roads also handle substantial international traffic,
connecting with cities in neighbouring Belgium, Luxembourg, Germany,
Switzerland, Italy, Spain, Andorra and Monaco.
There is no annual registration fee or road tax; however, usage of the mostly
privately owned motorways is through tolls except in the vicinity of large communes.
The new car market is dominated by domestic brands such as Renault, Peugeot and Citroën.
France possesses the Millau Viaduct, the world's tallest bridge,
and has built many important bridges such as the Pont de Normandie.
Diesel and gasoline fuelled cars and lorries cause a large part of the country's air
pollution and greenhouse gas emissions. Air France is one of the biggest airlines in the world.
    There are 464 airports in France. Charles de Gaulle Airport,
located in the vicinity of Paris, is the largest and busiest airport in the country,
handling the vast majority of popular and commercial traffic and connecting
Paris with virtually all major cities across the world.
Air France is the national carrier airline, although numerous private
airline companies provide domestic and international travel services.
There are ten major ports in France, the largest of which is in Marseille,
which also is the largest bordering the Mediterranean Sea.
12,261 kilometres (7,619 mi) of waterways traverse France including the Canal du Midi,
which connects the Mediterranean Sea to the Atlantic Ocean through the Garonne river.
"""
        static let increaseThicknessFont = "A"
        static let reduceThicknessFont = "a"
        static let nameTextFont = ["Optima", "Helvetica", "American Typewriter", "Times New Roman"]
        static let textFont = [UIFont(name: "Helvetica", size: 17),
                               UIFont(name: "Times New Roman", size: 17),
                               UIFont(name: "Optima", size: 17),
                               UIFont(name: "American Typewriter", size: 17)]
    }

    // MARK: - Private Properties

    let allData = AllDataClass()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAll()
    }

    // MARK: - Private Methods
    private func createTextView() {
        allData.iReaderText.frame = CGRect(x: 20, y: 90, width: view.bounds.width - 40,
                                    height: view.bounds.height / 2)
        allData.iReaderText.text = Constants.iReader
        allData.iReaderText.isEditable = false
        allData.iReaderText.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        allData.iReaderText.font = UIFont.systemFont(ofSize: 17)
        allData.iReaderText.backgroundColor = .white
        view.addSubview(allData.iReaderText)
    }

    private func createPicker() {
        allData.fontsPicker.frame = CGRect(x: 20, y: 640, width: 250, height: 160)
        allData.fontsPicker.delegate = self
        allData.fontsPicker.dataSource = self
        view.addSubview(allData.fontsPicker)
    }

    private func createButtons() {

        increaseThickness()
        reduceThickness()
        changeTextColorToBlue()
        changeTextColorToOrange()
        changeTextColorWithBlack()
        changeTextColorWithWhite()
        shareData()
    }
    
    private func createSlider() {
        allData.sizeTextSlider.frame = CGRect(x: 20, y: 550, width: 374, height: 30)
        allData.sizeTextSlider.thumbTintColor = .red
        allData.sizeTextSlider.minimumValue = 10
        allData.sizeTextSlider.maximumValue = 70
        allData.sizeTextSlider.addTarget(self, action: #selector(sizeTextAction), for: .valueChanged)
        view.addSubview(allData.sizeTextSlider)
    }

    private func createSwitch() {
        allData.backgroundColorSwitch.frame = CGRect(x: 300, y: 605, width: 0, height: 0)
        allData.backgroundColorSwitch.addTarget(self, action: #selector(backgroundColorAction), for: .valueChanged)
        allData.backgroundColorSwitch.isOn = true
        view.addSubview(allData.backgroundColorSwitch)
    }

    private func setupAll() {
        createButtons()
        createSlider()
        createPicker()
        createSwitch()
        createTextView()
    }

    // MARK: - objc Private Methods
    @objc func increaseThicknessFontAction() {
        allData.iReaderText.font = UIFont.boldSystemFont(ofSize: allData.iReaderText.font?.pointSize ?? 10)
    }

    @objc func reduceThicknessFontAction() {
        allData.iReaderText.font = UIFont.systemFont(ofSize: allData.iReaderText.font?.pointSize ?? 10)
    }

    @objc func textColorBlackAction() {
        allData.iReaderText.textColor = .black
    }

    @objc func textColorWhiteAction() {
        allData.iReaderText.textColor = .white
    }

    @objc func textColorOrangeAction() {
        allData.iReaderText.textColor = .orange
    }

    @objc func textColorBlueAction() {
        allData.iReaderText.textColor = .blue
    }

    @objc func backgroundColorAction() {
        if allData.backgroundColorSwitch.isOn {
            view.backgroundColor = .white
            allData.iReaderText.backgroundColor = .white
        } else {
            view.backgroundColor = .black
            allData.iReaderText.backgroundColor = .black
        }
    }

    @objc func sizeTextAction() {
        allData.iReaderText.font = allData.iReaderText.font?.withSize(CGFloat(allData.sizeTextSlider.value))
    }

    @objc func shareAction() {
        let url = URL(string: "https://facebook.com")
        let buttonActivityViewController = UIActivityViewController(activityItems:
                                                                        [url ?? "Error",
                                                                        allData.iReaderText.text ?? "Error"],
                                                                        applicationActivities: nil)
        present(buttonActivityViewController, animated: true)
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension IReaderViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.textFont.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.nameTextFont[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        allData.iReaderText.font = Constants.textFont[row]
    }
}
