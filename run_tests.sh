#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Ensure the reports directory exists
mkdir -p reports
mkdir -p reports/allure-results

echo "Running Behave tests with coverage and Allure..."
# Removed format and output options, relying on behave.ini
coverage run -m behave > /dev/null 2>&1

echo "Generating coverage report in console..."
coverage report

echo "Generating HTML coverage report..."
coverage html

echo "HTML coverage report generated at: htmlcov/index.html"

echo "Generating Allure HTML report..."
allure generate reports/allure-results -o reports/allure-report --clean

echo "Allure HTML report generated at: reports/allure-report"
echo "To view the Allure report, run: allure serve reports/allure-results"

# allure serve allure-results

allure serve -h 0.0.0.0 -p 35211 reports/allure-results
