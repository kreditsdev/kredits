package=zeromq
$(package)_version=4.3.3
$(package)_download_path=https://github.com/kreditsdev/libzmq/releases/download/v$($(package)_version)/
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=3CCF273C1E81387611788D41462341EA2671DC42C2964EF11C65379DE445A51B
$(package)_dependencies=sodium

define $(package)_set_vars
  $(package)_config_opts=--without-documentation --disable-shared --with-libsodium
  $(package)_config_opts_linux=--with-pic
  $(package)_config_opts_freebsd=--with-pic
  $(package)_cxxflags=-std=c++11
endef

define $(package)_config_cmds
  $($(package)_autoconf) AR_FLAGS=$($(package)_arflags)
endef

define $(package)_build_cmds
  $(MAKE) src/libzmq.la
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install-libLTLIBRARIES install-includeHEADERS install-pkgconfigDATA
endef

define $(package)_postprocess_cmds
  rm -rf bin share
endef
