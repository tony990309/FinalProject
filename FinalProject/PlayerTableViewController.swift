//
//  PlayerTableViewController.swift
//  FinalProject
//
//  Created by User01 on 2019/1/13.
//  Copyright © 2019 chen. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {

    var players = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlStr = "https://api.myjson.com/bins/72sc8".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data, let playerResults = try? decoder.decode(PlayerResults.self, from: data) {
                    self.players = playerResults.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
            }
            task.resume()
            
        }
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)as! PlayerTableViewCell
        
        // Configure the cell...
        let player = players[indexPath.row]
        cell.nameLabel.text = player.name
        
        var sub = "#"
        sub += player.number
        sub += " "
        sub += player.position
        cell.infoLabel.text = sub
        
        let task = URLSession.shared.dataTask(with: player.pic) { (data, response , error) in
            if let data = data {
                DispatchQueue.main.async {
                    cell.picImg.image = UIImage(data: data)
                }
            }
        }
        task.resume()
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let controller = segue.destination as? PlayerDetailViewController
        if let row = tableView.indexPathForSelectedRow?.row {
            controller?.player = players[row]
        }
    }
    

}
