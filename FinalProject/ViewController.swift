//
//  ViewController.swift
//  FinalProject
//
//  Created by User01 on 2019/1/13.
//  Copyright © 2019 chen. All rights reserved.
//

import UIKit

import Foundation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let urlStr = "https://api.myjson.com/bins/72sc8".addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed) {
            if let url = URL(string: urlStr) {
                let task = URLSession.shared.dataTask(with: url) {
                    (data, response , error) in
                    if let data = data, let content = String(data: data, encoding: .utf8) {
                        print(content)
                        
                    }
                    
                }
                task.resume()
            }
        }
    }


}

