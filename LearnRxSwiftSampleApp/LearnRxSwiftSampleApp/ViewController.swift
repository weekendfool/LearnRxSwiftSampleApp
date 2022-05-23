//
//  ViewController.swift
//  LearnRxSwiftSampleApp
//
//  Created by Oh!ara on 2022/05/23.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var sampleLbel: UILabel!
    @IBOutlet weak var sampleCountButton: UIButton!
    @IBOutlet weak var sampleResetButton: UIButton!
    
    // MARK: - 変数
    let count: Int = 0
    
    private var viewModel: ViewModel!
    
    // MARK: - ライフサイクル
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel = ViewModel(
            resetButtonTap: sampleResetButton.rx.tap.asSignal(),
            countButtonTap: sampleCountButton.rx.tap.asSignal()
        )
//        setup2()
    }

    // MARK: - 関数
    
    // 普通に経路に出来事を流す
    func setup() {
        let disposeBag = DisposeBag()
        
       let subject = PublishSubject<String>()
        
        subject.subscribe { event in
            print("count: \(event)")
        } onError: { error in
            print(error)
        } onCompleted: {
            print("onCompleted")
        }

        subject.onNext("a")
        subject.onNext("b")
        subject.onCompleted()
        
    }
    
    func setup2() {
        let disposeBag = DisposeBag()
        
       let subject = PublishSubject<Int>()
        
        subject.filter { $0 > 5}
            
        .subscribe { event in
            print("event:\(event)")
        }
       

        subject.onNext(3)
        subject.onNext(4)
        subject.onNext(5)
        subject.onNext(6)
        subject.onNext(11)
        subject.onNext(111)
        subject.onCompleted()
    }
}

