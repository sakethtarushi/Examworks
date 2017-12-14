//
//  CollapsibleTableViewHeader.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 5/30/16.
//  Copyright © 2016 Yong Su. All rights reserved.
//

import UIKit
public struct Item {
    var name: String
    var detail: String
    
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

public var sectionsData: [Section] = [
    Section(name: "Mac", items: [
        Item(name: "MacBook", detail: "Apple's ultraportable laptop, trading portability for speed and connectivity."),
        Item(name: "MacBook Air", detail: "While the screen could be sharper, the updated 11-inch MacBook Air is a very light ultraportable that offers great performance and battery life for the price."),
        Item(name: "MacBook Pro", detail: "Retina Display The brightest, most colorful Mac notebook display ever. The display in the MacBook Pro is the best ever in a Mac notebook."),
        Item(name: "iMac", detail: "iMac combines enhanced performance with our best ever Retina display for the ultimate desktop experience in two sizes."),
        Item(name: "Mac Pro", detail: "Mac Pro is equipped with pro-level graphics, storage, expansion, processing power, and memory. It's built for creativity on an epic scale."),
        Item(name: "Mac mini", detail: "Mac mini is an affordable powerhouse that packs the entire Mac experience into a 7.7-inch-square frame."),
        Item(name: "OS X El Capitan", detail: "The twelfth major release of OS X (now named macOS)."),
        Item(name: "Accessories", detail: "")
        ]),
    Section(name: "iPad", items: [
        Item(name: "iPad Pro", detail: "iPad Pro delivers epic power, in 12.9-inch and a new 10.5-inch size."),
        Item(name: "iPad Air 2", detail: "The second-generation iPad Air tablet computer designed, developed, and marketed by Apple Inc."),
        Item(name: "iPad mini 4", detail: "iPad mini 4 puts uncompromising performance and potential in your hand."),
        Item(name: "Accessories", detail: "")
        ]),
    Section(name: "iPhone", items: [
        Item(name: "iPhone 6s", detail: "The iPhone 6S has a similar design to the 6 but updated hardware, including a strengthened chassis and upgraded system-on-chip, a 12-megapixel camera, improved fingerprint recognition sensor, and LTE Advanced support."),
        Item(name: "iPhone 6", detail: "The iPhone 6 and iPhone 6 Plus are smartphones designed and marketed by Apple Inc."),
        Item(name: "iPhone SE", detail: "The iPhone SE was received positively by critics, who noted its familiar form factor and design, improved hardware over previous 4-inch iPhone models, as well as its overall performance and battery life."),
        Item(name: "Accessories", detail: "")
        ])
]

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}

class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    let titleLabel = UILabel()
    let arrowLabel = UILabel()
    var label_caseno : UILabel!
    var label_claimno : UILabel!
    var label_Examinee : UILabel!
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Content View
        
        //        let view_header = UIView()
        contentView.frame = CGRect(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
        contentView.backgroundColor = UIColor.init(red: 242/255, green: 246/255, blue: 250/255, alpha: 1.0)
        
                 label_caseno = UILabel(frame: CGRect(x:3,y:0,width:contentView.frame.size.width/3-3,height:50))
                label_caseno.font = UIFont(name: "Roboto-Regular", size: 14.0)
                label_caseno.textAlignment = NSTextAlignment.left
                label_caseno.textColor = UIColor.black
                label_caseno.text = "32164347"
                label_caseno.backgroundColor = UIColor.clear
                contentView.addSubview(label_caseno)
        
                 label_claimno = UILabel(frame: CGRect(x:label_caseno.frame.maxX,y:0,width:contentView.frame.size.width/3-3,height:50))
                label_claimno.font = UIFont(name: "Roboto-Regular", size: 14.0)
                label_claimno.textAlignment = NSTextAlignment.center
                label_claimno.textColor = UIColor.black
                label_claimno.text = "#112"
                label_claimno.backgroundColor = UIColor.clear
                contentView.addSubview(label_claimno)
        
        
                 label_Examinee = UILabel(frame: CGRect(x:label_claimno.frame.maxX,y:0,width:contentView.frame.size.width/3-3,height:50))
                label_Examinee.font = UIFont(name: "Roboto-Regular", size: 14.0)
                label_Examinee.textAlignment = NSTextAlignment.right
                label_Examinee.textColor = UIColor.black
                label_Examinee.text = "Maria Leon"
                label_Examinee.backgroundColor = UIColor.clear
                contentView.addSubview(label_Examinee)
        
        // Arrow label
        contentView.addSubview(arrowLabel)
        arrowLabel.textColor = UIColor.white
        
       
        // Call tapHeader when tapping on this header
        //
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHeader)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // Trigger toggle section when tapping on the header
    //
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        //
        // Animate the arrow rotation (see Extensions.swf)
        //
        arrowLabel.rotate(collapsed ? 0.0 : .pi / 2)
    }
    
}
