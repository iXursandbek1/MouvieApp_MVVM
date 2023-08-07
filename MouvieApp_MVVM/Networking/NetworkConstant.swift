//
//  NetworkConstant.swift
//  MouvieApp_MVVM
//
//  Created by Xursandbek Qambaraliyev on 05/08/23.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init () {
        
        //Singeltone
    }
    
    public var apiKey: String {
        get {
            //Api key from https://www.themoviedb.org/
            
            return "8618ef462c1d9873128b33cc811c2789"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
