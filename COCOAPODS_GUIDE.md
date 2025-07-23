# CocoaPods Installation Guide

This document provides detailed instructions for using ONNX Runtime with CocoaPods.

## Prerequisites

- iOS 13.0+ or macOS 11.0+
- Xcode 12.0+
- CocoaPods 1.10.0+

## Installation

### 1. Add to Podfile

Add the following to your `Podfile`:

```ruby
# For ONNX Runtime core functionality
pod 'onnxruntime', :git => 'https://github.com/kjaylee/onnxruntime-swift-package-manager.git', :tag => '1.20.0'

# For ONNX Runtime Extensions (optional)
pod 'onnxruntime-extensions', :git => 'https://github.com/kjaylee/onnxruntime-swift-package-manager.git', :tag => '0.13.0'
```

### 2. Install Dependencies

Run the following command in your project directory:

```bash
pod install
```

### 3. Binary Dependencies

**Important**: The CocoaPods integration provides only the Objective-C/Swift bindings. You need to separately add the ONNX Runtime C/C++ binary library to your project.

#### Option A: Manual Framework Integration

1. Download the ONNX Runtime framework for iOS/macOS from the [official releases](https://github.com/kjaylee/onnxruntime/releases)
2. Add the framework to your Xcode project
3. Ensure the framework is properly linked and embedded

#### Option B: Use Swift Package Manager (Recommended)

For automatic binary dependency management, consider using Swift Package Manager instead of CocoaPods:

```swift
dependencies: [
    .package(url: "https://github.com/kjaylee/onnxruntime-swift-package-manager", from: "1.20.0")
]
```

## Usage

### Swift

```swift
import onnxruntime

// Initialize ONNX Runtime environment
let env = try ORTEnv(loggingLevel: ORTLoggingLevel.warning)

// Create session
let session = try ORTSession(env: env, modelPath: "path/to/your/model.onnx")

// Run inference
// ... your inference code here
```

### Objective-C

```objc
#import <onnxruntime/onnxruntime.h>

// Initialize ONNX Runtime environment
NSError *error;
ORTEnv *env = [[ORTEnv alloc] initWithLoggingLevel:ORTLoggingLevelWarning error:&error];

// Create session
ORTSession *session = [[ORTSession alloc] initWithEnv:env
                                            modelPath:@"path/to/your/model.onnx"
                                        sessionOptions:nil
                                                error:&error];

// Run inference
// ... your inference code here
```

## Troubleshooting

### Common Issues

1. **Missing C API Headers**: If you encounter errors about missing `onnxruntime_c_api.h`, ensure you have properly added the ONNX Runtime binary framework to your project.

2. **Missing cxx_api.h**: If you encounter errors about missing `cxx_api.h`, make sure you're using the latest version of the podspec which includes this header file in the public headers.

3. **Linking Errors**: Make sure the ONNX Runtime framework is properly linked in your project's "Frameworks, Libraries, and Embedded Content" section.

4. **Architecture Mismatch**: Ensure the ONNX Runtime framework architecture matches your target device/simulator architecture.

### Getting Help

- Check the [ONNX Runtime documentation](https://onnxruntime.ai/docs/)
- Visit the [ONNX Runtime GitHub repository](https://github.com/kjaylee/onnxruntime)
- For Swift Package Manager (recommended), use the [SPM repository](https://github.com/kjaylee/onnxruntime-swift-package-manager)

## Limitations

- The CocoaPods integration requires manual binary dependency management
- For a more streamlined experience with automatic binary handling, use Swift Package Manager
- Training APIs are not included in the CocoaPods integration

## Migration from Swift Package Manager

If you're migrating from Swift Package Manager to CocoaPods:

1. Remove the SPM dependency from your `Package.swift`
2. Add the CocoaPods dependency to your `Podfile`
3. Manually add the ONNX Runtime binary framework
4. Update your import statements if necessary

## Migration to Swift Package Manager

If you want to migrate to Swift Package Manager for better binary dependency management:

1. Remove the CocoaPods dependency from your `Podfile`
2. Add the SPM dependency to your `Package.swift` or Xcode project
3. Remove manually added binary frameworks
4. Run `pod deintegrate` and `pod clean` to clean up CocoaPods artifacts