//
//  ContentCellNoImage.swift
//  CloneFacebook
//
//  Created by TungLe on 02/05/2023.
//

import UIKit
import SDWebImage
class ContentCellNoImage: UITableViewCell {
    var imageReactView: UIView = UIView()
    public let screenSize: CGRect = UIScreen.main.bounds
    let arrContent = ["Like","Comment","Share"]
    let arrImage = ["Icon-Like","Icon-Comment","Icon-Share"]
    @IBOutlet weak var postAudienceImage: UIImageView!
    @IBOutlet weak var lblDatePost: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var imgUserAvatar: UIImageView!
    @IBOutlet weak var contentPostLabel: UILabel!
    @IBOutlet weak var clvBottomDetailContent: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var x: CGFloat!
    var y: CGFloat!

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        didTapImage()
        settingView()
        // Configure the view for the selected state
    }
    func settingView() {
        imgUserAvatar.layer.cornerRadius = imgUserAvatar.frame.width/2
        clvBottomDetailContent.dataSource = self
        clvBottomDetailContent.delegate = self
        clvBottomDetailContent.register(UINib(nibName: "ButtonCell", bundle: nil),forCellWithReuseIdentifier: "buttonCell")
    }
    func loadPost(post: PostModel) {
        self.lblUserName.text = post.userModel.userName
        self.lblDatePost.text = post.timeDisplay
        self.imgUserAvatar.sd_setImage(with: URL(string: post.userModel.userNameImage))
        self.contentPostLabel.text = post.content
        self.postAudienceImage.image = UIImage(named: post.postAudienceImage)
    }
    func didTapImage() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGesture:)))
        imgUserAvatar.isUserInteractionEnabled = true
        imgUserAvatar.addGestureRecognizer(tapGesture)
    }
    @objc func imageTapped(tapGesture: UITapGestureRecognizer)
    {
        print("tap")
    }
}
extension ContentCellNoImage: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! ButtonCell
        cell.settingView(strNameImage: arrImage[indexPath.row], strContent: arrContent[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    
}

extension ContentCellNoImage: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! ButtonCell
        cell.settingView(strNameImage: arrImage[indexPath.row], strContent: arrContent[indexPath.row])
        var width: CGFloat = (cell.imgButtonImage.frame.width)  + (cell.lblLabel.frame.width)
        var height: CGFloat = 25
        return CGSize(width: width, height: height)
    }
}

extension ContentCellNoImage: didTapLikeButtonDelegate {
    
    func didChangeGesture(sender: UILongPressGestureRecognizer, cell: ButtonCell) {
        //cell.addSubview(imageReactView)
//        imageReactView.isUserInteractionEnabled = true
//        let pressedLocation = sender.location(in: imageReactView)
//        print(pressedLocation)
//        let hitTestView = imageReactView.hitTest(pressedLocation, with: nil)
//        if hitTestView is UIImageView {
//            hitTestView?.alpha = 0
//            UIView.animate(withDuration: 0.5, delay: 0, animations: {
//                hitTestView?.transform = CGAffineTransform(translationX: 0, y: -30)
//            })
//        }
    }
    
    func didTapLikeButton(sender: UILongPressGestureRecognizer) {
        //Create ImageReactView
        let heightImage: CGFloat = CGFloat(40)
        let numberView = CGFloat(6)
        let padding: CGFloat = 8
        //Calculator width view
        let widthView = numberView * (heightImage+padding) + padding
        let heightView = heightImage+padding*2
        var location = sender.location(in: self)
        let locationX = location.x - 20
        let locationY = location.y - heightView
        if sender.state == .began {
            
            let frameView = CGRect(x: locationX, y: locationY, width: widthView, height: heightView)
            imageReactView = UIView(frame: frameView)
            imageReactView.backgroundColor = .white
            imageReactView.tag = 100
            imageReactView.layer.cornerRadius = heightView/2
            let myGesture = UILongPressGestureRecognizer(target: self, action: #selector(handle(sender:)))
            myGesture.minimumPressDuration = TimeInterval(1)
            imageReactView.isUserInteractionEnabled = true
            //Create ever view in ImageReactView
            let arrView = ["Icon-Like-Blue","Icon-Love","Icon-Haha","Icon-Wow","Icon-Sad","Icon-Angry"]
            let arrColor = [UIColor.blue,.red,.gray,.green,.orange,.purple]
            var listViewAdd = [UIView]()
            for item in arrView {
                let v = UIView()
                v.layer.cornerRadius = heightImage/2
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                imageView.image = UIImage(named: item)
                imageView.layer.cornerRadius = heightImage/2
                imageView.isUserInteractionEnabled = true
                v.isUserInteractionEnabled = true
                v.addSubview(imageView)
                listViewAdd.append(v)
            }
            
            //Create a stack view and add all view inside
            let stackView = UIStackView(arrangedSubviews: listViewAdd)
            stackView.distribution = .fillEqually
            
            //padding view in stackview
            stackView.spacing = padding
            stackView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            stackView.isLayoutMarginsRelativeArrangement = true
            
            //add stack view to ImageReactView
            imageReactView.addSubview(stackView)
            let frameReactView = CGRect(x: 0, y: 0, width: widthView, height: heightView)
            stackView.frame = frameReactView
            self.addSubview(imageReactView)
            x = locationX
            y = locationY
        }
        if sender.state == .ended {
            if let viewRemove = self.viewWithTag(100) {
                viewRemove.removeFromSuperview()
            }
        }
        if sender.state == .changed {
            imageReactView.isUserInteractionEnabled = true
            location = sender.location(in: self)
            let pressedLocation = CGPoint(x: location.x-(x), y: location.y-(y))
            print(pressedLocation)
            let hitTestView = imageReactView.hitTest(pressedLocation, with: nil)
            if hitTestView is UIImageView {
                
                UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut, animations: {
                    
                    let stackView = self.imageReactView.subviews.first
                    let allView  = stackView?.subviews
                    allView!.forEach({ (imageView) in
                        imageView.layer.removeAllAnimations()
                        imageView.transform = .identity
                    })
                    hitTestView?.transform = CGAffineTransform(translationX: 0, y: -20)
                   
                })
            }
        }
        
    }
    
    @objc func handle(sender: UILongPressGestureRecognizer) {
        print(sender.location(in: imageReactView))
        
    }
    
}
