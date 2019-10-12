//
//  ViewController.swift
//  Metod
//
//  Created by Максим Томилов on 12.10.2019.
//  Copyright © 2019 Tomily. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var addText: UITextField!
    @IBOutlet weak var arraySource: UILabel!
    @IBOutlet weak var arraySort: UILabel!
    
    private var sourceArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Botton(_ sender: Any) {
        let validData = validaceArray(value: addText.text)
        guard validData else {return}
        let sizeArray = Int(addText.text!)
        let integerArray = [Int](1...sizeArray!)
        arraySource.text = "Исходный массив:  \(integerArray)"
        var resultArray: [Int] = []
        resultArray = integerArray.filter({$0%3 == 0})
        var orderArray = integerArray.filter({$0%3 != 0}).sorted().reversed()
        resultArray += orderArray
        arraySort.text = "Отсортироавнный массив:  \(resultArray)"
    }
    
    func validaceArray(value: String?) -> Bool {
        if value == nil || value!.isEmpty{
            ErrorAlert(message: "Введите значение")
            return false
        }
        guard let value1 = Int(value!) else {
            ErrorAlert(message: "Введите целое число")
            return false
        }
        guard value1 > 1 && value1 <= 10000 else {
            ErrorAlert(message: "Введите число от 2 до 10000")
            return false
        }
        return true
    }
    
    func ErrorAlert(message: String) {
        let alertC = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
        alertC.addAction(action1)
        self.present(alertC, animated: true, completion: nil)
    }
}

