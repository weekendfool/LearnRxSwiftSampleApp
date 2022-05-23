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
    
    @IBOutlet weak var sampleLeftTextField: UITextField!
    @IBOutlet weak var sampleCenterTextField: UITextField!
    @IBOutlet weak var sampleRightTextField: UITextField!
    
    
    // MARK: - 変数
    let count: Int = 0
    
    private var viewModel: ViewModel!
    
    let disposeBag = DisposeBag()
    
    // MARK: - ライフサイクル
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel = ViewModel(
            resetButtonTap: sampleResetButton.rx.tap.asSignal(),
            countButtonTap: sampleCountButton.rx.tap.asSignal()
        )
        setup3()
        
       
        
//        let subject = Observable.combineLatest(
//            sampleLeftTextField.rx.text.orEmpty,
//            sampleCenterTextField.rx.text.orEmpty,
//            sampleRightTextField.rx.text.orEmpty
//        ) { value1, value2, value3 -> Int in
//            return (Int(value1) ?? 0) + (Int(value2) ?? 0) + (Int(value3) ?? 0)
//        }
//            .map { $0.description }
//            .bind(to: sampleLbel.rx.text)
//            .disposed(by: disposeBag)
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
    
    func setup3() {
//        let disposeBag = DisposeBag()
        
        let subject = Observable.combineLatest(
            sampleLeftTextField.rx.text.orEmpty,
            sampleCenterTextField.rx.text.orEmpty,
            sampleRightTextField.rx.text.orEmpty
        ) { value1, value2, value3 -> Int in
            return (Int(value1) ?? 0) + (Int(value2) ?? 0) + (Int(value3) ?? 0)
        }
            .map { $0.description }
            .bind(to: sampleLbel.rx.text)
            .disposed(by: disposeBag)
    }
    
}

