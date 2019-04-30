//
//  ViewController.swift
//  NSCollectionViewDemo
//
//  Created by Alexcai on 2017/8/16.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa



let HeaderID = "HEADer"

class ViewController: NSViewController {

    
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.先给NSCollectionView 注册item
        
//        let numbersNib = NSNib(nibNamed: "NumberItem", bundle: nil)
//        collectionView.register(numbersNib!, forItemWithIdentifier: "demo")
        
        // NSCollectionViewItem : 不是view ,它继承自NSViewController ,所以不能使用NIB方式
        
        collectionView.register(NumberItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "demo"))
        
       // HeaderView或者FooterView都需要注册(也就是告知CollectionView使用)
        let headerNib = NSNib(nibNamed: "HeaderView", bundle: nil)

        collectionView.register(headerNib!, forSupplementaryViewOfKind: NSCollectionView.elementKindSectionHeader, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: HeaderID))
        
//        collectionView.register(headerNib!, forSupplementaryViewOfKind: NSCollectionView.SupplementaryElementKind
//            , withIdentifier: NSUserInterfaceItemIdentifier(rawValue: HeaderID))
//        collectionView.register(headerNib!, forSupplementaryViewOfKind: NSCollectionElementKindSectionHeader, withIdentifier: HeaderID)
        
        (collectionView.collectionViewLayout as! NSCollectionViewFlowLayout).sectionHeadersPinToVisibleBounds = true

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


// MARK: - NSCollectionView 数据源方法
extension ViewController : NSCollectionViewDataSource{
    

    
    // 返回组的数量
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 4
    }
    
    // 返回每组中的item数量
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    // 返回每个item
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        // 获取重用的item,如果没有,则根据注册的item,系统会自动创建一个
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "demo"), for: indexPath) as! NumberItem
        
        let picIndex = indexPath.item > 10 ? indexPath.item - 10 : indexPath.item
        
        item.picture.image = NSImage(named: "templet"+"\(picIndex)")
        
        item.titleLabel.stringValue = "\(indexPath.item)"
        
        // 返回item
        return item
    }
    // 返回每组Header或者Footer的视图
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> NSView {
        
        let headerView = collectionView.makeSupplementaryView(ofKind:NSCollectionView.elementKindSectionHeader, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: HeaderID), for: indexPath) as! HeaderView
        
        
        headerView.nameLabel.stringValue = "第\(indexPath.section)组"
        
        return headerView
        
        
    }
}

extension ViewController : NSCollectionViewDelegate {
    // 选中item调用这个方法
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print("选中item \(indexPaths)")
        
    }
    // 取消选中item时,调用代理的这个方法
    func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
         print("取消选中item \(indexPaths)")
    }
}



