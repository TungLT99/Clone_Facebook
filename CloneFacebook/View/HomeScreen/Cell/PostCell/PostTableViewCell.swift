//
//  PostTableViewCell.swift
//  CloneFacebook
//
//  Created by TungLT on 7/12/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    var post : PostModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var heightPostTableView: NSLayoutConstraint!
    @IBOutlet weak var postTableView: IntrinsicTableView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        registerTableView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
       // loadHeight()
    }
    func registerTableView() {
        postTableView.dataSource = self
        postTableView.register(UINib(nibName: "PostUserTableViewCell", bundle: nil), forCellReuseIdentifier: "PostUserTableViewCell")
        postTableView.register(UINib(nibName: "PostContentTableViewCell", bundle: nil), forCellReuseIdentifier: "PostContentTableViewCell")
        postTableView.register(UINib(nibName: "InteractPostTableViewCell", bundle: nil), forCellReuseIdentifier: "InteractPostTableViewCell")
        postTableView.register(UINib(nibName: "PostImageTableViewCell", bundle: nil), forCellReuseIdentifier: "PostImageTableViewCell")
        postTableView.register(UINib(nibName: "InteractPostTableViewCell", bundle: nil), forCellReuseIdentifier: "InteractPostTableViewCell")
    }
    func loadHeight() {
        self.heightPostTableView.constant = self.postTableView.intrinsicContentSize.height
    }
}

extension PostTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let safeArrImage = post?.arrImage {
            if safeArrImage.count > 0 {
                return 5
            }
            else {
                return 4
            }
        }
        else {
            return 4
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostUserTableViewCell") as! PostUserTableViewCell
            if let safePost = post {
                cell.timePostString = safePost.time
                cell.postAudience = safePost.postAudienceImage
                cell.userNamePost = safePost.userModel.userName
                cell.userPostAvatar = safePost.userModel.userNameImage
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostContentTableViewCell") as! PostContentTableViewCell
            if let safePost = post {
                cell.contentPostText = safePost.content
            }
            return cell
        case 2:
            if let safeArrImage = post?.arrImage {
                if safeArrImage.count > 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageTableViewCell") as! PostImageTableViewCell
                    cell.urlImage = safeArrImage[0]
                    return cell
                }
                else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "InteractPostTableViewCell") as! InteractPostTableViewCell
                    return cell
                }
            } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "InteractPostTableViewCell") as! InteractPostTableViewCell
                    return cell
                }
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InteractPostTableViewCell") as! InteractPostTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
