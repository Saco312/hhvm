open Integration_test_base_types

module Test = Integration_test_base

let file_a = "A.php"
let file_b = "B.php"

let content_a_0 = {|<?hh // strict
interface Rx {
}

class A {
}

<<__Rx, __OnlyRxIfArgs>>
function f(<<__OnlyRxIfImpl(Rx::class)>> A $a): void {
}
|}

let content_a_1 = {|<?hh // strict
interface Rx {
}

class A implements Rx {
}

<<__Rx, __OnlyRxIfArgs>>
function f(<<__OnlyRxIfImpl(Rx::class)>> A $a): void {
}
|}

let content_b = {|<?hh // strict

<<__Rx>>
function g(): void {
  f(new A());
}
|}

let errors = {|
File "/B.php", line 5, characters 3-12:
Reactive functions can only call other reactive functions. (Typing[4200])
File "/A.php", line 9, characters 10-10:
This function is not reactive.
|}

let () =
  let env = Test.setup_server () in
  let env = Test.setup_disk env [
    file_a, content_a_0;
    file_b, content_b;
  ] in

  Test.assert_env_errors env errors;

  let env, loop_output = Test.(run_loop_once env { default_loop_input with
    disk_changes = [
      file_a, content_a_1;
    ]
  }) in

  if not loop_output.did_read_disk_changes then
    Test.fail "Expected the server to process disk updates";

  Test.assert_no_errors env;
