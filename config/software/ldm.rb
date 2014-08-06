# This is an example software definition for a C project.
#
# Lots of software definitions for popular open source software
# already exist in `opscode-omnibus`:
#
#  https://github.com/opscode/omnibus-software/tree/master/config/software
#
name "ldm"
default_version "6.12.4"

dependency "zlib"
dependency "openssl"
dependency "libxml2"
dependency "gdbm"

source :url => "ftp://ftp.unidata.ucar.edu/pub/ldm/ldm-#{version}.tar.gz",
       :md5 => "38f6985ac0355ac4474a59a923d69a11"

relative_path "#{name}-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "LDMHOME" => install_dir
}

build do
  command ["./configure",
           "--prefix=#{install_dir}",
           "--disable-static",
           "--disable-root-actions"].join(" "), :env => env

  command "make install", env: {"DESTDIR" => "/", "LDMHOME" => install_dir}
  command "sudo make root-actions"
end
