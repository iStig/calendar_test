//
//  CLPopupController.swift
//  CLDemo
//
//  Created by JmoVxia on 2019/12/28.
//  Copyright © 2019 JmoVxia. All rights reserved.
//

import UIKit

class CLPopupModel: NSObject {
    var title: String?
    var callback: (() -> Void)?
}

class CLPopupController: CLController {
    lazy var arrayDS: [CLPopupModel] = {
        let arrayDS = [CLPopupModel]()
        return arrayDS
    }()

    lazy var tableview: UITableView = {
        let tableview = UITableView()
        tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalToSuperview()
            }
        }
    }
}

extension CLPopupController {
    func initData() {
        do {
            let model = CLPopupModel()
            model.title = "日历弹窗"
            model.callback = { [weak self] in
                self?.showCalendar()
            }
            arrayDS.append(model)
        }
    }
}

extension CLPopupController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayDS.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = arrayDS[indexPath.row].title
        return cell
    }
}

extension CLPopupController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = arrayDS[indexPath.row]
        model.callback?()
    }
}

extension CLPopupController {
    func showCalendar() {
        CLPopoverManager.showCalendar()
    }
}
