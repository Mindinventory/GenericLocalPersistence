Pod::Spec.new do |spec|

  spec.name         = "GenericLocalPersistence"
  spec.version      = "1.0.0"
  spec.summary      = "A cocoaPod library written in swift."
  spec.description  = "A cocoaPod library written in swift for local Persistence."

  spec.platform     = :ios, "12.1"

  spec.homepage     = "https://github.com/Riddhi-mi/GenericLocalPersistence"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "RiddhiPatel" => "riddhi.patel@mindinventory.com" }
  spec.source       = { :git => "https://github.com/Riddhi-mi/GenericLocalPersistence.git", :tag => "#{spec.version}"}
  spec.source_files  = "GenericLocalPersistence/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"
  spec.swift_version = "4.2"
end
