//
//  ViewController.swift
//  JWSCarthageSample
//
//  Created by Clint Jang on 22/12/2018.
//  Copyright © 2018 ClintJang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    var disposeBag =  DisposeBag()
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testButton.rx.tap
            .subscribe(onNext:{ [weak self] _ in
                guard let self = self else { return }
                self.testLabel?.text = ">>>> 클릭했군!!" })
            .disposed(by:disposeBag)
        
    }


}

