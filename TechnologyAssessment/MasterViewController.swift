//
//  MasterViewController.swift
//  TechnologyAssessment
//
//  Created by MACBOOK on 19/02/2020.
//  Copyright © 2020 MACBOOK. All rights reserved.
//

import UIKit
import Moya
import SDWebImage

enum Period: Int {
  case first = 1
  case seven = 7
  case thirty = 30
}


class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [APIResults]()

    // MARK: - View State
    private var state: State = .loading {
      didSet {
        switch state {
        case .ready:
          tableView.isHidden = false
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .loading:
            self.tableView.isHidden = true
//          viewMessage.isHidden = false
//          lblMessage.text = "Getting articles ..."
//          imgMeessage.image = #imageLiteral(resourceName: "Loading")
        case .error:
            self.tableView.isHidden = true
            showError(msg: "Something went wrong.")
        }
      }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testUIBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(MasterViewController.showPeriods))
        self.navigationItem.rightBarButtonItem  = testUIBarButtonItem
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        getArticles(for: .seven)
    }

    func getArticles(for period: Period) {
        
        NetworkProvider.provider.request(.getArticles(period: period.rawValue )) { [weak self] result in
          guard let self = self else { return }

            print(result)
          switch result {
          case .success(let response):
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(MostPopularArticles.self, from: response.data)
                print(responseData)
                self.objects = responseData.results!
                self.state = .ready(responseData)
            } catch{
                print(error.localizedDescription)
              self.state = .error
            }
          case .failure:
            
            self.state = .error
          }
        }
    }
    func showError(msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reload", style: .default, handler: { [weak self] (action) in
            self?.getArticles(for: .seven)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func showPeriods(_ sender: Any) {
        print("Show Action Sheet")
        
        let alert = UIAlertController(title: "Select", message: "Please select a period", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "For a day", style: .default, handler: { [weak self] (action) in
            self?.getArticles(for: .first)
        }))
        alert.addAction(UIAlertAction(title: "For a week", style: .default, handler: { [weak self] (action) in
            self?.getArticles(for: .seven)
        }))
        alert.addAction(UIAlertAction(title: "For a month", style: .default, handler: { [weak self] (action) in
            self?.getArticles(for: .thirty)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.webURL = object.url
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        let object = objects[indexPath.row]
        cell.setData(object: object)
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

}


extension MasterViewController {
  enum State {
    case loading
    case ready(MostPopularArticles)
    case error
  }
}
