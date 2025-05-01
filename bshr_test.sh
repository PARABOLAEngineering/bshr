#!/bin/bash
set -e

echo "=== Testing Python ==="
bshr python "import sys; print('Python:', sys.version)"

echo "=== Testing Ruby ==="
bshr ruby "puts 'Ruby: ' + RUBY_VERSION"

echo "=== Testing Rust ==="
bshr rust "println!(\"Rust: 1.70.0\");"

echo "=== Testing Java ==="
bshr java "System.out.println(\"Java test successful!\");"

echo "=== All tests passed ==="