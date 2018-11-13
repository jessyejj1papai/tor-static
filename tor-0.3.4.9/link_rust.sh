#!/bin/sh
#
# A linker script used when building Rust tests.  Autoconf makes link_rust.sh
# from link_rust_sh.in, and uses it to pass extra options to the linker
# when linking Rust stuff.
#
# We'd like to remove the need for this, but build.rs doesn't let us pass
# -static-libasan and -static-libubsan to the linker.

$CCLD  "$@"
