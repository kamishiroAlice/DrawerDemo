//
//  OnewController.swift
//  DrawerDemo
//
//  Created by narcissu on 15/10/22.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit
//代理协议
protocol OnewControllerDelegate: NSObjectProtocol {
    func changePosition()
}

class OnewController: DSNavController,UITableViewDelegate,UITableViewDataSource,ZWAdViewDelagate,SelectViewDelegate,TypeViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    //MARK: - 广告View
    private lazy var adsView:ZWAdView = {
        let adsView = ZWAdView(frame: CGRectMake(0, 0, self.tableView.bounds.width, 200))
        /**广告链接*/
        var imageArray:NSMutableArray = NSMutableArray(array: ["1.png","2.png","3.png","4.png"])
        adsView.adDataArray = imageArray
        adsView.pageControlPosition = ZWPageControlPosition.BottomCenter;/**设置圆点的位置*/
        adsView.hidePageControl = false;/**设置圆点是否隐藏*/
        adsView.adAutoplay = true;/**自动播放是否开启*/
        adsView.adPeriodTime = 2.5;/**时间间隔*/
        adsView.placeImageSource="banner1"
        adsView.delegate = self
        return adsView
    }()
    //MARK: - 分类View
    private lazy var selectView:SelectView = {
        let selectView:SelectView =  UINib(nibName: "SelectView", bundle: nil).instantiateWithOwner(self, options: nil).last as! SelectView
            selectView.delegate = self
        return selectView
        }()
    
    @IBAction func settingBtnClick(sender: AnyObject) {
        delegate?.changePosition()
    }
    
    weak var delegate: OnewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.showsVerticalScrollIndicator = false
        setupUI()
        registCell()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        self.tableView.tableHeaderView = adsView;
        adsView.loadAdDataThenStart()
    }
    
    private func registCell(){
        tableView.registerNib(UINib(nibName: "ContansCell", bundle: nil), forCellReuseIdentifier: "ContansCell")
    }
    
    //MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("ContansCell")
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        return UITableViewCell()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 130
        }
        return 500
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return selectView
        }
        return nil
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let otherVC = UIStoryboard(name: "Other", bundle: nil).instantiateInitialViewController()
        self.navigationController?.pushViewController(otherVC!, animated: true)
        
    }
    //MARK: - 广告的点击
    func adView(adView: ZWAdView!, didDeselectAdAtNum num: Int) {
        
    }
    
    //MARK: - SelectViewDelegate 分类View的显示
    func showTypeView(types: [AnyObject]?) {
        let typeView:TypeView = UINib(nibName: "TypeView", bundle: nil).instantiateWithOwner(self, options: nil).last as! TypeView
        self.view.addSubview(typeView)
        typeView.delegate = self
        typeView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(244)
            make.left.equalTo(self.view.snp_left)
            make.right.equalTo(self.view.snp_right)
            make.height.equalTo(300)
        }
        typeView.layoutIfNeeded()
        
        if let _ = types{
            typeView.btnTitleArr = nil
            typeView.btnTitleArr = types!
            print("\(typeView.optionalBtn1)")
            typeView.reloadSelectefTypes()
        }
        
    }
    
    //MARK: - TypeViewDelegate
    func reloadSelectView(titleArr: [AnyObject]) {
        let cell =  selectView
        cell.typeArr = titleArr
        cell.SelectCollectionView.reloadData()
        cell.layoutIfNeeded()
    }

}
