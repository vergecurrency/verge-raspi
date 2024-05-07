package=libXau
$(package)_version=1.0.11
$(package)_download_path=https://xorg.freedesktop.org/releases/individual/lib/
$(package)_file_name=libXau-$($(package)_version).tar.xz
$(package)_sha256_hash=f3fa3282f5570c3f6bd620244438dbfbdd580fc80f02f549587a0f8ab329bbeb
$(package)_dependencies=xorgproto

# When updating this package, check the default value of
# --disable-xthreads. It is currently enabled.
define $(package)_set_vars
  $(package)_config_opts=--disable-shared --disable-lint-library --without-lint
  $(package)_config_opts += --disable-dependency-tracking --enable-option-checking
  $(package)_config_opts += --with-pic
endef

define $(package)_preprocess_cmds
  cp -f $(BASEDIR)/config.guess $(BASEDIR)/config.sub .
endef

define $(package)_config_cmds
  $($(package)_autoconf)
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef

define $(package)_postprocess_cmds
  rm -rf share lib/*.la
endef