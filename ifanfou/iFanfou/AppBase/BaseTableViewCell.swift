//
//  BaseTableViewCell.swift
//  GTMobile
//
//  Created by tung on 16/1/8.
//  Copyright © 2016年 GT. All rights reserved.
//

import UIKit

class BaseTableViewCell: MGSwipeTableCell {
    
    var gDict:AnyObject!{
        didSet {
            initCellView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //TODO 初始化cell 内容
    func initCellView(){
        autoBindData(self)
    }
    
    //MARK: 自动数据绑定（对数据结构要求较高）
    func autoBindData(view:UIView){
        for subview in view.subviews {
            if let id = subview.id{
                if let data = gDict[id]{
                    if subview.isKindOfClass(UILabel){
                       (subview as?UILabel)?.text = data as?String
                    }else if subview.isKindOfClass(UIImageView){
                       (subview as?UIImageView)?.kf_setImageWithURL(NSURL(string: (data as? String)!)!, placeholderImage: UIImage(named: "placeholder"))
                    }
                }
            }
            if !subview.subviews.isEmpty{
               autoBindData(subview)
            }
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    class func height(dict:AnyObject) -> CGFloat{
        return 0;
    }

}
