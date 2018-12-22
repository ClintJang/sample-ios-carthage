# Sample iOS Carthage
단순히 Carthage 를 적용해본 샘플입니다. 미디엄에 글을 쓰고 예제 소스 링크를 위해 만들었습니다.

# [Cartage(카르타고) 사용 설명 링크](https://medium.com/@jang.wangsu/ios-swift-%EC%B9%B4%EB%A5%B4%ED%83%80%EA%B3%A0-carthage-%EB%9E%80-%EC%82%AC%EC%9A%A9%EB%B2%95%EC%9D%80-%EC%98%88%EC%A0%9C-%EB%94%B0%EB%9D%BC%ED%95%98%EA%B8%B0%EA%B9%8C%EC%A7%80-127e71fdd253)
> 미디엄에 카르타고 설정 방법을 설명한 링크를 작성해 두었습니다. 

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
> Carthage Update 명령를 통해 업데이트 합니다.

```
$ carthage update

or 

// Tip : iOS 폴더만 생성하기
$ carthage update --platform iOS
```

그리고 프로젝트를 실행해서 
`Link Binary With Libraries`, `Linked Frameworks and Libraries` 에서 생성된 Framework 중 사용할 Framework를 추가해 줍니다.


마지막으로 Run Script 를 추가해서 
Framework 를 가져올 수 있도록 하여줍니다.

1. Run Script 에 추가 : `/usr/local/bin/carthage copy-frameworks`
2. input files 에 추가 : `$(SRCROOT)/Carthage/Build/iOS/라이브러리명.framework`