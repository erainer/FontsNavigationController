//
//  FavoritesList.swift
//  FontsNavigationController
//
//  Created by Emily on 3/5/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList{
    static let sharedFavoritesList = FavoritesList()
    private(set) var favorites: [String]
    
    init(){
        let defualts = UserDefaults.standard
        let storedFavorites = defualts.object(forKey: "favorites") as? [String]
        
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorite(fontName: String){
        if(!favorites.contains(fontName)){
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    func removeFavorite(fontName: String){
        if let index = favorites.index(of: fontName){
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    private func saveFavorites(){
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int){
        let item = favorites[from]
        favorites.remove(at:from)
        favorites.insert(item, at:to)
        saveFavorites()
    }
}
