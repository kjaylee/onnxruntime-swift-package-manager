Pod::Spec.new do |spec|
  spec.name         = "onnxruntime"
  spec.version      = "1.20.0"
  spec.summary      = "ONNX Runtime for iOS and macOS"
  spec.description  = <<-DESC
                      ONNX Runtime is a cross-platform inference and training machine-learning accelerator.
                      This pod provides Swift and Objective-C bindings for ONNX Runtime.
                      DESC

  spec.homepage     = "https://github.com/kjaylee/onnxruntime-swift-package-manager"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Microsoft" => "onnxruntime@microsoft.com" }

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "11.0"

  spec.source       = { :git => "https://github.com/kjaylee/onnxruntime-swift-package-manager.git", :tag => "#{spec.version}" }

  # Main ONNX Runtime bindings
  spec.source_files = [
    "objectivec/*.{h,m,mm}",
    "objectivec/include/*.h"
  ]
  
  spec.public_header_files = [
    "objectivec/include/onnxruntime.h",
    "objectivec/include/ort_env.h",
    "objectivec/include/ort_session.h",
    "objectivec/include/ort_value.h",
    "objectivec/include/ort_enums.h",
    "objectivec/include/ort_custom_op_registration.h",
    "objectivec/include/ort_coreml_execution_provider.h",
    "objectivec/include/ort_xnnpack_execution_provider.h",
    "objectivec/cxx_api.h"
  ]

  spec.exclude_files = [
    "objectivec/ReadMe.md",
    "objectivec/format_objc.sh",
    "objectivec/test/**/*",
    "objectivec/docs/**/*",
    "objectivec/ort_checkpoint.mm",
    "objectivec/ort_checkpoint_internal.h",
    "objectivec/ort_training_session_internal.h",
    "objectivec/ort_training_session.mm",
    "objectivec/include/ort_checkpoint.h",
    "objectivec/include/ort_training_session.h",
    "objectivec/include/onnxruntime_training.h",
    "objectivec/cxx_utils.mm"
  ]

  spec.requires_arc = true
  spec.library = "c++"
  spec.pod_target_xcconfig = {
    "OTHER_CPLUSPLUSFLAGS" => "-std=c++17",
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
    "GCC_PREPROCESSOR_DEFINITIONS" => "SPM_BUILD=1"
  }

  # This pod requires the ONNX Runtime C/C++ library to be available
  # Users need to either:
  # 1. Use this as a subspec of a larger pod that includes the binary
  # 2. Manually add the ONNX Runtime binary framework to their project
  # 3. Use the Swift Package Manager version which handles the binary dependency automatically
  
  spec.prepare_command = <<-CMD
    echo "ONNX Runtime CocoaPods integration"
    echo "Note: This pod provides Objective-C bindings for ONNX Runtime."
    echo "You need to separately add the ONNX Runtime C/C++ library binary."
    echo "For automatic binary dependency management, consider using Swift Package Manager instead."
  CMD
end