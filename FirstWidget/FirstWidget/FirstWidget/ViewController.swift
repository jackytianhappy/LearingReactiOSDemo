//
//  ViewController.swift
//  FirstWidget
//
//  Created by Jacky on 16/9/9.
//  Copyright © 2016年 jacky. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.redColor()
        
        self.view .addSubview(tableView); 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//MARK: tableview datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell.init(frame: CGRectMake(0, 0, 90, 90));
    }
//MARK: tableview delelgate
  
    //MARK: lazyl load
    
    var tableView:UITableView{
        let tmp = UITableView.init(frame:UIScreen.mainScreen().bounds)
        tmp.backgroundColor = UIColor.yellowColor()
        
        return tmp;
        
    }

    
}




