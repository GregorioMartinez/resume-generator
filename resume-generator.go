package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"html/template"
	"io/ioutil"
	"log"
	"os"

	"github.com/GeertJohan/go.rice"
	"github.com/ghodss/yaml"
)

func main() {

	inputName := flag.String("input", "resume.yaml", "Name of resume data file (YAML).")
	outputName := flag.String("output", "", "Name of file with extension. If not provided it prints to STDOUT")

	flag.Parse()

	resume, err := getResumeData(*inputName)
	if err != nil {
		log.Fatal(err)
	}

	t, err := findTemplate("template.tpl")
	if err != nil {
		log.Fatal(err)
	}

	outputData := new(bytes.Buffer)
	err = t.Execute(outputData, resume)
	if err != nil {
		log.Fatal(err)
	}

	err = write(*outputName, outputData)
	if err != nil {
		log.Fatal(err)
	}
}

func getResumeData(filename string)(resume, error){

	var r resume

	content, err := ioutil.ReadFile(filename)
	if err != nil {
		return r, err
	}

	data, err := yaml.YAMLToJSON(content)
	if err != nil {
		return r, err
	}

	json.Unmarshal(data, &r)

	return r, nil
}

func findTemplate(s string) (*template.Template, error) {
	templateBox, err := rice.FindBox("templates")
	if err != nil {
		return nil, err
	}

	templateString, err := templateBox.String(s)
	if err != nil {
		return nil, err
	}

	return template.New("template").Parse(templateString)
}

func write(s string, buffer *bytes.Buffer) error {
	if s == "" {
		fmt.Printf("%s", buffer.Bytes())
	} else {
		file, err := os.Create(s)
		if err != nil {
			return err
		}
		defer file.Close()

		ioutil.WriteFile(s, buffer.Bytes(), 0644)

		err = file.Sync()
		if err != nil {
			return err
		}
	}

	return nil
}
