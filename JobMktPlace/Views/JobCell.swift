//
//  JobCell.swift
//  JobMktPlace
//
//  Created by Alex Paul on 2/2/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class JobCell: UICollectionViewCell {
    
    // TODO: add a title and image
    lazy var jobTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var jobImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage.init(named: "placeholder-image")
        return iv
    }()
    
    lazy var jobCreator: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 10.0
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupJobTitle()
        setupJobImage()
        setupJobCreator()
    }
    
    private func setupJobTitle() {
        let padding: CGFloat = 16
        addSubview(jobTitle)
        jobTitle.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(padding)
            make.leading.equalTo(snp.leading).offset(padding)
            make.trailing.equalTo(snp.trailing).offset(-padding)
        }
    }
    
    private func setupJobImage() {
        let padding: CGFloat = 16
        addSubview(jobImage)
        jobImage.snp.makeConstraints { (make) in
            make.top.equalTo(jobTitle.snp.bottom).offset(padding)
            make.leading.equalTo(snp.leading).offset(padding)
            make.trailing.equalTo(snp.trailing).offset(-padding)
            make.bottom.equalTo(snp.bottom).offset(-padding * 2)
        }
    }
    
    private func setupJobCreator() {
        let padding: CGFloat = 16
        addSubview(jobCreator)
        jobCreator.snp.makeConstraints { (make) in
            make.leading.equalTo(snp.leading).offset(padding)
            make.trailing.equalTo(snp.trailing).offset(-padding)
            make.bottom.equalTo(snp.bottom).offset(-padding)
        }
    }
    
    public func configureCell(job: Job) {
        jobTitle.text = job.title
        jobCreator.text = "@\(job.creator)"
        if let imageURL = job.imageURL {
            jobImage.kf.indicatorType = .activity
            jobImage.kf.setImage(with: URL(string:imageURL), placeholder: UIImage.init(named: "placeholder-image"), options: nil, progressBlock: nil) { (image, error, cacheType, url) in
                
            }
        }
    }
}


