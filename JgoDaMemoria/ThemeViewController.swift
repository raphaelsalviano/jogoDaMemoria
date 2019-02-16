//
//  ThemeViewController.swift
//  JgoDaMemoria
//
//  Created by posmobile on 16/02/19.
//  Copyright © 2019 posmobile. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {
    
    let themes: [String: String] = [
        "Esportes": "⚽️🏀🏈🏋🏼‍♀️🏄🏻‍♂️🏊🏼‍♂️🚵🏼‍♀️⛸🥋🥊🏹🏒🧘🏻‍♂️",
        "Animais": "🐶🦊🐻🐼🐨🐯🦁🐮🐷🐸🐤🐺🦋",
        "Carinhas": "👶🏼👧🏼🧒🏼👦🏼👩🏻🧑🏻👨🏻🧔🏻👵🏻🧓🏻👱🏾‍♀️👱🏿‍♂️👴🏽"
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let buttonTitle = (sender as? UIButton)?.currentTitle,
                let theme = themes[buttonTitle] {
                let gameViewController = segue.destination as? GameViewController
                gameViewController?.emojis = theme
            }
        }
        
    }

}
