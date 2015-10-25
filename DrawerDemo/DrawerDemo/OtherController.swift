//
//  OtherController.swift
//  OtherTableView
//
//  Created by narcissu on 15/10/24.
//  Copyright © 2015年 narcissu. All rights reserved.
//  

//MARK: -  内容页

import UIKit

class OtherController: DSNavController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        self.navStyle = DSNavStyle.Back
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //注册cell
        registerCell()
        // Do any additional setup after loading the view.
    }
    
    private func registerCell(){
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.registerNib(UINib(nibName: "ContansTopView", bundle: nil), forCellReuseIdentifier: "ContansTopView")
        tableView.registerNib(UINib(nibName: "ContansCenterView", bundle: nil), forCellReuseIdentifier: "ContansCenterView")
    }
    
    //MARK: - tableViewDelegate
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("ContansTopView")
            return cell!
        }
        if indexPath.section == 0 && indexPath.row == 1{
            let cell = tableView.dequeueReusableCellWithIdentifier("ContansCenterView")
            return cell!
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0{
            return 147
        }
        if indexPath.section == 0 && indexPath.row == 1{
            return 700
        }
        return 0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
