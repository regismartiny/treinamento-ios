//
//  Player.swift
//  MusicPlayer
//
//  Created by InfraCWI on 13/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit

protocol PlayerDelegate {
    func doPlay()
    func doPause()
}

class Player : UIView {
    
    enum State {
        case PLAYING
        case PAUSED
    }
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var btnAction: UIButton!
    
    var delegate : PlayerDelegate?
    private var state = State.PAUSED
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed("Player", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.btnAction.layer.cornerRadius = self.btnAction.frame.width / 2
    }
    
    @IBAction func playPauseAction(_ sender: Any) {
        if (self.state == State.PAUSED) {
            self.doPlay()
        } else {
            self.doPause()
        }
    }
    
    func doPlay() {
        delegate?.doPlay()
        self.state = State.PLAYING
    }
    
    func doPause() {
        delegate?.doPause()
        self.state = State.PAUSED
    }
    
}
