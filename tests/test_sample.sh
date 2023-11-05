#!/usr/bin/env bash
function set_up() {
	# This will run before each test in this file
	true
}

function set_up_before_script() {
	# This will run before all tests in this file
	true
}

function something_to_test() {
	echo "himom!"
}

function test_should_validate_equal_strings() {
	result=$(something_to_test)
	assert_equals "himom!" "$result"
}

function test_should_validate_string_contains() {
	result=$(something_to_test)
	assert_contains "mom" "$result"
}

function test_should_validate_if_dir() {
	skip "Don't feel like running"
	local directory="/var"
	assert_is_directory "$directory"
}

# more assertions here:
# https://bashunit.typeddevs.com/assertions

function test_with_mocks() {
	mock ls echo "what"

	assert_equals "what" "$(ls)"
}

function test_with_spy() {
	spy lolcow

	lolcow foo bar

	assert_have_been_called lolcow
	assert_have_been_called_with "foo bar" lolcow
}

function tear_down() {
	# This will run after each test in this file
	true
}

function tear_down_after_script() {
	# This will run after all tests in this file
	true
}
