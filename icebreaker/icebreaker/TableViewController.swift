//
//  TableViewController.swift
//  icebreaker
//
//  Created by Josh Hills on 2018-01-15.
//  Copyright © 2018 Josh Hills. All rights reserved.
//

import UIKit

var selectedHobbies : [String] = [] //Hold a global value of the selected hobbies
var numberSelected:Int = 0 //Hold the number of selected hobbies


class TableViewController: UITableViewController, UISearchResultsUpdating {

    

    
    
// list of all hobbies, ideally
  let hobbies = ["Airsofting","Acting", "Aeromodeling", "Animals/pets/dogs", "Archery", "Arts", "Astronomy", "Backgammon", "Badminton", "Baseball", "Basketball", "Beatboxing", "Bicycling", "Bird watching", "BMX", "BoardGames", "Boating", "Body Building", "Bowling", "Calligraphy", "Camping", "Canoeing", "Car Racing", "Casino Gambling","Chess", "Collecting (misc.)", "Music", "Computers", "Cooking", "Crochet", "Crossword Puzzles", "Dancing", "Darts", "Dodgeball", "Drawing", "Electronics", "Entertaining", "Fencing", "Fishing", "Football", "Games", "Geocaching", "Golf", "Guitar", "Gymnastics", "Hiking", "Horse riding", "Hunting", "Iceskating", "Inventing", "Jigsaw Puzzles", "Juggling", "Jump Roping", "Kayaking", "Knitting", "Legos", "Lacrosse", "Magic", "Models", "Marksmanship","Martial Arts",	 "Metal Detecting", "Motorcycles", "Mountain Biking", "Origami", "Painting", "Paintball", "Parkour", "Photography", "Piano", "Pyrotechnics", "Rapping", "R/C", "Reading", "Robotics", "Rock Climbing", "Rock Collecting", "Rockets", "Running", "Self Defense", "Shooting", "Skiing", "Shopping", "Singing", "Skateboarding", "Snorkeling", "Snowboarding", "Soccer", "Speed Cubing (rubix cube)", "Stamp Collecting", "Surfing", "Swimming", "Tennis", "Tetris", "Traveling", "Treasure Hunting", "Ultimate Frisbee", "Video Games", "Warhammer", "Weightlifting", "Windsurfing", "Woodworking", "World Record Breaking", "Wrestling", "Writing", "Yoga", "YoYo"]

        
    var filteredHobbies = [String]() //The hobbies filted by the search bar
    var searchController = UISearchController()
    var resultController = UITableViewController()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.searchController = UISearchController(searchResultsController: resultController)
            tableView.tableHeaderView = self.searchController.searchBar
            
            self.searchController.searchResultsUpdater = self
            
            self.resultController.tableView.delegate = self
            self.resultController.tableView.dataSource = self
            setGradientToTableView(tableView: tableView, UIColor.cyan, UIColor.orange)
          
            
        }
        //updates search results according to what is in the search bar, filters hobbies out that dont contain the same string of text
        func updateSearchResults(for searchController: UISearchController) {
            self.filteredHobbies = hobbies.filter({ (hobbies: String) -> Bool in
                
                if hobbies.contains(searchController.searchBar.text!)
                {
                    return true
                }
                else
                {
                    return false
                }
                
            })
            
            self.resultController.tableView.reloadData()
        }
        
        
        
    
       // number of
        override func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
            
        }
    //swipe actions for table view
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                let important = importantAction(at: indexPath)
                return UISwipeActionsConfiguration(actions: [important])
        }
    //takes the hobby according to the searched hobbies (if they are filtered)
    func importantAction(at IndexPath: IndexPath) -> UIContextualAction {
        var hobby = ""
        if searchController.searchBar.text! == "" {
            hobby = hobbies[IndexPath.row]
            
        } else {
            hobby = filteredHobbies[IndexPath.row]
        }
        
        let action = UIContextualAction(style: .normal, title: "Important") { (action, view, completion) in
            completion(true)
        }
        // wont add hobbies otherwise
        if selectedHobbies.contains(hobby){
            action.title = "Add Hobby"
            action.backgroundColor = .gray
            
            print(selectedHobbies)
            return action
            
        }else {
        // adds hobbies if they arent in the array
            selectedHobbies.append(hobby)
            action.title = "Add Hobby"
            
            action.backgroundColor = .green
            numberSelected += 1
            if numberSelected >= 10 {
                performSegue(withIdentifier: "segue1", sender: nil)
                print(selectedHobbies)
            }
            print(selectedHobbies)
            return action
        }
    }
    func removeAction(at IndexPath: IndexPath) -> UIContextualAction {
        var hobby = ""
        if searchController.searchBar.text! == "" {
            hobby = hobbies[IndexPath.row]
        } else {
            hobby = filteredHobbies[IndexPath.row]
        }
        
        let action = UIContextualAction(style: .normal, title: "Important") { (action, view, completion) in
            completion(true)
        }
        if selectedHobbies.contains(hobby){ //removes hobby if in selected hobbies
            
            selectedHobbies = selectedHobbies.filter{$0 != hobby}
            action.title = "Remove Hobby"
            action.backgroundColor = .red
            numberSelected -= 1
            
            print(selectedHobbies)
            return action
        }else {
            action.title = "Remove Hobby"
            action.backgroundColor = .gray
            print(selectedHobbies)
            return action
        }
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = removeAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [remove])
    }
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            
            if tableView == resultController.tableView
            {
                return self.filteredHobbies.count
            }
            else
            {
                return self.hobbies.count
            }
            
        }
    

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = UITableViewCell()
            

            
            if tableView == resultController.tableView
            {
                cell.backgroundColor = UIColor.clear
                cell.textLabel?.text = self.filteredHobbies [indexPath.row]
            }
            else
            {
               cell.backgroundColor = UIColor.clear
                cell.textLabel?.text = self.hobbies[indexPath.row]
            }
            

            return cell
            
        }
 
    
    func setGradientToTableView(tableView: UITableView, _ topColor:UIColor, _ bottomColor:UIColor) {
        
        let gradientBackgroundColors = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations = [0.0,1.0]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        gradientLayer.frame = tableView.bounds
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.backgroundView = backgroundView
    }
    

}

