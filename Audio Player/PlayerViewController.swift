//
//  PlayerViewController.swift
//  Audio Player
//
//  Created by Mahmudul Hasan on 25/2/23.
//

import UIKit

class PlayerViewController: UIViewController {

    public var position : Int = 0
    public var songs : [Song] = []
    
    @IBOutlet var holder : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 1 {
            configure()
        }
    }
    
    func configure() {
        //set up player
        
        //set up user interface elements
    }
    

}
