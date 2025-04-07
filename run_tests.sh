#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Ensure the reports directory exists
mkdir -p reports
mkdir -p allure-results

echo "Running Behave tests with coverage and Allure..."
coverage run -m behave --format json --outfile=reports/report.json --format allure_behave.formatter:AllureFormatter -o allure-results

echo "Generating coverage report in console..."
coverage report

echo "Generating HTML coverage report..."
coverage html

echo "HTML coverage report generated at: htmlcov/index.html"

echo "Generating Allure HTML report..."
allure generate allure-results -o allure-report --clean

echo "Allure HTML report generated at: allure-report"
echo "To view the Allure report, run: allure serve allure-results"
