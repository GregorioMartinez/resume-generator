
<!doctype html>
<html>
<head>
	<meta charset='utf-8'>
	<meta name='viewport' content='width=device-width, user-scalable=no, minimal-ui'>

	<title>{{.Name}}</title>
	
	<style>
    body {
        background: #EEEEEE;
        font: 12px 'FreeSerif';
        line-height: 1.4;
        margin: 40px 0;
    }
    em {
        color: #999;
    }
    p {
        line-height: 1.4;
    }
    ul {
        margin-bottom: 0;
    }
    li {
        margin-bottom: 2px;
    }
    a {
        text-decoration: none;
    }
    #resume {
        margin: 0 auto;
        max-width: 600px;
        padding: 80px 100px;
        background: #fff;
        border: 1px solid #ccc;
        box-shadow: 2px 2px 4px #aaa;
        -webkit-box-shadow: 2px 2px 4px #aaa;
    }
    .coursesList {
        width: 28%;
        vertical-align: top;
        display: inline-block;
    }
    .largeFont {
        font-size: 20px;
    }
    .smallFont {
        font-size: 12px;
    }
    .sectionBlock {
        display: flex;
        width: 100%;
    }
    .sectionName {
        width: 18%;
        vertical-align: top;
        display: inline-block;
    }
    .sectionContent {
        width: 80%;
        vertical-align: top;
        display: inline-block;
    }
    .sectionContent ul {
        padding-left: 20px;
        margin-top: 6px;
        list-style-type: circle;
    }
    .sectionContent .title {
        font-weight: bold;
    }
    .sectionContent .date {
        float: right;
    }
    .sectionContent .separator {
        height: 14px;
    }
    .sectionLine {
        border-style: dashed;
        border-width: 1px;
        border-color: #CFCFCF;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .divider {
        font-weight: bold;
        margin-left: 5px;
        margin-right: 5px;
    }
    .summary {
        margin-top: 6px;
    }
    .skillBlock {
        margin-bottom: 4px;
    }
    .jobBlock {
        page-break-inside: avoid;
    }
    @media only screen and (max-width: 40em) {
        body {
            margin: 0;
            font-size: 14px;
        }
        #resume {
            margin: 0 auto;
            max-width: 600px;
            padding: 0.5em 1em;
            border: none;
        }
        .sectionContent {
            width: 100%;
        }
        .sectionContent .date {
            padding-right: 2em;
        }
        .sectionName {
            width: auto;
        }
        .largeFont {
            font-size: 20px;
        }
        .smallFont {
            font-size: 14px;
        }
    }
    @media print {
        body{
        	background: #FFFFFF;
        }

        #resume {
            margin: 0 auto;
            max-width: 600px;
            padding: 0px 0px;
            border: 0px;
            background: #fff;
            box-shadow: none;
            -webkit-box-shadow: none;
        }
        a {
            color: black;
        }
    }
</style>

</head>
<body>
	<div id='resume'>
		<div id='nameBlock' class='largeFont'>
			<span class='name'>
				{{.Name}}
			</span>
		</div>
		<div id='basicsBlock' class='smallFont'>
			<div class='contactBlock'>
				<span class='email'><a href="mailto:{{.Email}}">{{.Email}}</a></span>
				<span class='divider'>|</span>
				<span class='phone'>{{.Phone}}</span>
				<span class='divider'>|</span>
				<span class='address'>{{.Address}}</span>
			</div>
			{{range .Profiles}}
				<div id='profilesBlock'>
					<span class='url'><a href='{{.Link}}'>{{.Link}}</a></span>
				</div>
			{{end}}
		</div>
		<div class='sectionLine'></div>
		<div id='workBlock' class="sectionBlock">
			<div class='sectionName'>
				<span>EXPERIENCE</span>
			</div>
			<div class='sectionContent'>
				{{ range .Experience }}
				<div class="jobBlock">
					<div class='blockHeader'>
						<span class='title'>{{.Name}}</span>
						<span class='date'>{{.StartDate}} &mdash; {{.EndDate}}</span>
					</div>
					<ul class='highlights'>
						{{range $key, $value := .Summary}}
						<li>{{$value}}</li>
						{{end}}
					</ul>
				</div>
				{{ end }}
			</div>
		</div>
		<div class='sectionLine'></div>
		<div id='publications'>
			<div class='sectionName'>
				<span>PROJECTS</span>
			</div>
			<div class='sectionContent'>
				{{ range .Projects }}
				<div class="jobBlock">
					<div class='blockHeader'>
						<span class='title'>{{.Name}}</span>
					</div>
					<div class='website'>
						<a href='{{.Link}}'>{{.Link}}</a>
					</div>
					<ul class='highlights'>
						{{range $key, $value := .Summary}}
						<li>{{$value}}</li>
						{{end}}
					</ul>
				</div>
				{{ end }}
			</div>
		</div>
		<div class='sectionLine'></div>
		<div id='education' class="sectionBlock">
			<div class='sectionName'>
				<span>EDUCATION</span>
			</div>
			<div class='sectionContent'>
				{{range .Education}}
					<div class='educationBlock'>
						<span class='title'>{{.Name}}</span>
						<div class=''>{{.Title}}</div>
					</div>
				{{end}}
			</div>
		</div>
		<div class='sectionLine'></div>
		<div id='skills' class="sectionBlock">
			<div class='sectionName'>
				<span>SKILLS</span>
			</div>
			<div class='sectionContent'>
					<div class='skillBlock'>
						Languages <span>{{.Skills.Languages}}</span>
					</div>
					<div class='skillBlock'>
						Technologies <span>{{.Skills.Technologies}}</span>
					</div>
					<div class='skillBlock'>
						CMS <span>{{.Skills.CMS}}</span>
					</div>
			</div>
		</div>
		<div class='sectionLine'></div>
		<div id='skills' class="sectionBlock">
			<div class='sectionName'>
				<span>Certifications</span>
			</div>
			<div class='sectionContent'>
				{{range .Certifications}}
					<div class='certBlock'>
						<span>{{.Name}}</span>
					</div>
				{{end}}
			</div>
		</div>
	</body>
	</html>
