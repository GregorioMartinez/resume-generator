# resume-generator
A simple way to convert YAML to HTML resumes.

## Install
```
go get github.com/gregoriomartinez/resume-generator
```

## Usage

```
resume-generator -input resume.yaml -output resume.html
```
## Flags

```
// Specify YAML Or JSON file name to use read data from.
// Defaults to resume.yaml
-input 

// Specify output filename
// If is left blank then writes to STDOUT
-output
```

## PDF Support
Writing PDF's is out of the scope of this project at the moment.
The easiest way to write PDF's would be to pipe the output to a tool  such as `wkhtmltopdf` or `phantomjs`

## TODO
* Add support for multiple templates
* Add support for JSON files
* Add support for templates to specify required fields


### Credits
[jsonresume-theme-onepage](https://github.com/ainsleyc/jsonresume-theme-onepage) is used as the only template.

