#!/usr/bin/env bash
setup() {
  load '/usr/lib/bats-support/load'
  load '/usr/lib/bats-assert/load'
    # use $BATS_TEST_FILENAME to grab current file
    # get the containing directory of this file
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in template visible to PATH
    PATH="$DIR/../:$PATH"
    PATH="$DIR/../core/:$PATH"
}

@test "test that it runs" {
    template.sh
}

@test "test the output" {
    run template.sh
    assert_output --partial "Array element num 3 is: hey!"
}

@test "a test to skip" {
    skip "Explain why"
    run template.sh
    assert_output --partial "Array element num 3 is: hey!"
}

@test "create a tmp file" {
    touch tmp_file
    run template.sh
    assert_output --partial "Array element num 3 is: hey!"
}

teardown() {
    # Remove the tmp file
    rm -f tmp_file
}
