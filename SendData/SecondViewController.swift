//
//  SecondViewController.swift
//  hw2
//
//  Created by Yunus Öndü on 23.12.2021.
//

import UIKit

//Extension For Notification Center.
extension Notification.Name{
    static let myNotification = Notification.Name("myNotification")
}



class SecondViewController: UIViewController {
    
    //Second VC Label We are sending the text value of it.

    @IBOutlet weak var dataToSendTextField: UITextField!
    
    //We created a new variable to access the delegate method.
    var delegate: MyDataSendingDelegate? = nil
    
    //Our closing structure
    var dataTransferClosure: ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendDataBtnTapped(_ sender: Any) {
        //For Delegate send data
        if self.delegate != nil && self.dataToSendTextField.text != nil {
            let dataToBeSent = self.dataToSendTextField.text
            self.delegate?.sendDataToFirstViewController(myData: dataToBeSent!)
            print("Delegate is work")
           }
        //For Closure send data
        else if self.dataTransferClosure != nil && self.dataToSendTextField.text != nil {
            self.dataTransferClosure?(dataToSendTextField.text ?? "")
            print("Closure is work")
        }else {
            //For NotificaitonCenter send data
            let data = dataToSendTextField.text
            NotificationCenter.default.post(name: .myNotification, object: data)
            print("NotificationCenter is work")
        }
            dismiss(animated: true)//Automatically closes our page
        }
}
