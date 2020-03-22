
Pod::Spec.new do |s|
  s.name         = "KTDIconFont"
  s.version      = "0.0.2"
  s.summary      = "A library for integrating icon fonts into iOS apps."
  s.homepage     = "https://github.com/kydonnelly/KTDIconFont"

  s.license      = {
    :type => 'Mozilla Public License 2.0',
  }

  s.author       = { "Kyle Donnelly" => "kydonnelly@gmail.com" }
  s.source       = { :git => "https://github.com/kydonnelly/KTDIconFont.git", :branch => "master", :tag => s.version }

  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'

  s.pod_target_xcconfig = {
      'CLANG_CXX_LANGUAGE_STANDARD' => 'compiler-default',
      'CLANG_CXX_LIBRARY' => 'compiler-default',
      
      # Don't ignore compile warnings
      'GCC_WARN_UNUSED_PARAMETER' => 'NO',
      'GCC_TREAT_WARNINGS_AS_ERRORS' => 'YES',
      'SWIFT_TREAT_WARNINGS_AS_ERRORS' => 'YES',

      'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'YES',
      'DEFINES_MODULE' => 'YES',
      
      'OTHER_CFLAGS' => '-Wall -Wextra',
  }
  
  s.module_name = 'KTDIconFont'
  s.swift_version = '5'

  s.subspec 'core' do |core|
    core.resources = 'Fonts/**/*.{ttf}'
    core.source_files = 'App/KTDIconFont/core/**/*.{swift}'
  end

  s.subspec 'ui' do |ui|
    ui.source_files = 'App/KTDIconFont/ui/**/*.{swift}'
  end

  s.requires_arc = true

  s.prefix_header_contents = <<-DESC
    #ifdef __OBJC__
      #import <Foundation/Foundation.h>
    #endif
  DESC

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'App/KTDIconFontTests/*.{swift}'
    test_spec.resources = 'App/KTDIconFontTests/*.{ttf}'
  end

end
