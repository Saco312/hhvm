<?hh

$header = <<<'HEADER'
/**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 */

function token_get_all($source);
function token_name($token);

HEADER;

echo
  '<?hh // decl /* -*- php -*- */', "\n",
  '// @', 'generated by builtins_tokens.php', "\n",
  $header;

// 1000 parser tokens should be enough for anyone
// (logic shared with test/slow/ext_misc/token_consistency.php)
$token_range = range(1, 1000);
foreach ($token_range as $potential_token) {
  $token_name = token_name($potential_token);
  if ($token_name === 'UNKNOWN') {
    continue;
  }

  if (defined($token_name) &&
      $potential_token === constant($token_name)) {
    echo 'const int ', $token_name, ' = ', $potential_token, ';', "\n";
  }
}
