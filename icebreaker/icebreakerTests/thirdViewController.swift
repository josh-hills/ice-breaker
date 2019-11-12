


import UIKit

class thirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet var tableView: UITableView!
    
    
    

    let hobbies = ["Airsofting","Acting", "Aeromodeling", "Animals/pets/dogs", "Archery", "Arts", "Astronomy", "Backgammon", "Badminton", "Baseball", "Basketball", "Beatboxing", "Bicycling", "Bird watching", "BMX", "BoardGames", "Boating", "Body Building", "Bowling", "Calligraphy", "Camping", "Canoeing", "Car Racing", "Casino Gambling","Chess", "Collecting (misc.)", "Music", "Computers", "Cooking", "Crochet", "Crossword Puzzles", "Dancing", "Darts", "Dodgeball", "Drawing", "Electronics", "Entertaining", "Fencing", "Fishing", "Football", "Games", "Geocaching", "Golf", "Guitar", "Gymnastics", "Hiking", "Horse riding", "Hunting", "Iceskating", "Inventing", "Jigsaw Puzzles", "Juggling", "Jump Roping", "Kayaking", "Knitting", "Legos", "Lacrosse", "Magic", "Models", "Marksmanship", "Metal Detecting", "Motorcycles", "Mountain Biking", "Origami", "Painting", "Paintball", "Parkour", "Photography", "Piano", "Pyrotechnics", "Rapping", "R/C", "Reading", "Robotics", "Rock Climbing", "Rock Collecting", "Rockets", "Running", "Self Defense", "Shooting", "Skiing", "Shopping", "Singing", "Skateboarding", "Snorkeling", "Snowboarding", "Soccer", "Speed Cubing (rubix cube)", "Stamp Collecting", "Surfing", "Swimming", "Tennis", "Tetris", "Traveling", "Treasure Hunting", "Ultimate Frisbee", "Video Games", "Warhammer", "Weightlifting", "Windsurfing", "Woodworking", "World Record Breaking", "Wrestling", "Writing", "Yoga", "YoYo"]
    
    var filteredHobbies:[String] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var filteredHobbies = hobbies
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredHobbies = hobbies
        } else {
            // Filter the results
            filteredHobbies = hobbies.filter { $0.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredHobbies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = self.filteredHobbies[indexPath.row]
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
    }
    
}


