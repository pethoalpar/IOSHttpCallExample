//
//  ViewController.swift
//  IOSHttpCall
//
//  Created by Petho Alpar on 01/06/2017.
//  Copyright © 2017 Petho Alpar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func get(_ sender: Any) {
        let url = URL(string: "http://192.168.0.104:7676?data="+textField.text!)
        let task = URLSession.shared.dataTask(with: url!){data, response, error in
            guard error == nil else{
                DispatchQueue.main.async {
                    self.textView.text = error! as? String
                }
                return
            }
            guard let data = data else{
                DispatchQueue.main.async {
                    self.textView.text = "The answer is empty"
                }
                return
            }
            DispatchQueue.main.async {
                self.textView.text = NSString(data: data,encoding: String.Encoding.utf8.rawValue) as String?
            }
        }
        task.resume()
    }

    @IBAction func post(_ sender: Any) {
        var request = URLRequest(url: URL(string: "http://192.168.0.104:7676" )!)
        request.httpMethod = "POST"
        let postStr = textField.text
        request.httpBody = postStr?.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            guard error == nil else{
                DispatchQueue.main.async {
                    self.textView.text = error! as? String
                }
                return
            }
            guard let data = data else{
                DispatchQueue.main.async {
                    self.textView.text = "The answer is empty"
                }
                return
            }
            DispatchQueue.main.async {
                self.textView.text = NSString(data: data,encoding: String.Encoding.utf8.rawValue) as String?
            }
        }
        task.resume()

    }
    @IBAction func put(_ sender: Any) {
        var request = URLRequest(url: URL(string: "http://192.168.0.104:7676" )!)
        request.httpMethod = "PUT"
        let postStr = textField.text
        request.httpBody = postStr?.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            guard error == nil else{
                DispatchQueue.main.async {
                    self.textView.text = error! as? String
                }
                return
            }
            guard let data = data else{
                DispatchQueue.main.async {
                    self.textView.text = "The answer is empty"
                }
                return
            }
            DispatchQueue.main.async {
                self.textView.text = NSString(data: data,encoding: String.Encoding.utf8.rawValue) as String?
            }
        }
        task.resume()
    }
}

