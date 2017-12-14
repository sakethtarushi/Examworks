////
////  ExpandableTableView.swift
////  ExamWorks
////
////  Created by SAVEN TECHNOLOGIES002 on 12/14/17.
////  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
////
//
//import UIKit
//
//class ExpandableTableView: UITableView,CollapsibleTableViewHeaderDelegate {
//    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
//
//    }
//
//
//
////    @property (nonatomic, assign) BOOL allHeadersInitiallyCollapsed;
////    @property (nonatomic, assign) int initiallyExpandedSection;
////    @property (nonatomic, strong)CAShapeLayer *sepertorLine;
////
//    var allHeadersInitiallyCollapsed : Bool!
//    var initiallyExpandedSection : intmax_t!
//    var sepertorLine : CAShapeLayer!
//
//
//    required init(coder : NSCoder) {
//
//        super.init(coder: coder)!
//
//
//    }
//
//    func setup(){
//        initiallyExpandedSection = -1
//
//    }
//
//    func headerView() -> CollapsibleTableViewHeader {
//
//        let header = self.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
//
//        header.arrowLabel.text = ">"
//        // header.setCollapsed(true)
//        header.delegate = self
//        return header
//
//
//    }
//
//    func collapsedForSection(section : NSInteger) -> Bool {
//
//     //   let key = NSString
//
//
//    }
//
//
// //   - (BOOL)collapsedForSection:(NSInteger)section {
//
//    NSString *key = [NSString stringWithFormat:@"%ld", (long)section];
//
//    if (self.sectionStatusDic[key]) {
//    return ((NSNumber *)self.sectionStatusDic[key]).boolValue;
//    }
//
//    return (self.initiallyExpandedSection == section) ? NO : self.allHeadersInitiallyCollapsed;
//    }
//
//    -(BOOL) isSectionCollapsed:(NSInteger)section {
//    NSString *key = [NSString stringWithFormat:@"%ld", (long)section];
//
//    if (self.sectionStatusDic[key]) {
//    return ((NSNumber *)self.sectionStatusDic[key]).boolValue;
//    }
//
//    return NO;
//
//    }
//
//    - (NSInteger)totalNumberOfRows:(NSInteger)total inSection:(NSInteger)section; {
//
//    //    if ([self isSectionCollapsed:section]) {
//    //        NSLog(@"Collapse hua");
//    //    }
//    //    else {
//    //        NSLog(@"nai hua");
//    //    }
//    return ([self isSectionCollapsed:section]) ? total : 0;
//    }
//
//
//    /*
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
//    */
//
//}

