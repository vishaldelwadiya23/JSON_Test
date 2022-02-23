//
//  ViewController.swift
//  JSON_Test
//
//  Created by tmtech1 on 15/02/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var newsFeedArray = [NewsFeed]()
    var articleArray = [Article]()
    var sourceArray = [Source]()
    
    var titleName = [Any]()

    @IBOutlet var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData()
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
      print("This is a Git tutorial")
    }
    
    func getData() {
        
        let urlString = "https://newsapi.org/v2/everything?q=apple&from=2022-02-14&to=2022-02-14&sortBy=popularity&apiKey=ef9b9abba21f447991be8f6feeb4c331"

        //let url = URL(string: urlString)

        // Alamofier method
        AF.request(urlString).response { response in
            
            if let data = response.data {
                
                do {
                    let userResponse = try JSONDecoder().decode(NewsFeed.self, from: data)
                    print(userResponse)

                    self.articleArray = userResponse.articles!
                    
                    print(self.articleArray)
                    
                    //self.articleArray.append(contentsOf: userResponse)
                    
                    DispatchQueue.main.async {
                        self.tblView.reloadData()
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        

//        let urlString = "https://newsapi.org/v2/everything?q=apple&from=2022-02-14&to=2022-02-14&sortBy=popularity&apiKey=ef9b9abba21f447991be8f6feeb4c331"
//
//        let url = URL(string: urlString)
//
//        guard url != nil else {
//            return
//        }
        
//        let session = URLSession.shared
//
//        let dataTask = session.dataTask(with: url!) { (data, response, error) in
//
//            // check error
//            if error == nil && data != nil {
//
//                // Parse JSON
//                let decoder = JSONDecoder()
//
//                do {
//                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
//                    self.articleArray = newsFeed.articles!
//                    //print(self.articleArray)
//
//                    DispatchQueue.main.async {
//                        self.tblView.reloadData()
//                    }
//
//                } catch {
//                    print("Error in json parsing")
//                }
//            }
//        }
//        // Make API call
//        dataTask.resume()
    }
}
    
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.lblTitle.text = articleArray[indexPath.row].title
        cell.lblDescription.text = articleArray[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailVC: DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        print(articleArray[indexPath.row].source?.id ?? "")
        detailVC.strId = articleArray[indexPath.row].source!.id ?? ""
        detailVC.strName = articleArray[indexPath.row].source!.name ?? ""
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
