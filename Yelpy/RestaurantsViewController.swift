//
//  RestaurantsViewController.swift
//  Yelpy
//
//  Created by Laura Baker on 9/16/20.
//  Copyright © 2020 Kevin Baker. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var restaurantsArray: [[String: Any?]] = []
    
    //IMPORTANT TABLE RECIPE
    // 1: Add UITableViewDataSource and UITableViewDelegate
    //  : Use fix to add stubs (required functions)
    // 2: Implement the required functions
    // 3: add tableView.dataSource = self
    //        tableView.delegate = self
    // 4: Ensure required functions gets data from your list such as movies
    // 5: add self.tableView.reloadData() to make sure it reloads this data as needed
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        getAPIData()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func getAPIData(){
        API.getRestaurants() { (restaurants) in guard let restaurants = restaurants else {
            return
            }
            print (restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create restaurant cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        let rating = restaurant["rating"] as? Double
        
        cell.label.text = restaurant["name"] as? String ?? ""
        
        if(rating == 1.0)
        {
            cell.starsImage.image = UIImage(named: "extra_large_1")
        }
        else if(rating == 1.5)
        {
            cell.starsImage.image = UIImage(named: "extra_large_1_half")
        }
        else if(rating == 2.0)
        {
            cell.starsImage.image = UIImage(named: "extra_large_2")
        }
        else if(rating == 2.5)
        {
            cell.starsImage.image = UIImage(named: "extra_large_2_half")
        }
        else if(rating == 3.0)
        {
            cell.starsImage.image = UIImage(named: "extra_large_3")
        }
        else if(rating == 3.5)
        {
            cell.starsImage.image = UIImage(named: "extra_large_3_half")
        }
        else if(rating == 4.0)
        {
            cell.starsImage.image = UIImage(named: "extra_large_4")
        }
        else if(rating == 4.5)
        {
            cell.starsImage.image = UIImage(named: "extra_large_4_half")
        }
        else if(rating == 5.0)
        {
            cell.starsImage.image = UIImage(named: "extra_large_5")
        }
        
        
        
        
        
        
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        return cell
    }
}
