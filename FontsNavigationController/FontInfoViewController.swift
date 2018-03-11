//
//  FontInfoViewController.swift
//  FontsNavigationController
//
//  Created by Emily on 3/9/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {

    var font: UIFont!
    var favorite: Bool = false
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv" + "WwXxYyZz0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.isOn = favorite
    }

    @IBAction func sliderFontSize(_ sender: UISlider) {
        let newSize = roundf(sender.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }
    
    
    @IBAction func toggleFavorites(_ sender: UISwitch) {
        let favoritesList = FavoritesList.sharedFavoritesList
        if(sender.isOn){
            favoritesList.addFavorite(fontName: font.fontName)
        }else{
            favoritesList.removeFavorite(fontName:font.fontName)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
