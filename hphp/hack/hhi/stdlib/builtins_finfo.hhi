<?hh // decl     /* -*- php -*- */
/**
 * Copyright(c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 */

const FILEINFO_NONE = 0;
const FILEINFO_SYMLINK = 2;
const FILEINFO_MIME = 1040;
const FILEINFO_MIME_TYPE = 16;
const FILEINFO_MIME_ENCODING = 1024;
const FILEINFO_DEVICES = 8;
const FILEINFO_CONTINUE = 32;
const FILEINFO_PRESERVE_ATIME = 128;
const FILEINFO_RAW = 256;

<<__PHPStdLib>>
function finfo_open($options = null, $magic_file = null) {}
<<__PHPStdLib>>
function finfo_close($finfo) {}
<<__PHPStdLib>>
function finfo_set_flags($finfo, $options) {}
<<__PHPStdLib>>
function finfo_file($finfo, $file_name, $options = null, $context = null) {}
<<__PHPStdLib>>
function finfo_buffer($finfo ,$string, $options = FILEINFO_NONE, $context = NULL) {}
<<__PHPStdLib>>
function mime_content_type($filename) {}

class finfo {
  // Methods
  public function __construct(
    int $options = FILEINFO_NONE,
    $magic_file = null,
  );
  public function buffer(
    $string = null,
    int $options = FILEINFO_NONE,
    $context = null,
  ): string;
  public function file(
    $file_name = null,
    int $options = FILEINFO_NONE,
    $context = null,
  ): string;
  public function set_flags(int $options): bool;

}
