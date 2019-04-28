//
//  ViewController.swift
//  CGATransform
//
//  Created by leeco on 2019/2/10.
//  Copyright © 2019 JiangYue. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    
    private var aTransformTypes:[TransformTypes] {
        return TransformTypes.allCases
    }
    
    private var aTransformDirection: [String] {
        return TransformTypes.allCases.map{$0.rawValue}
    }
    
    private let tableview: UITableView = {
        let view = UITableView()
        view.tableFooterView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CGAffineTransform"
        tableview.dataSource = self;
        tableview.delegate = self        
        view.addSubview(tableview)
        tableview.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aTransformTypes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(aTransformTypes[indexPath.row].direction)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aTransformDirection = aTransformTypes[indexPath.row]
        showAffineViewController(aTransformTypes: aTransformDirection)
    }
    
    func showAffineViewController(aTransformTypes: TransformTypes) {
        let affineViewController = CGAffineViewController(transformTypes: aTransformTypes)
        show(affineViewController, sender: nil)
    }
    
}

