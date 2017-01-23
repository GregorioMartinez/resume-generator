package main

type resume struct {
	Name     string `json:"name"`
	Email    string `json:"email"`
	Phone    string `json:"phone"`
	Address  string `json:"address"`
	Profiles []struct {
		Link string `json:"link"`
	} `json:"profiles"`
	Experience []struct {
		Name      string   `json:"name"`
		Title     string   `json:"title"`
		StartDate string   `json:"startdate"`
		EndDate   string   `json:"enddate"`
		Summary   []string `json:"summary"`
	} `json:"experience"`
	Projects []struct {
		Name    string   `json:"name"`
		Link    string   `json:"link"`
		Summary []string `json:"summary"`
	} `json:"projects"`
	Education []struct {
		Name  string `json:"name"`
		Title string `json:"title"`
	} `json:"education"`
	Skills struct {
		Technologies string `json:"technologies"`
		Languages    string `json:"languages"`
		CMS          string `json:"cms"`
	} `json:"skills"`
	Certifications []struct {
		Name string `json:"name"`
	} `json:"certifications"`
}
