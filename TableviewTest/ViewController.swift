//
//  ViewController.swift
//  TableviewTest
//
//  Created by Deepak on 9/20/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    let cellIdentifier = "myTableviewCell"
    //var array = [String]()
    var array = ["interview tableview cell height automatic adjusting we have to set both estimated row height and and row height property"]
    var topIndexpathTableview : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //interview important three steps to register and assign delegate self
        //Register custom table view cell: self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") Note that you use "UITableViewCell" and the identifier "cell" even if your custom cell has different class and id
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableview.delegate = self
        tableview.dataSource = self
        
        //interview tableview cell height automatic adjusting we have to set both estimated row height and and row height property Select the cell label and press the Pin button at the bottom of your storyboard. In this menu, select the four dotted lines towards the top of the menu. Next, change the leading and trailing values to 8 and click Add Constraints. The cell label is connected to the top and bottom margins by 0 points, so Auto Layout can now determine the height of the cell!
        tableview.estimatedRowHeight = 44
        tableview.rowHeight = UITableView.automaticDimension
        
        //interview tableview cell height 44 , 44px is also the default height for UIToolbar and UINavigationBar. (Both switch to 32px when autorotated to landscape orientation.)
        
        for addNum in 1...100{
            array.append("name\(addNum)")
        }
    }
    
}

extension ViewController:UITableViewDataSource , UITableViewDelegate{
    
    //MARK: Detect the current top cell in a UITableView after scrolling
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let indexpathTableview = tableview.indexPathsForVisibleRows?[0] {
            topIndexpathTableview = indexpathTableview
            // first array has Optional([0, 7]) 0 is section and 7 is row num 
            print(topIndexpathTableview)
            
        }
    }
    
    //MARK: tableviewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyTableViewCell
        
        cell.cellLabel.text = array[indexPath.row]
        //interview here create button hide it and add subview interview
        //MARK: Detect the current top cell in a UITableView cellforrow at indexpath method
        if let indexpathTableview = tableview.indexPathsForVisibleRows?[0] , indexpathTableview == indexPath {
            //here write code for unhiding the button

        }
        return cell
        
    }
    
    //MARK: tableviewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: interview UITableView tap to deselect cell if it is already selected
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow,
            indexPathForSelectedRow == indexPath {
            tableView.deselectRow(at: indexPath, animated: false)
            return nil
        }
        return indexPath
    }
    
    
    
    
    
}
