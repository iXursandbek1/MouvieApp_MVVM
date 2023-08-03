//
//  MainViewController.swift
//  MouvieApp_MVVM
//
//  Created by Xursandbek Qambaraliyev on 01/08/23.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: IBoutets:
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configView()
    }

    func configView() {
        
        self.title = "Main View"
        self.view.backgroundColor = .yellow
        
        setupTableView()
    }
}
