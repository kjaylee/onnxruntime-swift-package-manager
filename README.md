# Swift Package Manager for ONNX Runtime

A light-weight repository for providing [Swift Package Manager (SPM)](https://www.swift.org/package-manager/) and [CocoaPods](https://cocoapods.org/) support for [ONNXRuntime](https://github.com/kjaylee/onnxruntime). The ONNX Runtime native package is included as a binary dependency.

## Installation

### Swift Package Manager

SPM is the alternative to CocoaPods when desired platform to consume is mobile iOS.

Add the following dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/kjaylee/onnxruntime-swift-package-manager", from: "1.20.0")
]
```

### CocoaPods

Add the following to your `Podfile`:

```ruby
# For ONNX Runtime core functionality
pod 'onnxruntime', :git => 'https://github.com/kjaylee/onnxruntime-swift-package-manager.git', :tag => '1.20.0'

# For ONNX Runtime Extensions (optional)
pod 'onnxruntime-extensions', :git => 'https://github.com/kjaylee/onnxruntime-swift-package-manager.git', :tag => '0.13.0'
```

Then run:

```bash
pod install
```

**Important**: CocoaPods integration requires manual binary dependency management. See [CocoaPods Installation Guide](COCOAPODS_GUIDE.md) for detailed instructions.

## Usage

### Swift

```swift
import onnxruntime

// Your ONNX Runtime code here
```

### Objective-C

```objc
#import <onnxruntime/onnxruntime.h>

// Your ONNX Runtime code here
```

## Note

The `objectivec/` directory is copied from the [ORT repo](https://github.com/kjaylee/onnxruntime/tree/main/objectivec) and it's expected to match. It will be updated periodically/before release to merge new changes.

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
