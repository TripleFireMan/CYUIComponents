//
//  CYUploadImageView.swift
//  Pods
//
//  Created by cheng yan on 2023/3/24.
//

import UIKit
import SnapKit
import SDWebImage
import Dispatch
@objcMembers
public class CYUploadImageView: UIView {
    var itemSize : Int = 80
    class CYUploadImageModel : NSObject{
        var img : UIImage?
        var imgurl : NSURL?
        var isAddBtn : Bool
        init(img: UIImage?, imgurl: NSURL?, isAddBtn: Bool!) {
            self.img = img
            self.imgurl = imgurl
            self.isAddBtn = isAddBtn
        }
    }
    class CYUploadImageItemview : UICollectionViewCell{
        var removeBlock:(()->Void)?
        var imgview : UIImageView!
        var closeImg : UIImageView!
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = .white
            imgview = .init()
            imgview.backgroundColor = .lightText
            closeImg = .init()
            closeImg.backgroundColor = .red
            closeImg.isUserInteractionEnabled = true
            closeImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.close)))
            addSubview(imgview)
            addSubview(closeImg)
            imgview.snp.makeConstraints { make in
                make.edges.equalTo(UIEdgeInsets.init(top: 10, left: 0, bottom: 0, right: 10))
            }
            closeImg.snp.makeConstraints { make in
                make.width.height.equalTo(20)
                make.right.top.equalTo(0)
            }
            
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
        
        @objc func close(){
            self.removeBlock?()
        }
    }
    var data : NSMutableArray!
    var colletionview : UICollectionView!
    var placeHolderImg : UIImage?
    public var uploadedImgUrls : NSMutableArray!
    var maxCount : Int = 3
    var imagePickerVC : CYUploadImageVC =  CYUploadImageVC.init()
    public var uploadImgBlock : ((_ img: UIImage, _ finish:((_ url : NSString)->Void)?)->Void)?
    public var block : (()->Void)?
    public init(frame: CGRect, _ sz : Int? = 80, _ maxCount : Int? = 3) {
        super.init(frame: frame)
        self.itemSize = sz ?? 80
        self.maxCount = maxCount ?? 3
        data = .init()
        uploadedImgUrls = .init()
        let flowlayout = UICollectionViewFlowLayout.init()
        flowlayout.scrollDirection = .vertical
        flowlayout.itemSize = .init(width: itemSize, height: itemSize)
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.minimumLineSpacing = 0
        colletionview = .init(frame: .zero, collectionViewLayout: flowlayout)
        colletionview.backgroundColor = .clear
        colletionview.delegate = self
        colletionview.dataSource = self
        colletionview.register(CYUploadImageItemview.self, forCellWithReuseIdentifier: "CYUploadImageItemview")
        addSubview(colletionview)
        colletionview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        data.add(CYUploadImageModel(img: .cyImage("dd_pj_tp"), imgurl: nil, isAddBtn: true))
        colletionview.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func openCameraOrAlbum(){
        let vc = UIApplication.shared.keyWindow?.rootViewController
        let imgpicker = UIImagePickerController.init()
        
        imgpicker.delegate = self.imagePickerVC
        self.imagePickerVC.editImg = { [unowned self] (img) in
            self.uploadImgBlock?(img!, { [unowned self] (str)in
                self.uploadedImgUrls.insert(str, at: 0)
                self.data.insert(CYUploadImageModel(img: img, imgurl: .init(string: (str ) as String), isAddBtn: false), at: 0)
                if self.data.count == self.maxCount + 1{
                    self.data.removeLastObject()
                }
                self.colletionview.reloadData()
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
                    self.invalidateIntrinsicContentSize()
                }
            })
        }
        let alertCtl = UIAlertController.init(title: "请选择图片上传方式", message: nil, preferredStyle: .actionSheet)
        let act1 = UIAlertAction(title: "相册", style: .default) { handle in
            imgpicker.sourceType = .photoLibrary
            vc?.present(imgpicker, animated: true)
        }
        let act2 = UIAlertAction(title: "拍照", style: .default) { handle in
            imgpicker.sourceType = .camera
            vc?.present(imgpicker, animated: true)
        }
        let act3 = UIAlertAction(title: "取消", style: .cancel)
        alertCtl.addAction(act1)
        alertCtl.addAction(act2)
        alertCtl.addAction(act3)
        vc?.present(alertCtl, animated: true)
    }
    
    public override var intrinsicContentSize: CGSize{
        let size = self.colletionview.contentSize
        if size.equalTo(.zero){
            return .init(width: self.bounds.size.width, height: CGFloat(self.itemSize))
        }
        return size
    }
}

extension CYUploadImageView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colletionview.dequeueReusableCell(withReuseIdentifier: "CYUploadImageItemview", for: indexPath) as? CYUploadImageItemview
        let model = data[indexPath.row] as? CYUploadImageModel
        guard let model = model else{
            return UICollectionViewCell()
        }
        if model.isAddBtn {
            cell?.closeImg.isHidden = true
            cell?.imgview.image = model.img
        }else{
            cell?.closeImg.isHidden = false
            if let url = model.imgurl {
                cell?.imgview.sd_setImage(with: url as URL)
            }
            else if let img = model.img{
                cell?.imgview.image = img
            }
        }
        cell?.removeBlock = {[unowned self] in
            self.data.remove(model)
            self.uploadedImgUrls.remove(model.imgurl?.absoluteString as Any)
            let containsAdd : Bool = self.data.filter({ (obj) in
                if let o = obj as? CYUploadImageModel{
                    return o.isAddBtn
                }else{
                    return false
                }
            }).count != 0
            if self.data.count == self.maxCount - 1, containsAdd == false{
                self.data.add(CYUploadImageModel(img: .cyImage("dd_pj_tp"),imgurl: nil , isAddBtn: true))
            }
            self.colletionview.reloadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
                self.invalidateIntrinsicContentSize()
            }
            
        }
        return cell!
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = data[indexPath.row] as? CYUploadImageModel
        guard let model = model else{
            return
        }
        if model.isAddBtn == true, self.data.count < self.maxCount + 1{
            self.openCameraOrAlbum()
        }else{
            print("超过最大限制1111")
        }
    }
}

public class CYUploadImageVC : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    var editImg : ((_ img : UIImage?)->Void)?
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let img = info[.originalImage] as? UIImage {
            editImg?(img)
            picker.dismiss(animated: true)
        }
    }
    
}
