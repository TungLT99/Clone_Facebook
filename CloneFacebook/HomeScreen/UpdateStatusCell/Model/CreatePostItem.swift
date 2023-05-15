//
//  CreateStatusItem.swift
//  CloneFacebook
//
//  Created by TungLe on 02/05/2023.
//

import Foundation
class CreatePostItem {
    var strNameImage: String = ""
    var strTitle: String = ""
    var strFunction: String = ""
    init(strNameImage: String, strTitle:String, strFunction:String) {
        self.strTitle = strTitle
        self.strNameImage = strNameImage
        self.strFunction = strFunction
    }
    func newData() -> [CreatePostItem] {
        let item1 = CreatePostItem(strNameImage: "Icon-Public", strTitle: "Public", strFunction: StringConfig.FunctionNameCreatepost.shareName)
        let item2 = CreatePostItem(strNameImage: "Icon-Add", strTitle: "Album", strFunction: StringConfig.FunctionNameCreatepost.albumName)
        let item3 = CreatePostItem(strNameImage: "Icon-Instagram", strTitle: "Off", strFunction: StringConfig.FunctionNameCreatepost.instagram)
        var arr = [CreatePostItem]()
        arr.append(item1)
        arr.append(item2)
        arr.append(item3)
        return arr
    }
}
