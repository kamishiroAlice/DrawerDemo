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
    var typeArr:[AnyObject] = [] 
    @IBAction func plusBtn(sender: AnyObject) {
        delegate?.showTypeView(typeArr.count == 0 ? nil : typeArr)
    }
    
    override func awakeFromNib() {
        let nib = UINib(nibName: "SelectColloctionViewCell", bundle: nil)
        print("\(nib)")
        SelectCollectionView!.registerNib(UINib(nibName: "SelectColloctionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectColloctionViewCell")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.hidden = true
        SelectCollectionView.scrollEnabled = true
        SelectCollectionView.dataSource  = self
        SelectCollectionView.delegate  = self
        SelectCollectionView.pagingEnabled = true
        SelectCollectionView.showsHorizontalScrollIndicator = true
        selectFlowLayout.itemSize = CGSizeMake(80, self.SelectCollectionView.bounds.size.height);
        selectFlowLayout.minimumInteritemSpacing = 20;
        selectFlowLayout.minimumLineSpacing = 0;
        selectFlowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
    }
    
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
    
        
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
