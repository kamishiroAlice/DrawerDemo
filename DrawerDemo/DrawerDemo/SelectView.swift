//
//  SelectView.swift
//  DrawerDemo
//
//  Created by narcissu on 15/10/24.
//  Copyright © 2015年 narcissu. All rights reserved.
//

import UIKit

protocol SelectViewDelegate:NSObjectProtocol{
    func showTypeView(types:[AnyObject]?)
}

class SelectView: UITableViewCell ,UICollectionViewDataSource,UICollectionViewDelegate{
    @IBOutlet weak var selectTitleLabel: UILabel!
    @IBOutlet weak var SelectCollectionView: UICollectionView!
    @IBOutlet weak var selectFlowLayout: UICollectionViewFlowLayout!
    
    weak var delegate: SelectViewDelegate?
    //存放type标题数组
    var typeArr:[AnyObject] = []
    //加号按钮的点击
    @IBAction func plusBtn(sender: AnyObject) {
        delegate?.showTypeView(typeArr.count == 0 ? nil : typeArr)
    }
    
    //MARK: - 注册nib
    override func awakeFromNib() {
        SelectCollectionView!.registerNib(UINib(nibName: "SelectColloctionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectColloctionViewCell")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.hidden = true
        settingLayout()
    }
    
    //MARK: - 设置样式
    private func settingLayout(){
        SelectCollectionView.dataSource  = self
        SelectCollectionView.delegate  = self
        SelectCollectionView.pagingEnabled = true
        SelectCollectionView.showsHorizontalScrollIndicator = true
        selectFlowLayout.itemSize = CGSizeMake(80, self.SelectCollectionView.bounds.size.height);
        selectFlowLayout.minimumInteritemSpacing = 20;
        selectFlowLayout.minimumLineSpacing = 0;
        selectFlowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SelectColloctionViewCell", forIndexPath: indexPath) as! SelectColloctionViewCell
        cell.typeLabel.text = typeArr.count == 0 ? "京东" : typeArr[indexPath.row] as! String
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typeArr.count == 0 ? 1 : typeArr.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("1")
    }
    

}
