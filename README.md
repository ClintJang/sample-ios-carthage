# iOS Carthage Sample
iOS 라이브러리 관리도구인 Carthage 를 적용해본 샘플입니다. <br />
미디엄에 글을 쓰고 예제 소스 링크를 위해 만들었습니다.

# [Cartage(카르타고) 사용 설명 링크](https://medium.com/@jang.wangsu/ios-swift-%EC%B9%B4%EB%A5%B4%ED%83%80%EA%B3%A0-carthage-%EB%9E%80-%EC%82%AC%EC%9A%A9%EB%B2%95%EC%9D%80-%EC%98%88%EC%A0%9C-%EB%94%B0%EB%9D%BC%ED%95%98%EA%B8%B0%EA%B9%8C%EC%A7%80-127e71fdd253)
> 미디엄에 카르타고 설정 방법을 설명한 링크를 작성해 두었습니다.<br />
자세한 설명은 링크를 참고해주세요.
- [https://medium.com/@jang.wangsu/ios-swift-카르타고-Carthage-란-사용법은-예제-따라하기까지-127e71fdd253](https://medium.com/@jang.wangsu/ios-swift-카르타고-Carthage-란-사용법은-예제-따라하기까지-127e71fdd253)

# 실행시 참고 사항
## Brew 
> macOS 용 패키지 관리자인 Brew 가 설치 되어있어야 합니다.

```
$ brew update
// 미설치시
$ brew install carthage
// 설치가 된 경우
$ brew upgrade carthage
```

## Carfile
> Carfile 을 작성합니다.

- RxSwift 만 라이브러리로 추가했습니다.

```
github "ReactiveX/RxSwift"
```
- [파일 링크](https://github.com/ClintJang/sample-ios-carthage/blob/master/Cartfile) 

## 라이브러리 설치
> Carthage Update 명령을 통해 업데이트 합니다.

```
$ carthage update

or 

// Tip : iOS 폴더만 생성하기
$ carthage update --platform iOS
```

- Framework 파일이 생겼습니다.

<img width="400" src="/Image/carthage_create_framework01.png"></img>


그리고 프로젝트를 실행해서 
`Link Binary With Libraries`, `Linked Frameworks and Libraries` 에서 생성된 Framework 중 사용할 Framework를 추가해 줍니다.

- Link Binary With Libraries

<img width="400" src="/Image/carthage_add_framework_01.png"></img>

- or Linked Frameworks and Libraries

<img width="400" src="/Image/carthage_add_framework_01.png"></img>


마지막으로 Run Script 를 추가해서 
Framework 를 가져올 수 있도록 하여줍니다.

<img width="400" src="/Image/carthage_runscript_01.png"></img>


1. Run Script 에 추가 : `/usr/local/bin/carthage copy-frameworks`

<img width="400" src="/Image/carthage_runscript_02.png"></img>

2. input files 에 추가 : `$(SRCROOT)/Carthage/Build/iOS/라이브러리명.framework`

<img width="400" src="/Image/carthage_runscript_03.png"></img>

## 실행
- [ViewController.swift](https://github.com/ClintJang/sample-ios-carthage/blob/master/JWSCarthageSample/ViewController.swift) 에 코드를 추가하고 빌드/실행

```
import UIKit
import RxSwift 	// 추가한 라이브러리
import RxCocoa	// 추가한 라이브러리

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
```

** 정상동작 ** 