//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import CYUIComponents
import SnapKit
class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .green

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello2 World!"
        label.textColor = .red
        
        view.addSubview(label)
        self.view = view
        let v = CYUploadImageView.init(frame: .zero)
        v.block = {
//            let vc = UIApplication.shared.keyWindow?.rootViewController
            let imgpicker = UIImagePickerController.init()
            imgpicker.sourceType = .savedPhotosAlbum
//            imgpicker.delegate = self.imagePickerVC
            self.present(imgpicker, animated: true)
        }
        view.addSubview(v)
        v.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
        }
        
        
        
        
        
        
//        let btn = UIButton.init(type: .custom)
//        btn.setTitle("测123", for: .normal)
//        btn.setTitleColor(.black, for: .normal)
//        btn.backgroundColor = .red
//        btn.addTarget(self, action: #selector(self.test), for: .touchUpInside)
//        view.addSubview(btn)
//        btn.snp.makeConstraints { make in
//            make.left.equalTo(v.snp.right).offset(20)
//            make.height.equalTo(44)
//            make.centerY.equalTo(v)
//        }
        
        
        
        
    }
    
    @objc func test(){
        print("999999")
        PlaygroundPage.current.liveView = ViewController()
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
