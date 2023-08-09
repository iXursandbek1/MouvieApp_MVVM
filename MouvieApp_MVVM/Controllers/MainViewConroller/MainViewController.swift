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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //MARK: Variables:
    var cellDataSourse: [MovieTableViewCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getData()
    }

    func configView() {
        
        self.title = "Main View"
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    func bindViewModel() {
        
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSourse.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            
            self.cellDataSourse = movies
            self.reloadTableView()
        }
    }
}
