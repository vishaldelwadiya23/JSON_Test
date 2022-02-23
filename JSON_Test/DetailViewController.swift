//
//  DetailViewController.swift
//  JSON_Test
//
//  Created by tmtech1 on 15/02/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var lblId: UILabel!
    @IBOutlet var lblName: UILabel!
    
    var strId = ""
    var strName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblId.text = strId
        lblName.text = strName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
