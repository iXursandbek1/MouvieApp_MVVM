//
//  MainViewModel.swift
//  MouvieApp_MVVM
//
//  Created by Xursandbek Qambaraliyev on 03/08/23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(value: false)
    var cellDataSourse: Observable<[Movie]> = Observable(value: nil)
    var dataSourse: TrendingMouvieModel?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        
        self.dataSourse?.results.count ?? 0
    }
    
    func getData() {
        
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        APICaller.getTrendingMouvies { [weak self] result in
            
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top trending Movies Count \(data.results.count)")
                self?.dataSourse = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
        
    func mapCellData() {
        self.cellDataSourse.value = self.dataSourse?.results ?? []
    }
    
    func getMoviewTitle(_ movie: Movie) -> String {
        
        return movie.title ?? movie.name ?? ""
    }
}
