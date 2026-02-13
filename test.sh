#!/usr/bin/env bash
# Script to help diagnose circular imports in NixOS configuration

echo "=== Checking for common circular import patterns ==="
echo ""

# Check for files that import each other
echo "Files with 'imports' attribute:"
find . -name "*.nix" -type f -exec grep -l "imports\s*=" {} \; 2>/dev/null

echo ""
echo "=== Checking each file's imports ==="
for file in $(find . -name "*.nix" -type f); do
    if grep -q "imports\s*=" "$file"; then
        echo "File: $file"
        grep -A 10 "imports\s*=" "$file" | head -15
        echo "---"
    fi
done

echo ""
echo "=== Checking for @args patterns that might cause recursion ==="
grep -n "@args" **/*.nix 2>/dev/null || echo "No @args patterns found"

echo ""
echo "=== Checking for function argument recursion ==="
grep -n "{ config.*}@" **/*.nix 2>/dev/null || echo "No potential issues found"
