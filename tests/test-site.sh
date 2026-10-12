
#!/usr/bin/env bash
set -euo pipefail

echo "Running portfolio tests..."

test -s site/index.html
test -s site/style.css
test -s site/script.js

grep -qi '<html' site/index.html
grep -q 'style.css' site/index.html
grep -q 'script.js' site/index.html
grep -q 'id="projects"' site/index.html

echo "PASS: Required files exist."
echo "PASS: HTML references CSS and JavaScript."
echo "PASS: Projects section exists."
echo "All portfolio tests passedd."
