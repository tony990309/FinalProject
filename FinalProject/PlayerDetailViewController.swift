//
//  PlayerDetailViewController.swift
//  FinalProject
//
//  Created by User01 on 2019/1/13.
//  Copyright © 2019 chen. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController {
    
    var player: Player?
    
    @IBOutlet var picImg: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var num: UILabel!
    @IBOutlet var pos: UILabel!
    @IBOutlet var pts: UILabel!
    @IBOutlet var fgp: UILabel!
    @IBOutlet var tpp: UILabel!
    @IBOutlet var ftp: UILabel!
    @IBOutlet var reb: UILabel!
    @IBOutlet var ast: UILabel!
    @IBOutlet var stl: UILabel!
    @IBOutlet var to: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        if let player = player {
            let task = URLSession.shared.dataTask(with: player.pic) { (data, response , error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.picImg.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
            
            name.text = player.name
            num.text = "#" + player.number
            pos.text = player.position
            pts.text = player.pts
            fgp.text = player.fgp
            tpp.text = player.tpp
            ftp.text = player.ftp
            reb.text = player.reb
            ast.text = player.ast
            stl.text = player.stl
            to.text = player.to
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
