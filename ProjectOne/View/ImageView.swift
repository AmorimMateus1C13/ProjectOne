//
//  ImageView.swift
//  ProjectOne
//
//  Created by Mateus Amorim on 01/09/22.
//

import Foundation
import UIKit

class ImageView: UIViewController {
    
    var selectImage: String?
    
    
    lazy var pictures: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        if let chargeImage = selectImage{
            image.image = UIImage(named: chargeImage)
        }
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = selectImage
        navigationItem.largeTitleDisplayMode = .never
        setupConfiguration()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
}

extension ImageView: ViewConfiguration {
    func viewHierarchy() {
        view.addSubview(pictures)
    }
    
    func setupConstrants() {
        pictures.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
    }
}
