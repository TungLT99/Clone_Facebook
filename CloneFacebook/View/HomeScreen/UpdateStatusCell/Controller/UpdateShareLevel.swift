//
//  UpdateShareLevel.swift
//  CloneFacebook
//
//  Created by TungLe on 02/05/2023.
//

import UIKit
protocol didTapButtonSavePostAudienceDelegate {
    func didTapButtonSavePostAudience(item: PostAudience)
}
class UpdateShareLevel: UIViewController {
    var arrData: [PostAudience]?
    var selectData: PostAudience?
    var isButtonSelected = false
    var delegate: didTapButtonSavePostAudienceDelegate?
    @IBOutlet weak var tbvPostAudience: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
    }
    func settingView() {
        tbvPostAudience.delegate = self
        tbvPostAudience.dataSource = self
        tbvPostAudience.register(UINib(nibName: "PostAudienceCell", bundle: nil), forCellReuseIdentifier: "postAudienceCell")
        arrData = PostAudience.getDataPost()
        //self.selectData = arrData![0]
    }


}

extension UpdateShareLevel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard arrData != nil else {return 0}
        return arrData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postAudienceCell", for: indexPath) as! PostAudienceCell
        if let safeArr = arrData {
            let item = safeArr[indexPath.row]
            if let safeSelect = selectData {
                if item.id == safeSelect.id {
                    cell.btnRadioButton.isSelected = true
                }
                else {
                    cell.btnRadioButton.isSelected = false
                }
            }
            cell.settingView(item: item)
        }
        return cell
    }
    
    
}

extension UpdateShareLevel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.dequeueReusableCell(withIdentifier: "postAudienceCell", for: indexPath) as! PostAudienceCell
        self.selectData = arrData![indexPath.row]
        tbvPostAudience.reloadData()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        _ = CGFloat(30)
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 35))
        let buttonSave = UIButton(frame: CGRect(x: 0, y: 0, width: footerView.frame.width, height: footerView.frame.height))
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.backgroundColor = .systemBlue
        buttonSave.addTarget(self, action: #selector(didTapButtonSave(sender:)), for: .touchUpInside)
        footerView.addSubview(buttonSave)
        return footerView
    }
    @objc func didTapButtonSave(sender: UIButton) {
        weak var vc = storyboard?.instantiateViewController(withIdentifier: "CreatePostScreen") as? CreatePost
        vc?.createPostViewModel.postAudience = self.selectData
        if delegate != nil {
            delegate?.didTapButtonSavePostAudience(item: self.selectData!)
        }
        navigationController?.popViewController(animated: true)
    }
}
