<?hh

type Tmixed = mixed;

function is_mixed($x): void {
  if ($x is Tmixed) {
    echo "mixed\n";
  } else {
    echo "not mixed\n";
  }
}

is_mixed(null);
is_mixed(-1);
is_mixed(false);
is_mixed(1.5);
is_mixed('foo');
is_mixed(STDIN);
is_mixed(new stdClass());
is_mixed(tuple(1, 2, 3));
is_mixed(shape('a' => 1, 'b' => 2));
