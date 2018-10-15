<p align="center">
  <img width="420" src="Resources/ArrowsLogo.png"/>
</p>

[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/badge/pod-v1.0.0-blue.svg)](https://github.com/antoniocasero/Panels)
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)

[![Twitter](https://img.shields.io/badge/twitter-@acaserop-blue.svg?style=flat)](http://twitter.com/acaserop)

Arrows is an animated custom view to represent three different arrow states: `up/down/middle`

<p align="center">
    <img src="Resources/arrowExample2.gif" width="480" height="240" alt="Arrowa demo1">
</p>


## Usage

Just need to set `ArrowView` in the class you want to be painted with the arrow indicator in IB.
Or directly instantiate the class `ArrowView` in code. It is based on UIBezierPath, so the dimensions are defined by the view frame, don't worry about the resolution it will look perfect.

In your ViewController, you can change the state of the arrow using `update` function

```swift
class YourViewController: UIViewController {
    @IBOutlet weak var arrow: ArrowPanel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // .up, .down, .middle
        arrow.update(to: .middle, animated: true)
    }
}
```

You can find more options in `ArrowView`
```swift
    ///  Get the current position
    fileprivate(set) var arrowPosition: Position = .middle

    /// Animation duration between arrow states (accessible from IB)
    @IBInspectable open var arrowAnimationDuration: Double = 0.30

    /// Set arrow color (accessible from IB)
    @IBInspectable open var arrowColor: UIColor = .black
```

The perfect companion for `Arrows` is [Panels](https://github.com/antoniocasero/Panels), check it out! ✨

<p align="center">
    <img src="Resources/ArrowExample.gif" width="237" height="471" alt="Arrowa demo1">
</p>


## Installation

### CocoaPods
Add the line `pod "Arrows"` to your `Podfile`

### Carthage
Add the line `github "antoniocasero/Arrows"` to your `Cartfile`

## Author
Project created by Antonio Casero ([@acaserop](https://twitter.com/acaserop) on Twitter).

### Credits

[UI Sketch](https://www.sketchappsources.com/free-source/3599-vpn-app-design-sketch-freebie-resource.html)
