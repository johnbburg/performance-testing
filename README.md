# Site Performance Testing

This tool will run a suite of site performance related tests on a set of URLs. Including:

Apache Benchmark (http://httpd.apache.org/docs/2.2/programs/ab.html)
Google PageSpeed (https://www.npmjs.com/package/psi)
WebPageTest.org (http://www.webpagetest.org/)

## Dependencies

Apache Benchmark (ab): This comes with the standard apache installation.

Google PageSpeed Plugin: https://www.npmjs.com/package/psi

## Installation

Clone this repository.

Create a settings.cfg and url-keys.cfg and webpagetest/urls.txt files. Follow the examples for settings.cfg and
url-keys.cfg. webpagetest/urls.txt will just be a plain text. The Web Page test tool will require an API key, which
should be added to settings.cfg. API keys can be requested at http://www.webpagetest.org/getkey.php.

## Usage

Execute the run.sh script and wait for the result to complete. Using default settings. Test results will be placed in
result/[date and time of test]. 