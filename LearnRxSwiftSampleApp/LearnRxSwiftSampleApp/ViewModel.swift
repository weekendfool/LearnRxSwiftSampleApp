//
//  ViewModel.swift
//  LearnRxSwiftSampleApp
//
//  Created by Oh!ara on 2022/05/23.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    
    private let disposeBag = DisposeBag()
    
    init(resetButtonTap: Signal<Void>, countButtonTap: Signal<Void>) {
        
        resetButtonTap.emit { [weak self] in
            guard let resetButton = self else { return }
            resetButton.resetButtonTapAction()
        } onCompleted: {
            print("onCompleted resetButton")
        }
        .disposed(by: disposeBag)
        
        countButtonTap.emit { [weak self] in
            guard let countButton = self else { return }
            countButton.countButtonTapAction()
        } onCompleted: {
            print("onCompleted countButton")
       
        }


    }
    
    
    
    private func resetButtonTapAction() {
        print("resetButtonTap")
    }
    
    private func countButtonTapAction() {
        print("countButtonTap")
    }
}
