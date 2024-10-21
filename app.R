source('./global/global.R')

print(paste0('phantom: ', webshot:::find_phantom()))

ui <- fluidPage(
    tags$style(
        HTML('
            input[type=number] {
                -moz-appearance:textfield;
            }
            input[type=number]::{
                -moz-appearance:textfield;
            }
            input[type=number]::-webkit-outer-spin-button,
            input[type=number]::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            .border-my-text {
                border: 2px solid black;
                color: white;
                padding-top:5%;
                border-padding: 2px;
                background-color: #1a4480;
                text-align: center;
                width: 80%
            }
            .center-div-text {
                text-align: center;
                font-weight: bold;
                text-decoration:underline;
            }
            .border-my-class {
                border: 2px solid black;
                color:white;
                padding-top:5%;
                border-padding: 40px;
                background-color: #1a4480;
                color: white;
                text-align: center;
            }
            #reg_button {
                background-color:#005ea2;
                color: white;
                padding: 7px;
                font-size: 110%;
                font-weight: bold;
                border-style: outset;
                
                box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
                transition-duration: 0.1s;
            }
            #reg_button:hover {
                background-color:#1a4480;
                color: white;
                border-style: solid;
                border-color: black;
                border-width: px;
            }
            #indicator_button {
                background-color:#005ea2;
                color:white;
                padding: 7px;
                font-size: 110%;
                font-weight: bold;
                border-style: outset;
                
                box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
                transition-duration: 0.1s;
            }
            #indicator_button:hover {
                background-color:#1a4480;
                color: white;
                border-style: solid;
                border-color: black;
                border-width: px;
              }
            .question_box {
                background-color: lightgrey;
                width: 100%;
                border: 3px solid black;
                padding: 10px;
                margin: 0px;
            }
            #runmodel {
                background-color:#005ea2;
                color:white;
                padding: 7px;
                font-size: 110%;
                font-weight: bold;
                border-style: outset;
                
                box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
                transition-duration: 0.1s;
            }
            #runmodel:hover {
                background-color:#1a4480;
                color: white;
                border-style: solid;
                border-color: black;
                border-width: px;
            }
            #report {
                background-color:#005ea2;
                color:white;
                padding: 7px;
                font-size: 110%;
                font-weight: bold;
                border-style: outset;
                
                box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
                transition-duration: 0.1s;
            }
            #report:hover {
                background-color:#1a4480;
                color: white;
                border-style: solid;
                border-color: black;
                border-width: px;
            }
            .leaflet-popup-content {
                text-align: center;
            }
            .header-color{
            background-color: #E3F0F6;
            }
            
            .panel-default > .panel-heading{
            background-color: #D9EDF7;
            }
            
            header .epa-search>.form-text {
                height: 28px !important;
                width: 215px !important;
            }
            .noscollbar {
                overflow-y: visible !important;
                left: 15px;
                min-width: auto;
            }
            .panel-default .panel-heading {
                background-color: #dbf2ff;
                color: #0071bc;
            } 
            
            .panel-default .ng-binding {
                font-size:14px;
            }
            
            .panel-default .panel-body {
                padding-top: 3px;
                padding-bottom: 6px;
                padding-right: 0;
            } 
            
            .panel-default .panel-body li {
                padding-bottom: 5px;
            }
            
            a {
                cursor: pointer !important;
            }
            
            header .login-search-button {
                background-image:  url("https://www.epa.gov/themes/epa_theme/images/search.svg"), linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0));
                background-color: #1a4480;
                background-position: 50% 50%;
                background-repeat: no-repeat;
                background-size: 12px 12px;
                width: 44px;
                height: 28px;
            }
            
            header .site-logo{
                display: block !important;
                height: 22px;
                float: right;
            }
            
            
            .spacer{
                height: 50px;
            }
            
            .bg-light-gray{
                background-color: #ececec;
            }
            
            #mainDiv {
                transition: margin-right .5s;
            }
            .site-logo-svg-main{
                fill: #fff;
            }
            
            .login-header {
                background-color: #005ea2;
                padding: 1em 0;
                display: flex;
            }
            
            .login-header-inner{
                max-width: 60em;
                margin: 0 auto;
                padding: 0 1em;
                flex-grow: 1;
            }
            
            .flex-growbox{
                flex-grow: 1;
            }
            
            .login-site-slogan{
                font-size: .8em;
                color: #fff;
                font-family: Arial, sans-serif;
                line-height: 1;
            }
            
            header .region-header{
                display: flex;
                justify-content: right;
            }
            
            header .epa-search-form{
                display: flex;
                height: 28px;
            }

            nav.main-nav {
                background-color: #1a4480;
            }

            @media screen and (max-width:50em) {
                header .login-site-slogan{
                    display: none;
            }
            .login-header-inner {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .mobile-links {
                margin-top: 0;
            }

            .menu-button {
              display: none;
            }

            div.alert-info {
              position: relative;
            }

            div.alert-info p.pull-left {
              -webkit-transform: translateY(-50%);
              -ms-transform: translateY(-50%);
              -o-transform: translateY(-50%);
              transform: translateY(-50%);
              position: absolute;
              top: 50%;
            }

           
            '
        )
    ),
    
  tags$head(
    HTML(
        '
        <!-- Google Tag Manager -->
        <script>(function (w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({"gtm.start": new Date().getTime(), event: "gtm.js"});
        var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != "dataLayer" ? "&l=" + l : "";
        j.async = true;
        j.src = "//www.googletagmanager.com/gtm.js?id=" + i + dl;
        f.parentNode.insertBefore(j, f);
        })(window, document, "script", "dataLayer", "GTM-L8ZB");</script>
        <!-- End Google Tag Manager -->
        '
    ),
    tags$meta(charset="utf-8"),
    tags$meta(`http-equiv`="ImageToolbar", content="false"),
    tags$meta(`httpequiv`="cleartype", content="on"),
    tags$meta(name="HandheldFriendly", content="true"),
    tags$link(rel="shortcut icon", type="image/vnd.microsoft.icon", href="https://www.epa.gov/sites/all/themes/epa/favicon.ico"),
    tags$meta(name="MobileOptimized", content="width"),
    tags$meta(name="viewport", content="width=device-width"),
    HTML(
          '<!--googleon: all-->
          <meta name="DC.description" content=""/>
          <meta name="DC.title" content=""/>
          <!--googleoff: snippet-->
          <meta name="keywords" content=""/>
          <link rel="canonical" href=""/>
          <link rel="shortlink" href=""/>
          <meta name="DC.language" content="en"/>
          <meta name="DC.Subject.epachannel" content=""/>
          <meta name="DC.type" content=""/>
          <meta name="DC.Subject.epaopt" content=""/>
          <meta name="DC.date.created" content=""/>
          <meta name="DC.date.modified" content=""/>
          <meta name="DC.date.reviewed" content=""/>
          <meta name="DC.creator" content=""/>
          <title>SDAMs</title>
          <!--googleoff: all-->
          '
    ),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/sites/all/libraries/standalone/css/core/style.css"),
    tags$meta(name="keywords", content=""),
    tags$link(rel="canonical", href=""),
    tags$link(rel="shortlink", href=""),
    tags$meta(property="og:site_name", content="US EPA"),
    tags$link(rel = "stylesheet", type = "text/css", href = "css/uswds.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "https://cdnjs.cloudflare.com/ajax/libs/uswds/3.0.0-beta.3/css/uswds.min.css", integrity="sha512-ZKvR1/R8Sgyx96aq5htbFKX84hN+zNXN73sG1dEHQTASpNA8Pc53vTbPsEKTXTZn9J4G7R5Il012VNsDEReqCA==", crossorigin="anonymous", referrerpolicy="no-referrer"),
    tags$meta(property="og:url", content="https://www.epa.gov/themes/epa_theme/pattern-lab/.markup-only.html"),
    tags$link(rel="canonical", href="https://www.epa.gov/themes/epa_theme/pattern-lab/.markup-only.html"),
    tags$link(rel="shortlink", href="https://www.epa.gov/themes/epa_theme/pattern-lab/.markup-only.html"),
    tags$meta(property="og:url", content="https://www.epa.gov/themes/epa_theme/pattern-lab/.markup-only.html"),
    tags$meta(property="og:image", content="https://www.epa.gov/sites/all/themes/epa/img/epa-standard-og.jpg"),
    tags$meta(property="og:image:width", content="1200"),
    tags$meta(property="og:image:height", content="630"),
    tags$meta(property="og:image:alt", content="U.S. Environmental Protection Agency"),
    tags$meta(name="twitter:card", content="summary_large_image"),
    tags$meta(name="twitter:image:alt", content="U.S. Environmental Protection Agency"),
    tags$meta(name="twitter:image:height", content="600"),
    tags$meta(name="twitter:image:width", content="1200"),
    tags$meta(name="twitter:image", content="https://www.epa.gov/sites/all/themes/epa/img/epa-standard-twitter.jpg"),
    tags$meta(name="MobileOptimized", content="width"),
    tags$meta(name="HandheldFriendly", content="true"),
    tags$meta(name="viewport", content="width=device-width, initial-scale=1.0"),
    tags$meta(`http-equiv`="x-ua-compatible", content="ie=edge"),
    tags$script(src = "js/pattern-lab-head-script.js"),
    tags$title('SDAMs | US EPA'),
    tags$link(rel="icon", type="image/x-icon", href="https://www.epa.gov/themes/epa_theme/images/favicon.ico"),
    tags$meta(name="msapplication-TileColor", content="#FFFFFF"),
    tags$meta(name="msapplication-TileImage", content="https://www.epa.gov/themes/epa_theme/images/favicon-144.png"),
    tags$meta(name="application-name", content=""),
    tags$meta(name="msapplication-config", content="https://www.epa.gov/themes/epa_theme/images/ieconfig.xml"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="196x196", href="https://www.epa.gov/themes/epa_theme/images/favicon-196.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="152x152", href="https://www.epa.gov/themes/epa_theme/images/favicon-152.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="144x144", href="https://www.epa.gov/themes/epa_theme/images/favicon-144.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="120x120", href="https://www.epa.gov/themes/epa_theme/images/favicon-120.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="114x114", href="https://www.epa.gov/themes/epa_theme/images/favicon-114.png"),
    tags$link(rel="apple-touch-icon-precomposed", sizes="72x72", href="https://www.epa.gov/themes/epa_theme/images/favicon-72.png"),
    tags$link(rel="apple-touch-icon-precomposed", href="https://www.epa.gov/themes/epa_theme/images/favicon-180.png"),
    tags$link(rel="icon", href="https://www.epa.gov/themes/epa_theme/images/favicon-32.png", sizes="32x32"),
    tags$link(rel="preload", href="https://www.epa.gov/themes/epa_theme/fonts/source-sans-pro/sourcesanspro-regular-webfont.woff2", as="font", crossorigin="anonymous"),
    tags$link(rel="preload", href="https://www.epa.gov/themes/epa_theme/fonts/source-sans-pro/sourcesanspro-bold-webfont.woff2", as="font", crossorigin="anonymous"),
    tags$link(rel="preload", href="https://www.epa.gov/themes/epa_theme/fonts/merriweather/Latin-Merriweather-Bold.woff2", as="font", crossorigin="anonymous"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/ajax-progress.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/autocomplete-loading.module.css?r6lsex" ),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/js.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/sticky-header.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/system-status-counter.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/system-status-report-counters.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/system-status-report-general-info.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/tabledrag.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/tablesort.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/core/themes/stable/css/system/components/tree-child.module.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/themes/epa_theme/css/styles.css?r6lsex"),
    tags$link(rel="stylesheet", media="all", href="https://www.epa.gov/themes/epa_theme/css-lib/colorbox.min.css?r6lsex"),
    tags$script(src = 'https://cdnjs.cloudflare.com/ajax/libs/uswds/3.0.0-beta.3/js/uswds-init.min.js'),

    #fix container-fluid that boostrap RShiny uses
    tags$style(
        HTML(
            '.container-fluid {
                padding-right: 0;
                padding-left: 0;
                margin-right: 0;
                margin-left: 0;
            }
            .tab-content {
                margin-right: 30px;
                margin-left: 30px;
            }'
        )
        )
    ), # end head

  tags$body(
			class="path-themes not-front has-wide-template", id="top",
			tags$script(
						src = 'https://cdnjs.cloudflare.com/ajax/libs/uswds/3.0.0-beta.3/js/uswds.min.js'
					   )
  ),
  
  # Site Header
  HTML(
    '<!-- Google Tag Manager -->
        <noscript>
            <iframe src="//www.googletagmanager.com/ns.html?id=GTM-L8ZB" height="0" width="0"
                    style="display:none;visibility:hidden"></iframe>
        </noscript>
        <!-- End Google Tag Manager -->
         <div class="dialog-off-canvas-main-canvas" data-off-canvas-main-canvas>
    <section class="usa-banner" aria-label="Official government website">
      <div class="usa-accordion">
        <header class="usa-banner__header">
          <div class="usa-banner__inner">
            <div class="grid-col-auto">
              <img class="usa-banner__header-flag" src="https://www.epa.gov/themes/epa_theme/images/us_flag_small.png" alt="U.S. flag" />
            </div>
            <div class="grid-col-fill tablet:grid-col-auto">
              <p class="usa-banner__header-text">An official website of the United States government</p>
              <p class="usa-banner__header-action" aria-hidden="true">Here’s how you know</p>
            </div>
            <button class="usa-accordion__button usa-banner__button" aria-expanded="false" aria-controls="gov-banner">
              <span class="usa-banner__button-text">Here’s how you know</span>
            </button>
          </div>
        </header>
        <div class="usa-banner__content usa-accordion__content" id="gov-banner">
          <div class="grid-row grid-gap-lg">
            <div class="usa-banner__guidance tablet:grid-col-6">
              <img class="usa-banner__icon usa-media-block__img" src="https://www.epa.gov/themes/epa_theme/images/icon-dot-gov.svg" alt="Dot gov">
              <div class="usa-media-block__body">
                <p>
                  <strong>Official websites use .gov</strong>
                  <br> A <strong>.gov</strong> website belongs to an official government organization in the United States.
                </p>
              </div>
            </div>
            <div class="usa-banner__guidance tablet:grid-col-6">
              <img class="usa-banner__icon usa-media-block__img" src="https://www.epa.gov/themes/epa_theme/images/icon-https.svg" alt="HTTPS">
              <div class="usa-media-block__body">
                <p>
                  <strong>Secure .gov websites use HTTPS</strong>
                  <br> A <strong>lock</strong> (<span class="icon-lock"><svg xmlns="http://www.w3.org/2000/svg" width="52" height="64" viewBox="0 0 52 64" class="usa-banner__lock-image" role="img" aria-labelledby="banner-lock-title banner-lock-description"><title id="banner-lock-title">Lock</title><desc id="banner-lock-description">A locked padlock</desc><path fill="#000000" fill-rule="evenodd" d="M26 0c10.493 0 19 8.507 19 19v9h3a4 4 0 0 1 4 4v28a4 4 0 0 1-4 4H4a4 4 0 0 1-4-4V32a4 4 0 0 1 4-4h3v-9C7 8.507 15.507 0 26 0zm0 8c-5.979 0-10.843 4.77-10.996 10.712L15 19v9h22v-9c0-6.075-4.925-11-11-11z"/></svg></span>) or <strong>https://</strong> means you’ve safely connected to the .gov website. Share sensitive information only on official, secure websites.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <div>
      <div class="js-view-dom-id-epa-alerts--public">
        <noscript>
          <div class="usa-site-alert usa-site-alert--info">
            <div class="usa-alert">
              <div class="usa-alert__body">
                <div class="usa-alert__text">
                  <p>JavaScript appears to be disabled on this computer. Please <a href="/alerts">click here to see any active alerts</a>.</p>
                </div>
              </div>
            </div>
          </div>
        </noscript>
      </div>
    </div>
        <div class="skip-links">
            <a href="#main-content" class="skip-link element-invisible element-focusable">Jump to main content</a>
        </div>
        <header class="clearfix login-header" role="banner">
            <div class="login-header-inner">
            <div class="site-name-and-slogan">
                <h1 class="site-name">
                    <a href="https://www.epa.gov/" rel="home" title="Go to the home page">
                        <svg class="site-logo-svg-main" aria-hidden="true" viewBox="0 0 454.1 154.7" xmlns="http://www.w3.org/2000/svg">
                            <path d="m112.8 61.2c-4.8 18.6-22.9 33.3-42.9 33.3-20.1 0-38-14.7-42.9-33.4h.2s9.8 10.3-.2 0c3.1 3.1 6.2 4.4 10.7 4.4s7.7-1.3 10.7-4.4c3.1 3.1 6.3 4.5 10.9 4.4 4.5 0 7.6-1.3 10.7-4.4 3.1 3.1 6.2 4.4 10.7 4.4s7.7-1.3 10.7-4.4c3.1 3.1 6.3 4.5 10.9 4.4 4.3 0 7.4-1.2 10.5-4.3z"></path>
                            <path d="m113.2 51.2c0-24-19.4-43.5-43.3-43.5-24 0-43.5 19.5-43.5 43.5h39.1c-4.8-1.8-8.1-6.3-8.1-11.6 0-7 5.7-12.5 12.5-12.5 7 0 12.7 5.5 12.7 12.5 0 5.2-3.1 9.6-7.6 11.6z"></path>
                            <path d="m72.6 147c.7-36.9 29.7-68.8 66.9-70 0 37.2-30 68-66.9 70z"></path>
                            <path d="m67.1 147c-.7-36.9-29.7-68.8-67.1-70 0 37.2 30.2 68 67.1 70z"></path>
                            <path d="m240 10.8h-87.9v133.1h87.9v-20.4h-60.3v-36h60.3v-21h-60.3v-35h60.3z"></path>
                            <path d="m272.8 66.5h27.1c9.1 0 15.2-8.6 15.1-17.7-.1-9-6.1-17.3-15.1-17.3h-25.3v112.4h-27.8v-133.1h62.3c20.2 0 35 17.8 35.2 38 .2 20.4-14.8 38.7-35.2 38.7h-36.3z"></path>
                            <path d="m315.9 143.9h29.7l12.9-35h54.2l-8.1-21.9h-38.4l18.9-50.7 39.2 107.6h29.7l-53.1-133.1h-33.7z"></path>
                        </svg>
                    </a>
                </h1>
                <div class="login-site-slogan">United States Environmental Protection Agency</div>
            </div>
            <div class="flex-growbox"></div>
            <div class="region-header">
                <div class="block-epa-core-gsa-epa-search" id="block-epa-core-gsa-epa-search">
                    <form action="https://search.epa.gov/epasearch" class="epa-search-form" method="get">
                        <label class="element-hidden" for="search-box">Search</label>
                        <input class="form-text" id="search-box" name="querytext" placeholder="Search EPA.gov" value="">
                        <button class="login-search-button" id="search-button" title="Search" ></button>
                        <input name="areaname" type="hidden" value="">
                        <input name="areacontacts" type="hidden" value="">
                        <input name="areasearchurl" type="hidden" value="">
                        <input name="typeofsearch" type="hidden" value="epa">
                        <input name="result_template" type="hidden" value="2col.ftl">
                    </form>
                </div>
            </div>
            </div>
        </header>
        <nav class="nav main-nav clearfix" role="navigation">
            <div class="nav__inner">
                <h2 class="element-invisible">Main menu</h2>
                <ul class="menu" role="menu">
                    <li class="menu-item" role="presentation">
                        <a class="menu-link" href="https://www.epa.gov/environmental-topics" role="menuitem"
                           title="Learn about Environmental Topics that EPA covers.">Environmental Topics</a>
                    </li>
                    <li class="menu-item" role="presentation">
                        <a class="menu-link" href="https://www.epa.gov/laws-regulations" role="menuitem"
                           title="Laws written by Congress provide the authority for EPA to write regulations. Regulations explain the technical, operational, and legal details necessary to implement laws.">
                            Laws &amp; Regulations</a>
                    </li>
                    <li class="menu-item" role="presentation">
                        <a class="menu-link" href="https://www.epa.gov/report-violation" role="menuitem"
                        title="Report an environmental violation fraud, waste, or abuse.">Report a Violation</a>
                    </li>
                    <li class="menu-item" role="presentation">
                        <a class="menu-link" href="https://www.epa.gov/aboutepa" role="menuitem"
                           title="Learn more about our mission and what we do, how we are organized, and our history.">About EPA</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="mobile-nav" id="mobile-nav">
            <div class="mobile-bar clearfix">
                <label class="menu-button" for="mobile-nav-toggle">Menu</label>
            </div>
            <input checked id="mobile-nav-toggle" type="checkbox">
            <div class="mobile-links element-hidden" id="mobile-links" style="height:2404px;">
                <ul class="mobile-menu">
                    <li class="menu-item" role="presentation">
                        <a class="menu-link" href="https://www.epa.gov/environmental-topics" role="menuitem"
                           title="Learn about Environmental Topics that EPA covers.">Environmental Topics</a>
                    </li>
                    <li class="menu-item" role="presentation">
                        <a class="menu-link" href="https://www.epa.gov/laws-regulations" role="menuitem"
                           title="Laws written by Congress provide the authority for EPA to write regulations. Regulations explain the technical, operational, and legal details necessary to implement laws.">
                            Laws &amp; Regulations</a>
                    </li>
                    <li class="menu-item" role="presentation">
                        <a class="menu-link" href="https://www.epa.gov/report-violation" role="menuitem"
                           title="Report an environmental violation fraud, waste, or abuse.">Report a Violation</a>
                    </li>
                    <li class="menu-item" role="presentation">
                        <a class="menu-link" href="https://www.epa.gov/aboutepa" role="menuitem"
                           title="Learn more about our mission and what we do, how we are organized, and our history.">About EPA</a>
                    </li>
                </ul>
            </div>
        </div>
    <main id="main" class="main" role="main" tabindex="-1">
    '
  ),
  
  # Individual Page Header
  HTML(
    '<div class="l-page  has-footer">
      <div class="l-constrain">
        <div class="l-page__header">
          <div class="l-page__header-first">
            <div class="web-area-title"></div>
          </div>
          <div class="l-page__header-last">
            <a href="https://www.epa.gov/home/forms/send-request-technical-support" class="header-link">Contact Us</a>
          </div>
        </div>
        <article class="article">'
  ),
  
  
    # UI---------------------------------------------------------------------------------------------
	titlePanel(
    div(
        class="jumbotron",
        style='margin-top:-20px; margin-bottom:10px; padding-top:5px; padding-bottom:0px;',
        h2(
            HTML(
            "Web application for the Regional Streamflow Duration Assessment Methods (SDAMs)"
            )
        ),
        h4(HTML("<p>Version <a href=\"https://github.com/USEPA/SDAM-web-app\">1.0</a> Release date: October 2024 </p>")),
    ),
    "SDAMs"
    ),
    
    fluidRow(
      div(
        style={'padding-left:30px'},
     
                  column(
                      10,


                          # Overview -----------------------------------------------------

                              br(),
                              fluidRow(
                                column(1),
                                column(10,
                           
                                  HTML(
                                    '<div class="alert alert-danger" role="alert" 
                                      style="background-color:#005ea2; margin-top:-50px; padding-top:0px; padding-bottom:0px;">
                                      <h3 style=padding-top:2%;>
                                        <a href=\"https://www.epa.gov/streamflow-duration-assessment/supporting-materials\" style="color:#ffffff;">
                                        Supporting SDAM materials including user manuals, field assessment forms, training videos and more </a>
                                      </h3>
                                    </div>'                                      
                                  ),

                                  HTML(
                                    '<div class="alert alert-danger" role="alert" style="color:#000000; text-align:center;">
                                      <b>This web application is an analysis tool; it does not store data. After 60 minutes, the tool will timeout and all data will have to be re-entered. </b>
                                    </div>'
                                  ),
                                  
                                  HTML(
                                    '<h3 style="margin-top:5px; margin-bottom:-5px">
                                      <span class="badge badge-primary" 
                                        style="font-size:1.3rem;
                                                background-color:#1a4480;
                                                margin-right:8px;">Step 1
                                      </span>
                                      Method for documenting reach location
                                    </h3>'
                                  ),

                                  div(
                                    style = 'background-color: white;
                                              width: 100%;
                                              border: 1px solid black;
                                              padding: 10px;
                                              margin: 0px;',
          
                                    # coordinates----
                                    fluidRow(
                                      column(1),
                                      column(10,
                                        HTML("<b><i>Method for assessing reach location</b></i>"),
                                        selectInput(
                                          "vol_region",
                                          label = NULL,
                                          choices = c(
                                            "Enter coordinates",
                                            "Select region",
                                            "Select location on map"
                                          ),
                                          selected = "No",
                                          width = '80%'
                                        )
                                      )
                                    ),
                                    fluidRow(
                                        column(1),
                                        column(10,
                                              HTML('<hr style="color: black; height: 1px; background-color: black;">')
                                              )
                                    ),
                                    
                                    conditionalPanel(
                                        
                                      condition = "input.vol_region == 'Enter coordinates'",
                                      fluidRow(
                                          column(1),
                                          column(
                                              7,
                                              div(style="margin-bottom:5px;",
                                                HTML('<b><i>Enter coordinates in decimal degrees to determine if the site is in a SDAM study area </i></b>')),
                                              div(id = "placeholder"),
                                              div(id = "coords",
                                                fluidRow(
                                                    column(4,
                                                          numericInput("lat", 
                                                          label = NULL, 
                                                          value = 40)),
                                                    column(12, h5("Latitude"))
                                                ),
                                                fluidRow(
                                                    column(4,numericInput("lon", 
                                                    label = NULL, 
                                                    value = -98)),
                                                    column(12, h5("Longitude"))
                                                ),
                                                fluidRow(
                                                    column(4,
                                                            br(),
                                                            div(actionButton("reg_button", 
                                                                            label=div("Assess reach location")
                                                                            ) 
                                                              ),
                                                            br(), br(),
          
                                                          )
                                                )
                                              )
                                          ),
                                          column(
                                              4,
                                              conditionalPanel(
                                                  condition = "input.reg_button != 0",
                                                  
                                                  uiOutput(outputId = "reg_class") %>%
                                                  tagAppendAttributes(class = 'border-my-text')
                                              )
                                          )
                                      )
                                    ),
                                    
                                    ## select region via dropdown menu----
                                    conditionalPanel(
                                      condition = "input.vol_region == 'Select region'",
                                      fluidRow(
                                        column(1),
                                        column(10,
                                          HTML("<b><i>Select SDAM Region if not entering coordinates</b></i>"),
                                          selectInput(
                                            "user_region",
                                            label = NULL,
                                            c(
                                                "No region selected" = "No Region",
                                                "Arid West" = "Arid West",  
                                                "East" = "East",
                                                "Great Plains" = "Great Plains",
                                                "Pacific Northwest" = "Pacific Northwest",
                                                "Western Mountains" = "Western Mountains"
                                            )
                                          )
                                        )
                                      )
                                    ),
                                    
                                    ## leaflet map----
                                    conditionalPanel(
                                        condition = "input.vol_region == 'Select location on map'",
                                        fluidRow(
                                            column(2),
                                            column(8,
                                                leafletOutput("map", height ='600px'),
                                                br(),
                                                br()
                                            )
                                        )
                                    ),
                                  ),
                                  
                                  fluidRow(
                                      column(1),
                                      column(10,
                                              br(),
                                              div(
                                                style = 'margin: auto;
                                                        text-align: center;',
                                                actionButton("indicator_button", 
                                                              label=div("Enter Model Data")
                                                              ) 
                                                  ),
                                              br(),
                                              br(),
                                                  
                                            )
                                        ),
                                ),
                                
                              ),
                              
                              # Region UI Split-----
                              
                              conditionalPanel(
                                condition = "input.indicator_button != 0",
                                uiOutput("regionPanel") 
                              ),

                              uiOutput("reportPanel"),
                                
                              
                             
                      
                  )

      ) # end div  
    ),

  

  # Individual Page Footer
  HTML(
    '</article>
    </div>
    <div class="l-page__footer">
      <div class="l-constrain">
        <p><a href="https://www.epa.gov/home/forms/send-request-technical-support">Contact Us</a> to ask a question, provide feedback, or report a problem.</p>
      </div>
    </div>
  </div>
  <a hreg="#" id="myBtn" onclick="topPage()" title="">
    <svg class="back-to-top__icon" role="img" aria-label="">
  </a>

  '
  ),

	# Site Footer
	HTML(
	  '</main>
      <footer class="main-footer clearfix" role="contentinfo">
            <div class="main-footer__inner">
                <div class="region-footer">
                    <div class="block-pane-epa-global-footer" id="block-pane-epa-global-footer">
                        <div class="row cols-3">
                            <div class="col size-1of3">
                                <div class="col__title">
                                    Discover.
                                </div>
                                <ul class="menu">
                                    <li><a href="https://www.epa.gov/accessibility/epa-accessibility-statement">Accessibility Statement</a></li>
                                    <li><a href="https://www.epa.gov/aboutepa/epas-administrator">EPA Administrator</a></li>
                                    <li><a href="https://www.epa.gov/planandbudget">Budget &amp; Performance</a></li>
                                    <li><a href="https://www.epa.gov/contracts">Contracting</a></li>
                                    <li><a href="https://www.epa.gov/utilities/wwwepagov-snapshots">EPA www Web Snapshot</a></li>
                                    <li><a href="https://www.epa.gov/grants">Grants</a></li>
                                    <li><a href="https://www.epa.gov/ocr/whistleblower-protections-epa-and-how-they-relate-non-disclosure-agreements-signed-epa-employees">No FEAR Act Data</a></li>
                                    <li><a href="https://www.epa.gov/web-policies-and-procedures/plain-writing">Plan Writing</a></li>
                                    <li><a href="https://www.epa.gov/privacy">Privacy</a></li>
                                    <li><a href="https://www.epa.gov/privacy/privacy-and-security-notice">Privacy and Security Notice</a></li>
                                </ul>
                            </div>
                            <div class="col size-1of3">
                                <div class="col__title">
                                    Connect.
                                </div>
                                <ul class="menu">
                                    <li><a href="https://www.data.gov/">Data.gov</a></li>
                                    <li><a href="https://www.epaoig.gov/">Inspector General</a></li>
                                    <li><a href="https://www.epa.gov/careers">Jobs</a></li>
                                    <li><a href="https://www.epa.gov/newsroom">Newsroom</a></li>
                                    <li><a href="https://www.regulations.gov/">Regulations.gov
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-up-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5"/>
                                            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0z"/>
                                            <title>Exit Epa Website</title>
                                        </svg>
                                    </a></li>
                                    <li><a href="https://www.epa.gov/newsroom/email-subscriptions-epa-news-releases">Subscribe</a></li>
                                    <li><a href="https://www.usa.gov/">USA.gov
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-up-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5"/>
                                            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0z"/>
                                            <title>Exit Epa Website</title>
                                        </svg>
                                    </a></li>
                                    <li><a href="https://www.whitehouse.gov/">White House
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-up-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5"/>
                                            <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0z"/>
                                            <title>Exit Epa Website</title>
                                        </svg>
                                    </a></li>
                                </ul>
                            </div>
                            <div class="col size-1of3">
                                <div class="col__title">
                                    Ask.
                                </div>
                                <ul class="menu">
                                    <li><a href="https://www.epa.gov/home/forms/contact-epa">Contact EPA</a></li>
                                    <li><a href="https://www.epa.gov/web-policies-and-procedures/epa-disclaimers">EPA Disclaimers</a></li>
                                    <li><a href="https://www.epa.gov/aboutepa/epa-hotlines">Hotlines</a></li>
                                    <li><a href="https://www.epa.gov/foia">FOIA Requests</a></li>
                                    <li><a href="https://www.epa.gov/home/frequent-questions-specific-epa-programstopics">Frequent Questions</a></li>
                                </ul>
                                <div class="col__title">
                                    Follow.
                                </div>
                                <ul class="social-menu">
                                    <li><a class="menu-link social-facebook" href="https://www.facebook.com/EPA">EPA Facebook</a></li>
                                    <li><a class="menu-link" style="color:#fff" href="https://twitter.com/epa">EPA Twitter
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-twitter-x" viewBox="0 0 16 16">
                                            <path d="M12.6.75h2.454l-5.36 6.142L16 15.25h-4.937l-3.867-5.07-4.425 5.07H.316l5.733-6.57L0 .75h5.063l3.495 4.633L12.601.75Zm-.86 13.028h1.36L4.323 2.145H2.865z"/>
                                        </svg>
                                    </a></li>
                                    <li><a class="menu-link social-youtube" href="https://www.youtube.com/user/USEPAgov">EPA YouTube</a></li>
                                    <li><a class="menu-link social-flickr" href="https://www.flickr.com/photos/usepagov">EPA Flickr</a></li>
                                    <li><a class="menu-link social-instagram" href="https://www.instagram.com/epagov">EPA Instagram</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <a href="#" class="back-to-top" title="">
          <svg class="back-to-top__icon" role="img" aria-label="">
          <svg class="back-to-top__icon" role="img" aria-label="" viewBox="0 0 19 12" id="arrow" xmlns="http://www.w3.org/2000/svg">
          <!-- use xlink:href="https://www.epa.gov/themes/epa_theme/images/sprite.artifact.svg#arrow"></use -->
          <path fill="currentColor" d="M2.3 12l7.5-7.5 7.5 7.5 2.3-2.3L9.9 0 .2 9.7 2.5 12z"></path>
          </svg>
        </a>
    '
	)
) # END fluidPage

# Server Code-----
server <- function(input, output, session){

    # increase file upload size to 30MB
    options(shiny.maxRequestSize=30*1024^2)

    # region -----

    region_class <- eventReactive(c(input$reg_button, input$map_click,input$vol_region, input$user_region),{
        if(!is.null(map_coords()) && input$vol_region == 'Select location on map'){
            x <- point_region(map_coords()[1], map_coords()[2])
        } else if (input$vol_region == 'Select region' && input$user_region != 'No Region'){
            x <- input$user_region
        } else {
            x <- point_region(user_lat = input$lat, user_lon = input$lon)
        }
        x
    })

    # store adjacent regions for report
    alt_regions_str <- reactive({
      if(!is.null(map_coords()) && input$vol_region == 'Select location on map'){
            alt_regions <- region_checker(map_coords()[1], map_coords()[2])
            alt_regions <- alt_regions[alt_regions != 'East']
            alt_regions_str <- str_c(alt_regions, collapse=', ')

        } else if (input$vol_region != 'Select region' && input$vol_region != 'Select location on map'){
            alt_regions <- region_checker(input$lat, input$lon)
            alt_regions <- alt_regions[alt_regions != 'East']
            alt_regions_str <- str_c(alt_regions, collapse=', ')

        } else if (input$vol_region == 'Select region'){
          alt_regions_str <- 'Unknown'

        } else {
          alt_regions_str <- 'None'
        }
        
        alt_regions_str
    })


    # Alert user if their site is located within a 10-mile distance of another region(s)
    observeEvent(c(input$reg_button, input$map_click,input$vol_region, input$user_region),{
      if(!is.null(map_coords()) && input$vol_region == 'Select location on map'){
            alt_regions <- region_checker(map_coords()[1], map_coords()[2])
            alt_regions <- alt_regions[alt_regions != 'East']
            alt_regions_str <- str_c(alt_regions, collapse=', ')
            if (length(alt_regions) > 0){
                show_alert(
                    title = "",
                    text = tagList(
                            tags$p(
                                    HTML(paste0("This site is located within 10 miles of another SDAM region:",
                                                "<br><br>",
                                                "<b>", alt_regions_str, "</b>"
                                            )
                                        )
                                )
                            ),
                    type = "info"
                )

            }
        } else if (input$vol_region != 'Select region' && input$vol_region != 'Select location on map'){
            alt_regions <- region_checker(input$lat, input$lon)
            alt_regions <- alt_regions[alt_regions != 'East']
            alt_regions_str <- str_c(alt_regions, collapse=', ')
            if (length(alt_regions) > 0){
                show_alert(
                    title = "Location Warning!",
                    text = tagList(
                            tags$p(
                                    HTML(paste0("This site is located within 10 miles of another SDAM region.  <br>Please consider using one of the following SDAMs:",
                                                "<br><br>",
                                                "<b>", alt_regions_str, "</b>"
                                            )
                                        )
                                    )
                                ),
                    type = "info"
                )

            }
        } else {
          alt_regions_str <- 'No Regions Within 10 Miles'
        }

    })
    
      
    output$regionSelection <- renderText({
      region_class()$region
    })

    # Render UI Panels ------

    ### region panel-----
    output$regionPanel <- renderUI({

      if (is.atomic(region_class())){

        if (region_class() == 'East'){
            show_alert(
                    title = "",
                    text = tagList(
                            tags$p(HTML(paste0("This site is located in the East Beta SDAM study area. ",
                                            "Please visit the <a href=\"https://ecosystemplanningrestoration.shinyapps.io/beta_sdam_nese/\">East Beta SDAM application</a>  for the Northeast and Southeast."
                                            )
                                        )
                                    )
                                ),
                            type = "default"
            )

        } else  if (region_class() == 'Great Plains' ){
          gp_panel()
        } else  if (region_class() == 'Western Mountains' ){
          wm_panel()
        } else  if (region_class() == 'Arid West' ){
          aw_panel()
        } else  if (region_class() == 'Pacific Northwest' ){
          pnw_panel()
        }

      } else if (!is.atomic(region_class())){

        if (region_class()$region == 'East'){
          show_alert(
                title = "",
                text = tagList(
                        tags$p(HTML(paste0("This site is located in the East Beta SDAM study area. ",
                                        "Please visit the <a href=\"https://ecosystemplanningrestoration.shinyapps.io/beta_sdam_nese/\">East Beta SDAM application</a>  for the Northeast and Southeast."
                                        )
                                    )
                                )
                            ),
                        type = "default"
                        )

        } else  if (region_class()$region == 'Great Plains' ){
          gp_panel()
        } else  if (region_class()$region == 'Western Mountains' ){
          wm_panel()
        } else  if (region_class()$region == 'Arid West' ){
          aw_panel()
        } else  if (region_class()$region == 'Pacific Northwest' ){
          pnw_panel()
        }
      } else return(NULL)
    })
    
    ### report panel--------
    output$reportPanel <- renderUI({
        if (is.atomic(region_class())){

          if(region_class() == 'Great Plains' & input$runmodel != 0){
            gp_report()
          } else if (region_class() == 'Western Mountains' & input$runmodel != 0){
            wm_report()
          } else if (region_class() == 'Arid West' & input$runmodel != 0){
            aw_report()
          } else if (region_class() == 'Pacific Northwest' & input$runmodel != 0){
            pnw_report()
          }

        } else if (!is.atomic(region_class())){

          if(region_class()$region == 'Great Plains' & input$runmodel != 0){
            gp_report()
          } else if (region_class()$region == 'Western Mountains' & input$runmodel != 0){
            wm_report()
          } else if (region_class()$region == 'Arid West' & input$runmodel != 0){
            aw_report()
          } else if (region_class()$region == 'Pacific Northwest' & input$runmodel != 0){
            pnw_report()
          }

        }
        
      })

      ### additional information panel--------
    output$addInfoPanel <- renderUI({
        if (is.atomic(region_class())){

          if(region_class() == 'Great Plains'){
            gp_info(region_class())
          } else if (region_class() == 'Western Mountains'){
            wm_info(region_class())
          } else if (region_class() == 'Arid West'){
            aw_info(region_class())
          } else if (region_class() == 'Pacific Northwest'){
            pnw_info(region_class())
          }

        } else if (!is.atomic(region_class())){

          if(region_class()$region == 'Great Plains'){
            gp_info(region_class()$region)
          } else if (region_class()$region == 'Western Mountains'){
            wm_info(region_class()$region)
          } else if (region_class()$region == 'Arid West'){
            aw_info(region_class()$region)
          } else if (region_class()$region == 'Pacific Northwest'){
            pnw_info(region_class()$region)
          }

        }
        
      })


  # If site out of SDAM study areas, return warning message from global function
  final_sdams <- list('Great Plains', 'Arid West', 'Western Mountains', 'Pacific Northwest')
  observeEvent(c(input$reg_button, region_class()),{
      
      if (is.atomic(region_class())){
          output$reg_class <- renderUI ({
              h2(HTML(paste0("<b>SDAM Region: <br>", region_class(), "</b>")))
          })
      } else if (!is.atomic(region_class())){
   
        if (is.na(region_class()$region)){
          
          show_alert(
            title = "",
            text = tagList(
              tags$p(HTML(paste0("The location of your site is outside of any SDAM region.",
                                 " Please check your latitude and longitude coordinates to ensure they are entered in the correct format (decimal degrees and WGS84 datum).<br>")
              )
              )
            ),
            type = "default"
          )
          
        } else {
          
            if (!(region_class()$region %in% final_sdams) && !is.na(region_class()$region)){

                if (region_class()$URL != 'development' && region_class()$URL != 'planning'){
                    show_alert(
                        title = "",
                        text = tagList(
                            tags$p(HTML(paste0("This site is outside of the Final SDAM study areas.  The site is located in the ",
                                               '<a href=\"', region_class()$URL, '">',
                                               region_class()$region), ' SDAM.</a>')
                            )
                        ),
                        type = "default"
                    )
                } else {
                    show_alert(
                        title = "",
                        text = tagList(
                            tags$p(HTML(paste0(region_class()$region, ' - A Regional SDAM has not been developed for ', region_class()$region, '.  ',
                                                'A literature review for ', region_class()$region, ' has been completed.')
                                # paste0("This site is located outside of the Final SDAM study areas.  The site is located in the <b>",
                                #                region_class()$region, "</b> SDAM region.  The ",
                                #                region_class()$region, " is in the <b>",
                                #                region_class()$URL, "</b> stage.")
                                               )
                            )
                        ),
                        type = "default"
                    )
                }
  
            } else {
                output$reg_class <- renderUI ({
                    if(!is.na(region_class()$region)){
                        if(region_class()$region == 'Northeast' || region_class()$region == 'Southeast'){
                            h2(HTML(paste0("<b>Eastern Region: <br>", region_class()$region, "</b>")))
                        } else {
                            h2(HTML(paste0("<b>SDAM Region: <br>", region_class()$region, "</b>")))
                        }
                    }
                })
            }
        }
      }
  })

    # leaflet map render-----
    output$map <- renderLeaflet({
        factPal <- colorFactor(
          pal = rainbow(9), 
          levels = regions_leaflet$SDAM)
        leaflet(regions_leaflet) %>%
            addPolygons(stroke = TRUE,
                        weight=2,
                        fillOpacity = 0.3,
                        smoothFactor = 2,
                        color='black',
                        fillColor = ~factPal(regions_leaflet$SDAM),
                        group = "SDAM Regions") %>%
            setView(lng = -100.5,
                    lat = 35.5,
                    zoom = 5) %>%
            addLegend("bottomright",
                      title = HTML("<b><u>SDAM Regions</u></b>"),
                      pal = factPal,
                      values = regions_leaflet$SDAM,
                      group = "SDAM Regions") %>%

            addProviderTiles(providers$Esri.NatGeoWorldMap,
                             group = 'NatGeo World (Default)') %>%
            addProviderTiles(providers$Esri.WorldImagery,
                             group = 'Imagery') %>%
            addLayersControl(
                baseGroups=c("NatGeo World (Default)", "Imagery"),
                overlayGroups = "SDAM Regions",
                options = layersControlOptions(collapsed = FALSE)) %>%
            leafem::addMouseCoordinates() %>%
            addFullscreenControl()
    })
  
    # coordinates 
    map_coords <- reactive({
        click = input$map_click
        if(is.null(click))
            return()
        coords = c(round(click$lat,4), round(click$lng,4))
        updateNumericInput(
            session,
            "lat",
            value = coords[1]
        )
        updateNumericInput(
            session,
            "lon",
            value = coords[2]
        )
        coords
    })
    
    # lat/long----
    latitude <- eventReactive(c(input$map_click,input$lat, input$lon),{
        if(is.null(map_coords())){
            latitude <- input$lat
        } else if (!is.null(map_coords())){
            latitude <- map_coords()[1]
        }
        latitude
    })
    longitude <- eventReactive(c(input$map_click,input$lat, input$lon),{
        if(is.null(map_coords())){
            longitude <- input$lon
        } else if (!is.null(map_coords())){
            longitude <- map_coords()[2]
        }
        longitude
    })


    # map popup----
    observe({
        click = input$map_click
        if(is.null(click))
            return()
        
        region <- if (is.atomic(region_class())){
              paste0(region_class(), ' SDAM Region')
            } else {
              paste0(region_class()$region, ' SDAM Region')
            }
        
        text<-HTML(paste("<b><u>", region, "</u></b><br>",
            "Latitude: ", round(click$lat, 4), ", Longtitude: ", round(click$lng, 4)))
        text2<-paste("You've selected point ", text)
        map_proxy = leafletProxy("map") %>%
            clearPopups() %>%
            addPopups(round(click$lng, 4), round(click$lat, 4), text)

    })

    # percent shade calculation -----
    # dynamic UI output for length 1:12 for densiometer recordings
    output$densiUI <- renderUI({
        lapply(
            X = 1:input$select,
            FUN = function(i) {
                sliderInput(inputId = paste0("densi", i), label = i, min = 0, max = 17, value = i)
            }
        )
    })
    
    # dynamic UI list of inputs for densiometer recordings
    densi_list <- eventReactive(input$select, {
        lapply(
            X = 1:input$select,
            FUN = function(i) {
                input = paste0('densi', i)
            }
        )
    })
    
    # Densiometer input names for use in report possibly
    densi_inputs <- reactive({
        list_names <- c()
        for(x in 1:length(densi_list())){
            list_names[[x]] <- paste(densi_list()[x])
        }
        return(list_names)
    })
    
    # Densiometer input values
    densi_values <- reactive({
        list_values <- c()
        for(x in 1:length(densi_list())){
            list_values[[x]] <- input[[paste(densi_list()[[x]])]]
        }
        return(list_values)
    })
    
    # calculated shade percentage
    densi_shade_perc <- eventReactive(densi_values(),{
        round((Reduce("+", densi_values()) / (input$select* 17))*100,2)
    })
    densi_shade_dec <- eventReactive(densi_values(),{
        round((Reduce("+", densi_values()) / (input$select* 17)),2)
    })
    
    # Show user calculated percent value
    output$text <- renderUI ({
        
        h3(HTML(paste0("<b>Percent Shade: ", densi_shade_perc(), "%")))
        
    })
    
    # Bankfull width calculation----
    
    # dynamic UI output for length 1:3 for bankfull width recordings
    output$bankUI <- renderUI({
        lapply(
            X = 1:input$select_bank,
            FUN = function(i) {
                numericInput(inputId = paste0("bank", i),
                             label = paste0("bankfull measurement ", i), 
                             value = NULL)
            }
        )
    })
    
    # dynamic UI list of inputs for bankfull width recordings
    bank_list <- eventReactive(input$select_bank, {
        lapply(
            X = 1:input$select_bank,
            FUN = function(i) {
                input = paste0('bank', i)
            }
        )
    })
    
    # BFW input names to be possibly used in report
    bank_inputs <- reactive({
        list_names <- c()
        for(x in 1:length(bank_list())){
            list_names[[x]] <- paste(bank_list()[x])
        }
        return(list_names)
    })
    
    # BFW input values
    bank_values <- reactive({
        list_values <- c()
        for(x in 1:length(bank_list())){
            list_values[[x]] <- input[[paste(bank_list()[[x]])]]
        }
        return(list_values)
    })
    
    # BFW percentage
    bank_mean <- eventReactive(bank_values(),{
        (Reduce("+", bank_values()) / (input$select_bank))
    })
    
    # Show user calculated BFW
    output$bank_text <- renderUI ({
        h3(HTML(paste0("<b>Mean bankfull width (m): ", round(bank_mean(),1), "</b>")))
        
    })
    
    # model df ----
    df <- eventReactive(input$runmodel, {
      
      if (is.atomic(region_class())){
        
        if (region_class() == 'Great Plains' ){
          gp_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_total_abundance = input$user_total_abundance,
            user_hydrophyte = input$user_hydrophyte,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_sediment_plants = input$user_sediment_plants,
            user_substrate = input$user_substrate,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class() == 'Western Mountains' ){
          wm_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_total_abundance = input$user_total_abundance,
            user_hydrophyte = input$user_hydrophyte,
            user_substrate = input$user_substrate,
            user_eph_isa = input$user_eph_isa,
            user_PctShade = input$user_shade,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_slope = input$user_slope,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class() == 'Arid West' ){
          aw_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_hydrophyte = input$user_hydrophyte,
            user_eph_isa = input$user_eph_isa,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_algal_cover = input$user_algal_cover,
            user_slope = input$user_slope,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class() == 'Pacific Northwest' ){
          pnw_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_aquatic_presence = input$user_aquatic_presence,
            user_ephemeroptera = input$user_ephemeroptera,
            user_per_taxa = input$user_per_taxa,
            user_plants = input$user_plants,
            user_slope = input$user_slope,
            user_fish = input$user_fish,
            user_amphibians = input$user_amphibians
          )
        }

      } else if (!is.atomic(region_class())){

        if (region_class()$region == 'Great Plains' ){
          gp_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_total_abundance = input$user_total_abundance,
            user_hydrophyte = input$user_hydrophyte,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_sediment_plants = input$user_sediment_plants,
            user_substrate = input$user_substrate,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class()$region == 'Western Mountains' ){
          wm_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_total_abundance = input$user_total_abundance,
            user_hydrophyte = input$user_hydrophyte,
            user_substrate = input$user_substrate,
            user_eph_isa = input$user_eph_isa,
            user_PctShade = input$user_shade,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_slope = input$user_slope,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class()$region == 'Arid West' ){
          aw_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_hydrophyte = input$user_hydrophyte,
            user_eph_isa = input$user_eph_isa,
            user_upland_rooted = input$user_upland_rooted,
            user_diff_veg = input$user_diff_veg,
            user_algal_cover = input$user_algal_cover,
            user_slope = input$user_slope,
            user_riff_pool = input$user_riff_pool,
            user_bank_mean = bank_mean()
          )
        } else  if (region_class()$region == 'Pacific Northwest' ){
          pnw_df(
            user_lat = input$lat,
            user_lon = input$lon,
            user_aquatic_presence = input$user_aquatic_presence,
            user_ephemeroptera = input$user_ephemeroptera,
            user_per_taxa = input$user_per_taxa,
            user_plants = input$user_plants,
            user_slope = input$user_slope,
            user_fish = input$user_fish,
            user_amphibians = input$user_amphibians
          )
        }
      } else return(NULL)
    })
    
    # run rf model and output stream classification----
    classification <- eventReactive(input$runmodel, {

      if (is.atomic(region_class())){
        set.seed(1111)
        toupper(run_sdam(df(), region_class()))

      } else if (!is.atomic(region_class())){
        set.seed(1111)
        toupper(run_sdam(df(), region_class()$region))
      }
      
    })

    # format site visit date
    visit_date <- eventReactive(input$date, {
      as.character(input$date)
      # print(format(input$date, '%Y-%m-%d'))
    })

    observeEvent(input$runmodel, {
        check_list <- list()
        for (t in names(df())){
            if(length(df()[[t]]) == 0){
                cv <- 'NULL'
                # print('something')
                check_list <- append(check_list, cv)
            }
        }

        if ('NULL' %in% check_list) {
            print('Null found in check list')
            show_alert(
                title = "",
                text = tagList(
                        tags$p(HTML(paste0("Indicator data missing!  Please fill in all indicators before running the model prediction.")
                                    )
                                )
                            ),
                        type = "default"
                        )
        }
        
      
   
    })



    # output classification to ui
    output$class_out <- renderUI ({
      h2(HTML(paste0("<b>", "This reach is classified as:<br>", classification(), "</b>")))
    })

    # conditional checks for user inputs
    observeEvent(input$user_slope, {
        if (!is.na(input$user_slope)){
            if ((input$user_slope  < 0) | (input$user_slope  > 200) ){
                showModal(
                    modalDialog(
                        "Percent slope must be between 0 and 200",
                        footer= modalButton("OK"),
                        easyClose = FALSE
                    )
                )
                updateNumericInput(
                    session,
                    "user_slope",
                    value = 0
                )
            }
        }
    })

    observeEvent(input$surfflow, {
        if (!is.na(input$surfflow)){
            if ((input$surfflow  < 0) | (input$surfflow  > 100) ){
                showModal(
                    modalDialog(
                        "Percent of reach with surface flow must be between 0 and 100 (inclusive)",
                        footer= modalButton("OK"),
                        easyClose = FALSE
                    )
                )
                updateNumericInput(
                    session,
                    "surfflow",
                    value = 0
                )
            }
        }
    })
    
    observeEvent(input$subflow, {
        if (!is.na(input$subflow)){
            if (input$subflow < 0 | input$subflow > 100){
                showModal(
                    modalDialog(
                        "Percent of reach with surface and subsurface flow must be between 0 and 100 (inclusive)",
                        footer= modalButton("OK"),
                        easyclose = FALSE
                    )
                )
                updateNumericInput(
                    session,
                    "subflow",
                    value = 0
                )
            }
        }
    })
    
    observeEvent(input$subflow, {
        if(!is.na(input$subflow)){
            if (input$subflow < input$surfflow ){
                showModal(
                    modalDialog(
                        "Percent of reach with surface and subsurface flow must be greater than or equal to % of reach with surface flow",
                        footer= modalButton("OK"),
                        easyclose = FALSE
                    )
                )
                updateNumericInput(
                    session,
                    "subflow",
                    value = 0
                )
            }
        }
    })
    
    observeEvent(input$pool, {
        if (!is.na(input$surfflow)){
            if (input$surfflow == 100){
                if ((input$pool != 0) | (!is.null(input$pool))  ) {
                    showModal(
                        modalDialog(
                            "Number of isolated pools must be zero or blank if % of reach with surface flow is 100",
                            footer= modalButton("OK"),
                            easyclose = FALSE
                        )
                    )
                    updateNumericInput(
                        session,
                        "pool",
                        value = 0
                    )
                }
            }
        }
    })

    observeEvent(alt_regions_str(), {
      print(alt_regions_str())
    })
    

    file.copy("./www/eph.jpg",
                tempdir(), overwrite = TRUE)
    file.copy("./www/per.jpg",
                tempdir(), overwrite = TRUE)
    file.copy("./www/int.jpg",
                tempdir(), overwrite = TRUE)

    test_pic <- file.path(tempdir(), "eph.jpg")
  
    # Report Tab--------------------------------------------------------------
      
      # Site photos----
      fig1 <- reactive({gsub("\\\\", "/", input$blu$datapath)})
      fig2 <- reactive({gsub("\\\\", "/", input$mld$datapath)})
      fig3 <- reactive({gsub("\\\\", "/", input$mlu$datapath)})
      fig4 <- reactive({gsub("\\\\", "/", input$tld$datapath)})
      fig5 <- reactive({gsub("\\\\", "/", input$sketch$datapath)})

      #Invertebrate photos
      fig6 <- reactive({gsub("\\\\", "/", input$inv1$datapath)})
      fig7 <- reactive({gsub("\\\\", "/", input$inv2$datapath)})
      fig8 <- reactive({gsub("\\\\", "/", input$inv3$datapath)})
      # retroactively added photos; naming convention broken
      fig6_1 <- reactive({gsub("\\\\", "/", input$inv4$datapath)})
      fig7_1 <- reactive({gsub("\\\\", "/", input$inv5$datapath)})
      fig8_1 <- reactive({gsub("\\\\", "/", input$inv6$datapath)})

      # Substrate photos
      fig12 <- reactive({gsub("\\\\", "/", input$sub1$datapath)})
      fig13 <- reactive({gsub("\\\\", "/", input$sub2$datapath)})
      fig14 <- reactive({gsub("\\\\", "/", input$sub3$datapath)})

      # Differences in vegetation photos
      fig15 <- reactive({gsub("\\\\", "/", input$veg1$datapath)})
      fig16 <- reactive({gsub("\\\\", "/", input$veg2$datapath)})
      fig17 <- reactive({gsub("\\\\", "/", input$veg3$datapath)})

      # Sediment on Plants photos
      fig18 <- reactive({gsub("\\\\", "/", input$sed1$datapath)})
      fig19 <- reactive({gsub("\\\\", "/", input$sed2$datapath)})
      fig20 <- reactive({gsub("\\\\", "/", input$sed3$datapath)})

      # Slope photos
      fig21 <- reactive({gsub("\\\\", "/", input$slope1$datapath)})
      fig22 <- reactive({gsub("\\\\", "/", input$slope2$datapath)})
      fig23 <- reactive({gsub("\\\\", "/", input$slope3$datapath)})

      # Hydrophyte photos
      fig24 <- reactive({gsub("\\\\", "/", input$hydro1$datapath)})
      fig25 <- reactive({gsub("\\\\", "/", input$hydro2$datapath)})
      fig26 <- reactive({gsub("\\\\", "/", input$hydro3$datapath)})
      fig27 <- reactive({gsub("\\\\", "/", input$hydro4$datapath)})
      fig28 <- reactive({gsub("\\\\", "/", input$hydro5$datapath)})
      fig29 <- reactive({gsub("\\\\", "/", input$hydro6$datapath)})
      
      # Fish photos
      fig30 <- reactive({gsub("\\\\", "/", input$fish1$datapath)})
      fig31 <- reactive({gsub("\\\\", "/", input$fish2$datapath)})
      fig32 <- reactive({gsub("\\\\", "/", input$fish3$datapath)})

      # Perennial Indicator photos
      fig33 <- reactive({gsub("\\\\", "/", input$per1$datapath)})
      fig34 <- reactive({gsub("\\\\", "/", input$per2$datapath)})
      fig35 <- reactive({gsub("\\\\", "/", input$per3$datapath)})

      # Algal Cover photos
      fig36 <- reactive({gsub("\\\\", "/", input$algal1$datapath)})
      fig37 <- reactive({gsub("\\\\", "/", input$algal2$datapath)})
      fig38 <- reactive({gsub("\\\\", "/", input$algal3$datapath)})

      # Amphibian photos
      fig39 <- reactive({gsub("\\\\", "/", input$amph1$datapath)})
      fig40 <- reactive({gsub("\\\\", "/", input$amph2$datapath)})
      fig41 <- reactive({gsub("\\\\", "/", input$amph3$datapath)})

      # Riffle Pool photos
      fig42 <- reactive({gsub("\\\\", "/", input$riff1$datapath)})
      fig43 <- reactive({gsub("\\\\", "/", input$riff2$datapath)})
      fig44 <- reactive({gsub("\\\\", "/", input$riff3$datapath)})

      # Upland rooted photos
      fig45 <- reactive({gsub("\\\\", "/", input$ur1$datapath)})
      fig46 <- reactive({gsub("\\\\", "/", input$ur2$datapath)})
      fig47 <- reactive({gsub("\\\\", "/", input$ur3$datapath)})

      # Supplemental Info photos
      fig48 <- reactive({gsub("\\\\", "/", input$add1$datapath)})
      fig49 <- reactive({gsub("\\\\", "/", input$add2$datapath)})
      fig50 <- reactive({gsub("\\\\", "/", input$add3$datapath)})
      fig51 <- reactive({gsub("\\\\", "/", input$add4$datapath)})

      # Mean bankfull width
      fig52 <- reactive({gsub("\\\\", "/", input$mb1$datapath)})
      fig53 <- reactive({gsub("\\\\", "/", input$mb2$datapath)})
      fig54 <- reactive({gsub("\\\\", "/", input$mb3$datapath)})

      # Shading
      fig55 <- reactive({gsub("\\\\", "/", input$shade1$datapath)})
      fig56 <- reactive({gsub("\\\\", "/", input$shade2$datapath)})
      fig57 <- reactive({gsub("\\\\", "/", input$shade3$datapath)})
      fig58 <- reactive({gsub("\\\\", "/", input$shade4$datapath)})

    output$report <- downloadHandler(
        filename = glue::glue("SDAM Report ({format(Sys.time(), '%B %d, %Y')}).pdf"),
        content = function(file) {

            temp_region <- if (is.atomic(region_class())){
              region_class()
            } else {
              region_class()$region 
            }       

            temp_lat <- if (input$vol_region == 'Select region'){
              'Not Provided'
            } else {
              as.numeric(input$lat)
            }

            temp_lon <- if (input$vol_region == 'Select region'){
              'Not Provided'
            } else {
              as.numeric(input$lon)
            }

            general_params <- list(
              # -------------------Classification
              stream_class = classification(),
              region = temp_region,

              # precip = precip(),
              drain_area = input$user_DRNAREA,



              # -------------------General Site Information
              hp1 = file.path(tempdir(), "eph.jpg"),
              hp2 = file.path(tempdir(), "int.jpg"),
              hp3 = file.path(tempdir(), "per.jpg"),
              a = input$project,
              b = input$assessor,
              c = input$code,
              d = input$waterway,
              e = visit_date(),
              adj_regions = ifelse(alt_regions_str()=='', 'None', alt_regions_str()),
              bm = case_when(input$radio_weather == 'heavyrain' ~ "Storm/heavy rain",
                              input$radio_weather == 'steadyrain' ~ "Steady rain",
                              input$radio_weather == 'intermittentrain' ~ "Intermittent rain",
                              input$radio_weather == 'snowing' ~ "Snowing",
                              input$radio_weather == 'cloudy' ~ "Cloudy",
                              input$radio_weather == 'clearsunny' ~ "Clear/Sunny"),


              j = input$weather,
              g = temp_lat,
              h = temp_lon,
              notes_landuse = input$notes_landuse,
              l = plyr::mapvalues(
                      input$check_use,
                      from = c(
                      "urban","agricultural", "Developed open-space (e.g., golf course, parks, lawn grasses)",
                      "forested","othernatural","other"),
                      to = c(
                      "Urban, industrial, or residential", "Agricultural","Developed open-space",
                      "Forested","Other Natural","Other")
                  ) %>% as.character() %>% paste0(collapse = ", "),
              f = input$boundary,
              fff = ifelse(is.na(input$actreach), ' ', input$actreach),
              bn = plyr::mapvalues(
                  input$radio_situation,
                  from = c(
                  "flood","stream_modifications", "diversions",
                  "Water discharges","drought","vegetation",
                  "other","none"),
                  to = c(
                  "Recent flood or debris flow","Stream modifications (e.g., channelization)","Diversions",
                  "Water discharges","Drought","Vegetation removal/limitations",
                  "Other (explain in notes)","None")
              ) %>% as.character() %>% paste0(collapse = ", "),
              k = input$situation,

              # ------------------- Site Photos
              v = fig4(),
              u = fig3(),
              t = fig2(),
              s = fig1(),

              # ------------------- Observed Hydrology
              m = ifelse(is.na(input$surfflow), ' ', input$surfflow),
              n = ifelse(is.na(input$subflow), ' ', input$subflow),
              o = ifelse(is.na(input$pool), ' ', input$pool),
              r = input$notes_observed_hydrology,

              # ------------------- Site Sketch
              w = fig5(),

              # ------------------- Supplemental Information
              notes_supplemental_information = input$notes_supplemental_information,
              f48 = fig48(),
              f48_cap = input$add1_cap,
              f49 = fig49(),
              f49_cap = input$add2_cap,
              f50 = fig50(),
              f50_cap = input$add3_cap,
              f51 = fig51(),
              f51_cap = input$add4_cap,

              # ------------------- Mean bankfull width
              f52 = fig52(),
              f52_cap = input$mb1_cap,
              f53 = fig53(),
              f53_cap = input$mb2_cap,
              f54 = fig54(),
              f54_cap = input$mb3_cap,
              notes_mb = input$notes_mb
            )   

            if (temp_region == 'Arid West'){
                ## Arid West----
                
                        
                        ### Report----
                        tryCatch({
            
                            showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))
                            
            
                            # Set up parameters to pass to Rmd document
                            region_params <- list(
                                
                                ### ------------------- Biological indicators
                                # EPT Taxa
                                macro_check = input$macro_check,
                                aqua_inv = case_when(
                                  input$user_eph_isa == 0 ~ '0',
                                  input$user_eph_isa == 1 ~ "1 to 4",
                                  input$user_eph_isa == 2 ~ "5 to 9",
                                  input$user_eph_isa == 3 ~ "10 to 19",
                                  input$user_eph_isa == 4 ~ "Great than or equal to 20"
                                ),
                                f6 = fig6(),
                                f6_cap = input$inv1_cap,
                                f7 = fig7(),
                                f7_cap = input$inv2_cap,
                                f8 = fig8(),
                                f8_cap = input$inv3_cap,
                                f6_1 = fig6_1(),
                                f6_1cap = input$inv4_cap,
                                f7_1 = fig7_1(),
                                f7_1cap = input$inv5_cap,
                                f8_1 = fig8_1(),
                                f8_cap = input$inv6_cap,
                                notes_aquainv = input$notes_totalAbundance,

                                # Hydrophytes
                                hydro_check = input$hydro_check,
                                hydro = case_when(
                                  input$user_hydrophyte < 5 ~ as.character(input$user_hydrophyte),
                                  T ~ "Greater than or equal to 5"
                                ),
                                f24 = fig24(),
                                f24_cap = input$hydro1_cap,
                                f25 = fig25(),
                                f25_cap = input$hydro2_cap,
                                f26 = fig26(),
                                f26_cap = input$hydro3_cap,
                                f27 = fig27(),
                                f27_cap = input$hydro4_cap,
                                f28 = fig28(),
                                f28_cap = input$hydro5_cap,
                                f29 = fig29(),
                                f29_cap = input$hydro6_cap,
                                notes_hydro = input$notes_hydro,                       

                                # Upland Rooted
                                upland_rooted = case_when(
                                  input$user_upland_rooted == 0 ~ "0 (Poor)",
                                  input$user_upland_rooted == 0.5 ~ "0.5",
                                  input$user_upland_rooted == 1 ~ "1 (Weak)",
                                  input$user_upland_rooted == 1.5 ~ "1.5",
                                  input$user_upland_rooted == 2 ~ "2 (Moderate)",
                                  input$user_upland_rooted == 2.5 ~ "2.5",
                                  input$user_upland_rooted == 3 ~ "3 (Strong)"
                                ),

                                f45 = fig45(),
                                f45_cap = input$ur1_cap,
                                f46 = fig46(),
                                f46_cap = input$ur2_cap,
                                f47 = fig47(),
                                f47_cap = input$ur3_cap,
                                notes_rooted = input$notes_rooted,
                                
                                # Agal Cover
                                algal_cb = input$user_algal_cb,
                                algal = case_when(
                                  input$user_algal_cover == 0 ~ "Not Detected",
                                  input$user_algal_cover == 1 ~ "<2%",
                                  input$user_algal_cover == 2 ~ "2-10%",
                                  input$user_algal_cover == 3 ~ "10-40%",
                                  input$user_algal_cover == 4 ~ ">40%"
                                ),
                                f36 = fig36(),
                                f36_cap = input$algal1_cap,
                                f37 = fig37(),
                                f37_cap = input$algal2_cap,
                                f38 = fig38(),
                                f38_cap = input$algal3_cap,
                                notes_algal = input$notes_algal,

                                # Difference in Veg
                                vegetation = case_when(
                                  input$user_diff_veg == 0 ~ "0 (Poor)",
                                  input$user_diff_veg == 0.5 ~ "0.5",
                                  input$user_diff_veg == 1 ~ "1 (Weak)",
                                  input$user_diff_veg == 1.5 ~ "1.5",
                                  input$user_diff_veg == 2 ~ "2 (Moderate)",
                                  input$user_diff_veg == 2.5 ~ "2.5",
                                  input$user_diff_veg == 3 ~ "3 (Strong)"
                                ),
                                f15 = fig15(),
                                f15_cap = input$veg1_cap,
                                f16 = fig16(),
                                f16_cap = input$veg2_cap,
                                f17 = fig17(),
                                f17_cap = input$veg3_cap,
                                notes_vegetation = input$notes_veg,

                                # Slope
                                slope = input$user_slope,
                                f21 = fig21(),
                                f21_cap = input$slope1_cap,
                                f22 = fig22(),
                                f22_cap = input$slope2_cap,
                                f23 = fig23(),
                                f23_cap = input$slope3_cap,
                                notes_slope = input$notes_slope,

                                # Riffle Pool Sequence
                                riff = case_when(
                                  input$user_riff_pool == 0 ~ "0 (Poor)",
                                  input$user_riff_pool == 0.5 ~ "0.5",
                                  input$user_riff_pool == 1 ~ "1 (Weak)",
                                  input$user_riff_pool == 1.5 ~ "1.5",
                                  input$user_riff_pool == 2 ~ "2 (Moderate)",
                                  input$user_riff_pool == 2.5 ~ "2.5",
                                  input$user_riff_pool == 3 ~ "3 (Strong)"
                                ),
                                f42 = fig42(),
                                f42_cap = input$riff1_cap,
                                f43 = fig43(),
                                f43_cap = input$riff2_cap,
                                f44 = fig44(),
                                f44_cap = input$riff3_cap,
                                notes_riff = input$notes_riff,
                
                                # Bank Width
                                bankwidth = bank_mean()


                            )

                            params <- c(general_params, region_params)
            
                            tempReport <- "aw_report.qmd"
               
                            quarto::quarto_render(
                              tempReport,
                              output_format = "pdf",
                              execute_params = params
                            )

                            file.copy("aw_report.pdf", file, overwrite=TRUE)

                            removeModal()
                        },
                        warning = function(cond){
                            showModal(
                            modalDialog(
                                "There was an error while generating the report.
                              Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                                footer = modalButton("Ok")
                            )
                            )
                            return(NULL)
                        })

            } else if (temp_region == 'East'){
                # reserved for future final East SDAM

            } else if (temp_region == 'Great Plains'){
                ## Great Plains ----

                        tryCatch({
            
                            showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))

                            # Set up parameters to pass to Rmd document
                            region_params <- list(
                                
                                # ------------------- Biological indicators
                                # EPT Taxa
                                aqua_inv = case_when(
                                  input$user_total_abundance == 0 ~ '0',
                                  input$user_total_abundance == 1 ~ "1 to 9",
                                  input$user_total_abundance == 2 ~ "10 or greater9"
                                ),
                                f6 = fig6(),
                                f6_cap = input$inv1_cap,
                                f7 = fig7(),
                                f7_cap = input$inv2_cap,
                                f8 = fig8(),
                                f8_cap = input$inv3_cap,
                                f6_1 = fig6_1(),
                                f6_1cap = input$inv4_cap,
                                f7_1 = fig7_1(),
                                f7_1cap = input$inv5_cap,
                                f8_1 = fig8_1(),
                                f8_cap = input$inv6_cap,
                                notes_aquainv = input$notes_totalAbundance,

                                # Hydrophytes
                                hydro_check = input$hydro_check,
                                hydro = case_when(
                                  input$user_hydrophyte == 0 ~ 'Less than 2',
                                  T ~ "Greater than or equal to 2"
                                ),
                                f24 = fig24(),
                                f24_cap = input$hydro1_cap,
                                f25 = fig25(),
                                f25_cap = input$hydro2_cap,
                                f26 = fig26(),
                                f26_cap = input$hydro3_cap,
                                f27 = fig27(),
                                f27_cap = input$hydro4_cap,
                                f28 = fig28(),
                                f28_cap = input$hydro5_cap,
                                f29 = fig29(),
                                f29_cap = input$hydro6_cap,
                                notes_hydro = input$notes_hydro,                       

                                # Upland Rooted
                                upland_rooted = case_when(
                                  input$user_upland_rooted == 0 ~ "0 (Poor)",
                                  input$user_upland_rooted == 0.5 ~ "0.5",
                                  input$user_upland_rooted == 1 ~ "1 (Weak)",
                                  input$user_upland_rooted == 1.5 ~ "1.5",
                                  input$user_upland_rooted == 2 ~ "2 (Moderate)",
                                  input$user_upland_rooted == 2.5 ~ "2.5",
                                  input$user_upland_rooted == 3 ~ "3 (Strong)"
                                ),
                                f45 = fig45(),
                                f45_cap = input$ur1_cap,
                                f46 = fig46(),
                                f46_cap = input$ur2_cap,
                                f47 = fig47(),
                                f47_cap = input$ur3_cap,
                                notes_rooted = input$notes_rooted,

                                # Substrate
                                substrate = case_when(
                                  input$user_substrate == 0 ~ "0 (Weak)",
                                  input$user_substrate == 0.75 ~ "0.5",
                                  input$user_substrate == 1.5 ~ "1 (Moderate)",
                                  input$user_substrate == 2.25 ~ "2.25",
                                  input$user_substrate == 3 ~ "3 (Strong)"
                                ),
                                f12 = fig12(),
                                f12_cap = input$sub1_cap,
                                f13 = fig13(),
                                f13_cap = input$sub2_cap,
                                f14 = fig14(),
                                f14_cap = input$sub3_cap,
                                notes_sub = input$notes_sub,

                                # Difference in Veg
                                vegetation = case_when(
                                  input$user_diff_veg == 0 ~ "0 (Poor)",
                                  input$user_diff_veg == 0.5 ~ "0.5",
                                  input$user_diff_veg == 1 ~ "1 (Weak)",
                                  input$user_diff_veg == 1.5 ~ "1.5",
                                  input$user_diff_veg == 2 ~ "2 (Moderate)",
                                  input$user_diff_veg == 2.5 ~ "2.5",
                                  input$user_diff_veg == 3 ~ "3 (Strong)"
                                ),
                                f15 = fig15(),
                                f15_cap = input$veg1_cap,
                                f16 = fig16(),
                                f16_cap = input$veg2_cap,
                                f17 = fig17(),
                                f17_cap = input$veg3_cap,
                                notes_vegetation = input$notes_veg,

                                # Sediment on plants
                                sediment = case_when(
                                  input$user_sediment_plants == 0 ~ "0 (Poor)",
                                  input$user_sediment_plants == 0.25 ~ "0.25",
                                  input$user_sediment_plants == 0.5 ~ "0.5 (Weak)",
                                  input$user_sediment_plants == 0.75 ~ "0.75",
                                  input$user_sediment_plants == 1 ~ "1 (Moderate)",
                                  input$user_sediment_plants == 1.25 ~ "1.25",
                                  input$user_sediment_plants == 1.5 ~ "1.5 (Strong)"
                                ),
                                f18 = fig18(),
                                f18_cap = input$sed1_cap,
                                f19 = fig19(),
                                f19_cap = input$sed2_cap,
                                f20 = fig20(),
                                f20_cap = input$sed3_cap,
                                notes_sed = input$notes_sed,

                                # Riffle Pool Sequence
                                riff = case_when(
                                  input$user_riff_pool == 0 ~ "0 (Poor)",
                                  input$user_riff_pool == 0.5 ~ "0.5",
                                  input$user_riff_pool == 1 ~ "1 (Weak)",
                                  input$user_riff_pool == 1.5 ~ "1.5",
                                  input$user_riff_pool == 2 ~ "2 (Moderate)",
                                  input$user_riff_pool == 2.5 ~ "2.5",
                                  input$user_riff_pool == 3 ~ "3 (Strong)"
                                ),
                                f42 = fig42(),
                                f42_cap = input$riff1_cap,
                                f43 = fig43(),
                                f43_cap = input$riff2_cap,
                                f44 = fig44(),
                                f44_cap = input$riff3_cap,
                                notes_riff = input$notes_riff,
                
                                # Bank Width
                                bankwidth = bank_mean()


                            )
            
                            params <- c(general_params, region_params)
            
                            tempReport <- "gp_report.qmd"
               
                            quarto::quarto_render(
                              tempReport,
                              output_format = "pdf",
                              execute_params = params
                            )

                            file.copy("gp_report.pdf", file, overwrite=TRUE)

                            removeModal()
                        },
                        warning = function(cond){
                            showModal(
                            modalDialog(
                                "There was an error while generating the report.
                            Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                                footer = modalButton("Ok")
                            )
                            )
                            return(NULL)
                        })


            } else if (temp_region == 'Pacific Northwest'){
                ## Pacific Northwest----
                        tryCatch({
            
                            showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))

                            # Set up parameters to pass to Rmd document
                            region_params <- list(
                                cwidth = ifelse(is.na(input$cwidth), ' ', input$cwidth),
                                # cwidth = input$cwidth,
                                diff_site = input$diff_site,
                                diff_situation = input$diff_situation %>% as.character() %>% paste0(collapse = ", "),
                                precip_avg = input$precip_avg,

                                # -------------------Ancillary Info
                                notes_anc = input$notes_anc,
                                anc_rip = input$anc_rip,
                                anc_erosion = input$anc_erosion,
                                anc_fp = input$anc_fp,
                                disturbance = input$disturbance,
                                diff_other = input$diff_other,


                                # ------------------- Biological indicators
                                # EPT Taxa
                                aqua_inv = input$user_aquatic_presence,
                                ephem = input$user_ephemeroptera,
                                f6 = fig6(),
                                f6_cap = input$inv1_cap,
                                f7 = fig7(),
                                f7_cap = input$inv2_cap,
                                f8 = fig8(),
                                f8_cap = input$inv3_cap,
                                f6_1 = fig6_1(),
                                f6_1cap = input$inv4_cap,
                                f7_1 = fig7_1(),
                                f7_1cap = input$inv5_cap,
                                f8_1 = fig8_1(),
                                f8_cap = input$inv6_cap,
                                notes_aquainv = input$notes_totalAbundance,

                                # Hydrophytes
                                hydro = input$user_plants,
                                f24 = fig24(),
                                f24_cap = input$hydro1_cap,
                                f25 = fig25(),
                                f25_cap = input$hydro2_cap,
                                f26 = fig26(),
                                f26_cap = input$hydro3_cap,
                                f27 = fig27(),
                                f27_cap = input$hydro4_cap,
                                f28 = fig28(),
                                f28_cap = input$hydro5_cap,
                                f29 = fig29(),
                                f29_cap = input$hydro6_cap,
                                notes_hydro = input$notes_hydro,                       

                                # Perennial Taxa
                                per_taxa = input$user_per_taxa,
                                f33 = fig33(),
                                f33_cap = input$per1_cap,
                                f34 = fig34(),
                                f34_cap = input$per2_cap,
                                f35 = fig35(),
                                f35_cap = input$per3_cap,
                                notes_per = input$notes_per,

                                # Fish
                                fish = input$user_fish,
                                f30 = fig30(),
                                f30_cap = input$fish1_cap,
                                f31 = fig31(),
                                f31_cap = input$fish2_cap,
                                f32 = fig32(),
                                f32_cap = input$fish3_cap,
                                notes_fish = input$notes_fish,

                                # Amphibians
                                amphibians = input$user_amphibians,
                                f39 = fig39(),
                                f39_cap = input$amph1_cap,
                                f40 = fig40(),
                                f40_cap = input$amph2_cap,
                                f41 = fig41(),
                                f41_cap = input$amph3_cap,
                                notes_amph = input$notes_amph,

                                # Slope
                                slope = input$user_slope,
                                f21 = fig21(),
                                f21_cap = input$slope1_cap,
                                f22 = fig22(),
                                f22_cap = input$slope2_cap,
                                f23 = fig23(),
                                f23_cap = input$slope3_cap,
                                notes_slope = input$notes_slope


                            )

                            params <- c(general_params, region_params)
            
                            tempReport <- "pnw_report.qmd"
               
                            quarto::quarto_render(
                              tempReport,
                              output_format = "pdf",
                              execute_params = params
                            )

                            file.copy("pnw_report.pdf", file, overwrite=TRUE)

                            removeModal()
                        },
                        warning = function(cond){
                            showModal(
                            modalDialog(
                                "There was an error while generating the report.
                            Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                                footer = modalButton("Ok")
                            )
                            )
                            return(NULL)
                        })
            

            } else if (temp_region == 'Western Mountains'){
                ## Western Mountains----

                        tryCatch({
            
                            showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))

                            # Set up parameters to pass to Rmd document
                            region_params <- list(
                                
                                # ------------------- Biological indicators
                                # EPT Taxa
                                macro_check = input$macro_check,
                                aqua_inv = case_when(
                                  input$user_total_abundance == 0 ~ '0',
                                  input$user_total_abundance == 1 ~ "1 to 4",
                                  input$user_total_abundance == 2 ~ "5 to 9",
                                  input$user_total_abundance == 3 ~ "10 to 19",
                                  input$user_total_abundance == 4 ~ "Great than or equal to 20"
                                ),
                                f6 = fig6(),
                                f6_cap = input$inv1_cap,
                                f7 = fig7(),
                                f7_cap = input$inv2_cap,
                                f8 = fig8(),
                                f8_cap = input$inv3_cap,
                                f6_1 = fig6_1(),
                                f6_1cap = input$inv4_cap,
                                f7_1 = fig7_1(),
                                f7_1cap = input$inv5_cap,
                                f8_1 = fig8_1(),
                                f8_cap = input$inv6_cap,
                                notes_aquainv = input$notes_totalAbundance,

                                eph_isa = case_when(
                                  input$user_eph_isa == 0 ~ '0',
                                  input$user_eph_isa == 1 ~ "1 to 4",
                                  input$user_eph_isa == 2 ~ "5 to 9",
                                  input$user_eph_isa == 3 ~ "10 to 19",
                                  input$user_eph_isa == 4 ~ "Great than or equal to 20"
                                ),

                                # Hydrophytes
                                hydro_check = input$hydro_check,
                                hydro = case_when(
                                  input$user_hydrophyte < 5 ~ as.character(input$user_hydrophyte),
                                  T ~ "Greater than or equal to 5"
                                ),
                                f24 = fig24(),
                                f24_cap = input$hydro1_cap,
                                f25 = fig25(),
                                f25_cap = input$hydro2_cap,
                                f26 = fig26(),
                                f26_cap = input$hydro3_cap,
                                f27 = fig27(),
                                f27_cap = input$hydro4_cap,
                                f28 = fig28(),
                                f28_cap = input$hydro5_cap,
                                f29 = fig29(),
                                f29_cap = input$hydro6_cap,
                                notes_hydro = input$notes_hydro,                       

                                # Upland Rooted
                                upland_rooted = case_when(
                                  input$user_upland_rooted == 0 ~ "0 (Poor)",
                                  input$user_upland_rooted == 0.5 ~ "0.5",
                                  input$user_upland_rooted == 1 ~ "1 (Weak)",
                                  input$user_upland_rooted == 1.5 ~ "1.5",
                                  input$user_upland_rooted == 2 ~ "2 (Moderate)",
                                  input$user_upland_rooted == 2.5 ~ "2.5",
                                  input$user_upland_rooted == 3 ~ "3 (Strong)"
                                ),
                                f45 = fig45(),
                                f45_cap = input$ur1_cap,
                                f46 = fig46(),
                                f46_cap = input$ur2_cap,
                                f47 = fig47(),
                                f47_cap = input$ur3_cap,
                                notes_rooted = input$notes_rooted,

                                # Substrate
                                substrate = case_when(
                                  input$user_substrate == 0 ~ "0 (Weak)",
                                  input$user_substrate == 0.75 ~ "0.75",
                                  input$user_substrate == 1.5 ~ "1.5 (Moderate)",
                                  input$user_substrate == 2.25 ~ "2.25",
                                  input$user_substrate == 3 ~ "3 (Strong)"
                                ),
                                f12 = fig12(),
                                f12_cap = input$sub1_cap,
                                f13 = fig13(),
                                f13_cap = input$sub2_cap,
                                f14 = fig14(),
                                f14_cap = input$sub3_cap,
                                notes_sub = input$notes_sub,

                                # Difference in Veg
                                vegetation = case_when(
                                  input$user_diff_veg == 0 ~ "0 (Poor)",
                                  input$user_diff_veg == 0.5 ~ "0.5",
                                  input$user_diff_veg == 1 ~ "1 (Weak)",
                                  input$user_diff_veg == 1.5 ~ "1.5",
                                  input$user_diff_veg == 2 ~ "2 (Moderate)",
                                  input$user_diff_veg == 2.5 ~ "2.5",
                                  input$user_diff_veg == 3 ~ "3 (Strong)"
                                ),
                                f15 = fig15(),
                                f15_cap = input$veg1_cap,
                                f16 = fig16(),
                                f16_cap = input$veg2_cap,
                                f17 = fig17(),
                                f17_cap = input$veg3_cap,
                                notes_vegetation = input$notes_veg,

                                # Slope
                                slope = input$user_slope,
                                f21 = fig21(),
                                f21_cap = input$slope1_cap,
                                f22 = fig22(),
                                f22_cap = input$slope2_cap,
                                f23 = fig23(),
                                f23_cap = input$slope3_cap,
                                notes_slope = input$notes_slope,

                                # Shading
                                shade = input$user_shade,
                                f55 = fig55(),
                                f55_cap = input$shade1_cap,
                                f56 = fig56(),
                                f56_cap = input$shade2_cap,
                                f57 = fig57(),
                                f57_cap = input$shade3_cap,
                                f58 = fig58(),
                                f58_cap = input$shade4_cap,
                                notes_shade = input$notes_shade,

                                # Riffle Pool Sequence
                                riff = case_when(
                                  input$user_riff_pool == 0 ~ "0 (Poor)",
                                  input$user_riff_pool == 0.5 ~ "0.5",
                                  input$user_riff_pool == 1 ~ "1 (Weak)",
                                  input$user_riff_pool == 1.5 ~ "1.5",
                                  input$user_riff_pool == 2 ~ "2 (Moderate)",
                                  input$user_riff_pool == 2.5 ~ "2.5",
                                  input$user_riff_pool == 3 ~ "3 (Strong)"
                                ),
                                f42 = fig42(),
                                f42_cap = input$riff1_cap,
                                f43 = fig43(),
                                f43_cap = input$riff2_cap,
                                f44 = fig44(),
                                f44_cap = input$riff3_cap,
                                notes_riff = input$notes_riff,
                
                                # Bank Width
                                bankwidth = bank_mean()
                

                            )

                            params <- c(general_params, region_params)
            
                            tempReport <- "wm_report.qmd"
               
                            quarto::quarto_render(
                              tempReport,
                              output_format = "pdf",
                              execute_params = params
                            )

                            file.copy("wm_report.pdf", file, overwrite=TRUE)

                            removeModal()
                        },
                        warning = function(cond){
                            showModal(
                            modalDialog(
                                "There was an error while generating the report.
                            Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                                footer = modalButton("Ok")
                            )
                            )
                            return(NULL)
                        })
            }

        }

    )
}
## End server code

shinyApp(ui = ui, server = server)