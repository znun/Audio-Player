//
//  ViewController.swift
//  Audio Player
//
//  Created by Mahmudul Hasan on 24/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
        
    }

    func   configureSongs() {
        songs.append(Song(name: "Until I Found You",
                          albumName: "Putzen & Aufräumen",
                          artistName: "Stephen Sanchez",
                          imageName: "cover1",
                          trackName: "audio1"))
        songs.append(Song(name: "Shape of My Heart",
                          albumName: "Black & Blue",
                          artistName: "Backstreet Boys",
                          imageName: "cover2",
                          trackName: "audio2"))
        songs.append(Song(name: "Smells Like Teen Spirit",
                          albumName: "Nevermind",
                          artistName: "Nirvana",
                          imageName: "cover3",
                          trackName: "audio3"))
    }
    
    //table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        //configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
      
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        
        vc.songs = songs
        vc.position = position
        
        present(vc, animated: true)
    }
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
