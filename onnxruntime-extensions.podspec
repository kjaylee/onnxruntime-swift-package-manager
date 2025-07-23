Pod::Spec.new do |spec|
  spec.name         = "onnxruntime-extensions"
  spec.version      = "0.13.0"
  spec.summary      = "ONNX Runtime Extensions for iOS and macOS"
  spec.description  = <<-DESC
                      ONNX Runtime Extensions provides additional operators and functionality
                      for ONNX Runtime, extending its capabilities for specialized use cases.
                      DESC

  spec.homepage     = "https://github.com/kjaylee/onnxruntime-swift-package-manager"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Microsoft" => "onnxruntime@microsoft.com" }

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "11.0"

  spec.source       = { :git => "https://github.com/kjaylee/onnxruntime-swift-package-manager.git", :tag => "#{spec.version}" }

  # Extensions source files
  spec.source_files = [
    "extensions/*.{h,mm}",
    "extensions/include/*.h"
  ]
  
  spec.public_header_files = [
    "extensions/include/OnnxRuntimeExtensions.h",
    "extensions/include/OrtExt.h"
  ]

  spec.requires_arc = true
  spec.library = "c++"
  spec.pod_target_xcconfig = {
    "OTHER_CPLUSPLUSFLAGS" => "-std=c++17",
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
    "GCC_PREPROCESSOR_DEFINITIONS" => "ORT_SWIFT_PACKAGE_MANAGER_BUILD=1"
  }

  # Dependency on main ONNX Runtime pod
  spec.dependency "onnxruntime", "~> 1.20.0"

  # Binary dependency for ONNX Runtime Extensions C/C++ library
  spec.vendored_frameworks = []
  
  spec.prepare_command = <<-CMD
    echo "ONNX Runtime Extensions CocoaPods integration"
    echo "Note: This pod requires the ONNX Runtime Extensions C/C++ library to be available"
    echo "Please refer to the documentation for setup instructions"
  CMD
end