//
//  ConcentrationThemeChooserViewController.swift
//  StanfordiOSCourse
//
//  Created by Abylbek Khassenov on 15.03.2021.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController , UISplitViewControllerDelegate {

    let themes = [
        "Sports":"🥇🏊‍♂️🏆🎱⚽️🏈🏈⚾️🥎🎾🏐🏉" ,
        "Animals":"🦞🦂🐍🦎🦎🦕🐒🙊🐨🐻‍❄️🐽🐷" ,
        "Faces":"😗😚😫🥳😒😒🤮👿😈🤑💩😺😸"
    ]
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController{
            if cvc.theme == nil{
                return true
            }
        }
        return false
    }
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController{
            if let themeName = (sender as? UIButton)?.currentTitle , let theme = themes[themeName]{
                    cvc.theme = theme
                }
        } else if let cvc = lastSeguedToConcentrationVC{
            if let themeName = (sender as? UIButton)?.currentTitle , let theme = themes[themeName]{
                    cvc.theme = theme
                }
                navigationController?.pushViewController(cvc, animated: true)
        } else {
                performSegue(withIdentifier: "Choose Theme", sender: sender)
            }
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    private var lastSeguedToConcentrationVC: ConcentrationViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme"{
            if let themeName = (sender as? UIButton)?.currentTitle , let theme = themes[themeName]{
                if let cvc = segue.destination as? ConcentrationViewController{
                    cvc.theme = theme
                    lastSeguedToConcentrationVC = cvc
                }
            }
        }
    }
}
