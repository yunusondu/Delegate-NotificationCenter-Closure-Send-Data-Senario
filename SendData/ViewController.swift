//
//  ViewController.swift
//  hw2
//
//  Created by Yunus Öndü on 23.12.2021.
//

import UIKit

class ViewController: UIViewController {

    //received data label
    @IBOutlet weak var receivedDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Notification Center addObserver method
        NotificationCenter.default.addObserver(self, selector: #selector(notificationTake(notification:)), name: .myNotification, object: nil)
    }
    
    //We assign the sent value to the label.
    @objc func notificationTake(notification: Notification){
        if let data = notification.object as? String {
            receivedDataLabel.text = data
            
        }else {
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "delegateSegue" {
            let secondVC: SecondViewController = segue.destination as! SecondViewController
            secondVC.delegate = self
        }
        else if segue.identifier == "closureSegue" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.dataTransferClosure = { [weak self] myData in
                    self?.receivedDataLabel.text = myData
                }
            }
        }
        else if  segue.identifier == "notificationSegue"{}
        //We dont have use segue for Notification Center. But I wanted to write. :)
    }
}
//extensiın for delegate method
extension ViewController: MyDataSendingDelegate {
    // Delegate Method
    func sendDataToFirstViewController(myData: String) {
        self.receivedDataLabel.text = myData
    }
}
