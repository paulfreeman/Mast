//
//  DKAssetGroupDetailVideoCell.swift
//  DKImagePickerController
//
//  Created by ZhangAo on 07/12/2016.
//  Copyright © 2016 ZhangAo. All rights reserved.
//

import UIKit

class DKAssetGroupDetailVideoCell: DKAssetGroupDetailImageCell {
    
    class override func cellReuseIdentifier() -> String {
        return "DKVideoAssetIdentifier"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(videoInfoView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height: CGFloat = 30
        self.videoInfoView.frame = CGRect(x: 0, y: self.contentView.bounds.height - height,
                                          width: self.contentView.bounds.width, height: height)
    }
    
    override weak var asset: DKAsset? {
        didSet {
            if let asset = asset {
                let videoDurationLabel = self.videoInfoView.viewWithTag(-1) as! UILabel
                let minutes: Int = Int(asset.duration!) / 60
                let seconds: Int = Int(round(asset.duration!)) % 60
                videoDurationLabel.text = String(format: "\(minutes):%02d", seconds)                
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if super.isSelected {
                self.videoInfoView.backgroundColor = Colours.tabSelected
            } else {
                self.videoInfoView.backgroundColor = UIColor(white: 0.0, alpha: 0.7)
            }
        }
    }
    
    fileprivate lazy var videoInfoView: UIView = {
        let videoInfoView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        
        let videoImageView = UIImageView(image: DKImageResource.videoCameraIcon())
        videoInfoView.addSubview(videoImageView)
        videoImageView.center = CGPoint(x: videoImageView.bounds.width / 2 + 7, y: videoInfoView.bounds.height / 2)
        videoImageView.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin]
        
        let videoDurationLabel = UILabel()
        videoDurationLabel.tag = -1
        videoDurationLabel.textAlignment = .right
        videoDurationLabel.font = UIFont.systemFont(ofSize: 12)
        videoDurationLabel.textColor = UIColor.white
        videoInfoView.addSubview(videoDurationLabel)
        videoDurationLabel.frame = CGRect(x: 0, y: 0, width: videoInfoView.bounds.width - 7, height: videoInfoView.bounds.height)
        videoDurationLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return videoInfoView
    }()
    
} /* DKAssetGroupDetailVideoCell */
