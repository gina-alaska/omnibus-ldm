
name 'ldm'
maintainer 'UAF GINA'
homepage 'http://gina.alaska.edu'

install_dir    '/opt/ldm'
build_version   Omnibus::BuildVersion.new.semver
build_iteration 1

# creates required build directories
dependency 'preparation'

# ldm dependencies/components
dependency 'ldm'

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
