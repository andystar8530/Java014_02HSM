<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>姻緣聚繪</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/show/showPartners.css">
<!-- CSS here -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/slicknav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/slick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/nice-select.css">
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show/style.css">	 --%>
	
<style>
	.my_btn{
		position: fixed;
		top:60px; /*距離上方 0 像素*/
 		z-index:55; /*重疊時會在其他元素之上*/	
 	
	}
	.partnerDiv{
 		background-image: url("${pageContext.request.contextPath}/images/bg20.jpg"); 
 		background-repeat: no-repeat; 
 		background-size:cover; 
 		background-attachment: fixed; 
	}
	.programDiv{
		background-image: url("${pageContext.request.contextPath}/images/bg5.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;
	}
	.portfolioDiv{
		background-image: url("${pageContext.request.contextPath}/images/bg4.jpg");
		background-repeat: no-repeat;
		background-size:cover;
		background-attachment: fixed;
	}
	.topBtn{
		width:60px;
		position: fixed;
		bottom:30px;
		right:5%;
 		z-index:55; /*重疊時會在其他元素之上*/
 		cursor: pointer;
    	drop-shadow: 12px 12px 7px rgba(0, 0, 0, 0.7);
	}

	#myInput {
	background-position: 10px 12px;
	background-repeat: no-repeat;
	background-size: 30px 30px;
	width: 50%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #f07167;
	border-radius:10px;
	margin-bottom: 12px;
	opacity:0.7;
	display:inline;
	
	}

#myUL {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

#myUL li a {
  border: 1px solid #f07167;
  margin-top: -1px; /* Prevent double borders */
  background-color: #f6f6f6;
  padding: 12px;
  text-decoration: none;
  font-size: 18px;
  color: black;
  display: block
}

#myUL li a:hover:not(.header) {
  background-color: #eee;
}

/* -------------------------------------- */

:root {
  --canvasColor: #f9f9f9;
}

body {
  background: var(--canvasColor);
  font-family: "Poppins", sans-serif;
  font-weight: 300;
  line-height: 1.5;
  font-size: 16px;
  text-align: center;
  transition: all .3s ease;
}

* {
  box-sizing: border-box;
}

main {
  --neutralShade1: #f2f2f2;
  --neutralShade2: #e8e9e9;
  --neutralShade3: #d1d3d4;
  --neutralShade4: #babdbf;
  --neutralShade5: #808488;
  --neutralShade6: #666a6d;
  --neutralShade7: #4d5052;
  --neutralShade8: #212122;
  --grayColor: #999;
  --lightGrayColor: #ddd;
  --borderRadius: 6px;
  --boxShadow: 0 2px 5px rgba(#333, 0.2);
}

/*overall layout*/
main {
  margin: 3em auto 8em;
  color: var(--foregroundColor);
  text-align: left;
}

/*colors*/
.palette {
  display: grid;
  grid: 80px 45px min-content/repeat(5, minmax(50px, 1fr));
  margin-bottom: 1em;
}
.palette__main {
  grid-column: span 5;
}
.palette h5 {
  grid-column: span 5;
  text-align: left;
  padding: 10px 0;
}
.palette.main div:nth-child(1) {
  background: var(--primaryColor);
}
.palette.main div:nth-child(2) {
  background: var(--primaryShade1);
}
.palette.main div:nth-child(3) {
  background: var(--primaryShade2);
}
.palette.main div:nth-child(4) {
  background: var(--primaryShade3);
}
.palette.main div:nth-child(5) {
  background: var(--primaryShade4);
}
.palette.main div:nth-child(6) {
  background: var(--primaryShade5);
}
.palette.secondary div:nth-child(1) {
  background: var(--secondaryColor);
}
.palette.secondary div:nth-child(2) {
  background: var(--secondaryShade1);
}
.palette.secondary div:nth-child(3) {
  background: var(--secondaryShade2);
}
.palette.secondary div:nth-child(4) {
  background: var(--secondaryShade3);
}
.palette.secondary div:nth-child(5) {
  background: var(--secondaryShade4);
}
.palette.secondary div:nth-child(6) {
  background: var(--secondaryShade5);
}
.palette.accent1 div:nth-child(1) {
  background: var(--accentColor);
}
.palette.accent1 div:nth-child(2) {
  background: var(--accentShade1);
}
.palette.accent1 div:nth-child(3) {
  background: var(--accentShade2);
}
.palette.accent1 div:nth-child(4) {
  background: var(--accentShade3);
}
.palette.accent1 div:nth-child(5) {
  background: var(--accentShade4);
}
.palette.accent1 div:nth-child(6) {
  background: var(--accentShade5);
}
.palette.accent2 div:nth-child(1) {
  background: var(--accent2Color);
}
.palette.accent2 div:nth-child(2) {
  background: var(--accent2Shade1);
}
.palette.accent2 div:nth-child(3) {
  background: var(--accent2Shade2);
}
.palette.accent2 div:nth-child(4) {
  background: var(--accent2Shade3);
}
.palette.accent2 div:nth-child(5) {
  background: var(--accent2Shade4);
}
.palette.accent2 div:nth-child(6) {
  background: var(--accent2Shade5);
}
.palette.accent3 div:nth-child(1) {
  background: var(--accent3Color);
}
.palette.accent3 div:nth-child(2) {
  background: var(--accent3Shade1);
}
.palette.accent3 div:nth-child(3) {
  background: var(--accent3Shade2);
}
.palette.accent3 div:nth-child(4) {
  background: var(--accent3Shade3);
}
.palette.accent3 div:nth-child(5) {
  background: var(--accent3Shade4);
}
.palette.accent3 div:nth-child(6) {
  background: var(--accent3Shade5);
}
.palette.neutrals {
  grid-template-rows: repeat(2, 50px) min-content;
  grid-template-columns: repeat(4, 1fr);
}
.palette.neutrals div:nth-child(1) {
  background: var(--neutralShade1);
}
.palette.neutrals div:nth-child(2) {
  background: var(--neutralShade2);
}
.palette.neutrals div:nth-child(3) {
  background: var(--neutralShade3);
}
.palette.neutrals div:nth-child(4) {
  background: var(--neutralShade4);
}
.palette.neutrals div:nth-child(5) {
  background: var(--neutralShade5);
  grid-row: 2;
}
.palette.neutrals div:nth-child(6) {
  background: var(--neutralShade6);
  grid-row: 2;
}
.palette.neutrals div:nth-child(7) {
  background: var(--neutralShade7);
  grid-row: 2;
}
.palette.neutrals div:nth-child(8) {
  background: var(--neutralShade8);
  grid-row: 2;
}

/*typography*/
strong {
  font-weight: 500;
}

em {
  font-style: italic;
}

h1 {
  font: 700 48px/1.2 "Poppins", sans-serif;
  margin-bottom: 10px;
}

h2 {
  font: 700 32px/1.2 "Poppins", sans-serif;
  margin-bottom: 10px;
}

h3 {
  font: 700 24px/1.2 "Poppins", sans-serif;
  margin-bottom: 10px;
}

h4 {
  font: 700 20px/1.2 "Poppins", sans-serif;
  margin-bottom: 10px;
}

h5 {
  font: 500 18px/1.2 "Poppins", sans-serif;
  margin-bottom: 10px;
}

h6 {
  font: 500 16px/1.2 "Poppins", sans-serif;
  text-transform: uppercase;
}

/*buttons & links*/
a.button {
  outline: none;
  width: 100%;
  text-align: center;
  display: inline-block;
  border: none;
  font: 500 16px/1 "Poppins", sans-serif;
  padding: 20px;
  cursor: pointer;
  border-radius: var(--borderRadius);
  background: var(--primaryColor); 
  color: var(--backgroundColor);
  position: relative;
  top: 0;
  transition: 0.2s ease;
}
a.button:hover, a.button.hover {
  top: -3px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
}
a.button:active, a.button.active {
  background: var(--primaryShade4);
/*   background: var(--primaryShade4); */
  outline: none;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
  top: 0;
}
a.button.disabled {
  opacity: 0.4;
  user-select: none;
  pointer-events: none;
}
a.button.medium {
  padding: 15px 18px;
  width: auto;
  margin-right: 20px;
  margin-bottom: 20px;
}
a.button.small {
  padding: 10px 12px;
  width: auto;
  font-size: 14px;
  font-weight: 500;
}
a.button.secondary {
  background: var(--secondaryColor);
}
a.button.secondary:active, a.button.secondary:focus, a.button.secondary.active {
  background: var(--secondaryShade4);
  outline: none;
}
a.button.accent {
  background: var(--accentColor);
}
a.button.accent:active, a.button.accent:focus, a.button.accent.active {
  background: var(--accentShade4);
}
a.button.accent2 {
  background: var(--accent2Color);
}
a.button.accent2:active, a.button.accent2:focus, a.button.accent2.active {
  background: var(--accent2Shade4);
}
a.button.accent3 {
  background: var(--accent3Color);
}
a.button.accent3:active, a.button.accent3:focus, a.button.accent3.active {
  background: var(--accent3Shade4);
}

/*variations*/
input.variation {
  display: none;
}
input.variation + label {
  display: inline-block;
  width: 50px;
  height: 50px;
  margin: 70px 20px 20px;
  border-radius: 50%;
  cursor: pointer;
  border: 6px solid #fff;
  box-shadow: 0 0 4px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.2);
}

#bluepurple + label {
  background: linear-gradient(to left, #673ab7 50%, #03a9f4 50%);
}
#bluepurple:checked ~ main {
  --backgroundColor: #fff;
  --foregroundColor: #111;
  --primaryColor: #03a9f4;
  --primaryShade1: #e1f5fe;
  --primaryShade2: #b3e5fc;
  --primaryShade3: #4fc3f7;
  --primaryShade4: #0288d1;
  --primaryShade5: #0277bd;
  --secondaryColor: #673ab7;
  --secondaryShade1: #ede7f6;
  --secondaryShade2: #d1c4e9;
  --secondaryShade3: #9575cd;
  --secondaryShade4: #512da8;
  --secondaryShade5: #311b92;
  --accentColor: #009688;
  --accentShade1: #e0f2f1;
  --accentShade2: #b2dfdb;
  --accentShade3: #4db6ac;
  --accentShade4: #00796b;
  --accentShade5: #004d40;
  --accent2Color: #8bc34a;
  --accent2Shade1: #e7f6d5;
  --accent2Shade2: #c5e1a5;
  --accent2Shade3: #aed581;
  --accent2Shade4: #689f38;
  --accent2Shade5: #558b2f;
  --accent3Color: #f44336;
  --accent3Shade1: #ffdde0;
  --accent3Shade2: #ffcdd2;
  --accent3Shade3: #ef9a9a;
  --accent3Shade4: #d32f2f;
  --accent3Shade5: #b71c1c;
}

#sunset + label {
  background: linear-gradient(to right, #ff9557 50%, #ffcc67 50%);
}
#sunset:checked ~ main {
  --canvasColor: #f9f9f9;
  --backgroundColor: #fff;
  --foregroundColor: #111;
  --primaryColor: #ff9557;
  --primaryShade1: #ffe2d1;
  --primaryShade2: #ffceb2;
  --primaryShade3: #ffb184;
  --primaryShade4: #e88850;
  --primaryShade5: #d17a48;
  --secondaryColor: #ffcc67;
  --secondaryShade1: #fff1d5;
  --secondaryShade2: #ffde9e;
  --secondaryShade3: #ffd074;
  --secondaryShade4: #e8ba5e;
  --secondaryShade5: #ba954b;
  --accentColor: #4e5166;
  --accentShade1: #cecfd5;
  --accentShade2: #aeafb9;
  --accentShade3: #8e909d;
  --accentShade4: #6e7081;
  --accentShade5: #404354;
  --accent2Color: #588b8b;
  --accent2Shade1: #c2d4d4;
  --accent2Shade2: #a3bfbf;
  --accent2Shade3: #85aaaa;
  --accent2Shade4: #507f7f;
  --accent2Shade5: #497272;
  --accent3Color: #fe5f55;
  --accent3Shade1: #fec4c1;
  --accent3Shade2: #fea7a2;
  --accent3Shade3: #fe7c73;
  --accent3Shade4: #e7574e;
  --accent3Shade5: #b9463e;
}

#godiva + label {
  background: linear-gradient(to right, #a05793 50%, #a3d858 50%);
}
#godiva:checked ~ main {
  --canvasColor: #f9f9f9;
  --backgroundColor: #fff;
  --foregroundColor: #111;
  --primaryColor: #a05793;
  --primaryShade1: #e5d1e1;
  --primaryShade2: #d3b2cd;
  --primaryShade3: #b984b0;
  --primaryShade4: #925086;
  --primaryShade5: #834879;
  --secondaryColor: #a3d858;
  --secondaryShade1: #e5f4d1;
  --secondaryShade2: #cce9a3;
  --secondaryShade3: #bce285;
  --secondaryShade4: #95c550;
  --secondaryShade5: #779e41;
  --accentColor: #245e71;
  --accentShade1: #d7e1e5;
  --accentShade2: #afc4cb;
  --accentShade3: #7398a4;
  --accentShade4: #4b7b8a;
  --accentShade5: #1e4d5d;
  --accent2Color: #2aa5a1;
  --accent2Shade1: #d8eeed;
  --accent2Shade2: #9ed6d4;
  --accent2Shade3: #64bdba;
  --accent2Shade4: #279693;
  --accent2Shade5: #1f7976;
  --accent3Color: #92374d;
  --accent3Shade1: #ebdad3;
  --accent3Shade2: #cda4ae;
  --accent3Shade3: #af6d7d;
  --accent3Shade4: #853246;
  --accent3Shade5: #6b2939;
}

#dark + label {
  background: linear-gradient(to right, #367bc3 50%, #38bfa7 50%);
}
#dark:checked ~ main {
  --canvasColor: #2a313b;
  --backgroundColor: #2a313b;
  --foregroundColor: #ebe8d8;
  --primaryColor: #367bc3;
  --primaryShade5: #b5cfe9;
  --primaryShade4: #91b7de;
  --primaryShade3: #5a93cd;
  --primaryShade2: #3270b2;
  --primaryShade1: #285a8e;
  --secondaryColor: #38bfa7;
  --secondaryShade5: #c8ede7;
  --secondaryShade4: #92dccf;
  --secondaryShade3: #6ed0be;
  --secondaryShade2: #33ae98;
  --secondaryShade1: #2e9d89;
  --accentColor: #586994;
  --accentShade5: #d1d6e1;
  --accentShade4: #a3adc4;
  --accentShade3: #7684a7;
  --accentShade2: #49567a;
  --accentShade1: #39435f;
  --accent2Color: #8fe1a2;
  --accent2Shade5: #d6f4dd;
  --accent2Shade4: #c1eecc;
  --accent2Shade3: #a3e6b2;
  --accent2Shade2: #82cd94;
  --accent2Shade1: #76b985;
  --accent3Color: #fe938c;
  --accent3Shade5: #fee1df;
  --accent3Shade4: #fec4c0;
  --accent3Shade3: #fea6a0;
  --accent3Shade2: #e78680;
  --accent3Shade1: #b96b66;
  color: #f1f2eb;
  border-color: #f1f2eb;
}
#dark:checked ~ main > section {
  border-color: #f1f2eb;
}
#dark:checked ~ main > section > h6 {
  color: #f1f2eb;
}

#pinkaru + label {
  background: linear-gradient(to right, #f95794 50%, #323da5 50%);
}
#pinkaru:checked ~ main {
  border-color: #fff;
  --canvasColor: #2a313b;
  --backgroundColor: #2a313b;
  --foregroundColor: #e3f2fd;
  --primaryColor: #f95794;
  --primaryShade5: #fdd1e1;
  --primaryShade4: #fba3c4;
  --primaryShade3: #fa75a7;
  --primaryShade2: #e35087;
  --primaryShade1: #b6406c;
  --secondaryColor: #323da5;
  --secondaryShade5: #c7cae6;
  --secondaryShade4: #8f95cd;
  --secondaryShade3: #6971bd;
  --secondaryShade2: #2e3896;
  --secondaryShade1: #293288;
  --accentColor: #FFC729;
  --accentShade5: #ffefc4;
  --accentShade4: #ffe08a;
  --accentShade3: #ffd14f;
  --accentShade2: #e8b526;
  --accentShade1: #d1a322;
  --accent2Color: #53dd6c;
  --accent2Shade5: #d0f5d6;
  --accent2Shade4: #a1ecae;
  --accent2Shade3: #72e386;
  --accent2Shade2: #4cc963;
  --accent2Shade1: #3da14f;
  --accent3Color: #f52f57;
  --accent3Shade5: #fcc6d1;
  --accent3Shade4: #f98da3;
  --accent3Shade3: #f65475;
  --accent3Shade2: #df2b50;
  --accent3Shade1: #b32340;
}
#pinkaru:checked ~ main > section {
  border-color: #fff;
}
#pinkaru:checked ~ main > section > h6 {
  color: #fff;
}


.profile {
  position: relative;
  background: #fff;
/*   background: var(--backgroundColor); */
  color: var(--foregroundColor);
  box-shadow: 0 3px 15px rgba(51, 51, 51, 0.2);
  border-radius: 10px;
  transition: .2s ease;
  opacity:0.9;
}
.profile__image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.profile__stats__title {
  color: var(--grayColor);
  text-transform: uppercase;
  font-size: 16px;
}
.profile a:hover {
  top: 0;
  box-shadow: none;
  background: var(--primaryShade4);
}
.profile a:active, .profile a:focus {
  top: 0;
  box-shadow: none;
  background: var(--primaryShade5);
}

.profile-default {
  min-width: 400px;
  max-width: 450px;
  margin: auto;
  overflow: hidden;
  display: grid;
  grid: 340px auto auto/repeat(3, minmax(80px, 1fr));
  grid-gap: 10px;
}
.profile-default .profile__image {
  grid-column: span 3;
}
.profile-default .profile__image img {
  border-bottom: 7px solid var(--secondaryColor);
}
.profile-default .profile__info {
  grid-column: span 3;
  margin: 20px 25px 0;
}
.profile-default .profile__stats {
  margin: 5px 25px;
}
.profile-default .profile__cta {
  grid-column: span 3;
  margin: 0 25px 25px;
}

.profile-smallimg {
  width: 300px;
  border-radius: 10px;
  text-align: center;
  display: grid;
  grid-template-columns: 1fr;
  grid-gap: 10px;
  text-align: center;
}
.profile-smallimg .profile__image {
  margin-top: -40px;
}
.profile-smallimg .profile__image img {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  border: 5px solid var(--backgroundColor);
  box-shadow: 0 0 0 7px var(--secondaryColor);
}
.profile-smallimg .profile__info {
  margin: 10px 30px 15px;
}
.profile-smallimg .profile__stats {
  margin: 0 30px 10px;
}
.profile-smallimg .profile__stats:nth-of-type(n+4) {
  display: none;
}
.profile-smallimg .profile__cta a {
  border-radius: 0 0 10px 10px;
}

.profile-long {
  display: grid;
  grid-template-columns: repeat(4, 1fr) 100px;
  padding: 20px 20px 15px;
  min-width: 570px;
}
.profile-long .profile__image {
  grid-column: 5 / 6;
  margin-bottom: 10px;
}
.profile-long .profile__image img {
  border-radius: 50%;
  width: 100px;
  height: 100px;
}
.profile-long .profile__info {
  grid-column: 1 / 5;
  grid-row: 1;
  padding: 5px 20px 20px 0;
}
.profile-long .profile__stats {
  min-width: 100px;
  padding-top: 20px;
  border-top: 0.5px solid var(--grayColor);
}
.profile-long .profile__cta {
  grid-column: span 2;
  border-top: 0.5px solid var(--grayColor);
  padding-top: 15px;
}

.profile-table {
  display: grid;
  max-width: 780px;
  grid-template-columns: 100px 1fr auto;
  grid-auto-flow: dense;
  overflow: hidden;
}
.profile-table .profile__image {
  grid-column: 1;
}
.profile-table .profile__stats {
  display: none;
}
.profile-table .profile__info {
  grid-column: 2 / 5;
  padding: 20px 15px 20px 20px;
}
.profile-table .profile__cta {
  grid-column: 5 / 6;
  align-self: center;
  padding-right: 25px;
}

.profile-wide {
  display: grid;
  grid-template-columns: auto repeat(3, 1fr);
  grid-auto-flow: dense;
  min-width: 500px;
  max-width: 590px;
}
.profile-wide .profile__image {
  padding: 30px 20px 20px;
  grid-row: 1 / 3;
}
.profile-wide .profile__image img {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  border: 3px solid var(--backgroundColor);
  box-shadow: 0 0 0 4px var(--secondaryColor);
}
.profile-wide .profile__stats {
  margin-bottom: 12px;
}
.profile-wide .profile__info {
  grid-column: span 3;
  padding: 25px 25px 15px 0;
}
.profile-wide .profile__cta {
  grid-column: span 4;
}
.profile-wide .profile__cta a {
  border-radius: 0 0 10px 10px;
}

.profile-imgonly {
  border-radius: 10px;
  overflow: hidden;
  width: 300px;
  display: grid;
  grid: 390px 0px / 100%;
}
.profile-imgonly:hover {
  grid: 334px 56px / 100%;
}
.profile-imgonly .profile__image, .profile-imgonly .profile__info {
  grid-row: 1 / 2;
  grid-column: 1 / 2;
}
.profile-imgonly .profile__image {
  position: relative;
}
.profile-imgonly .profile__image:after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 30%;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0));
}
.profile-imgonly .profile__stats {
  display: none;
}
.profile-imgonly .profile__info {
  z-index: 5;
  grid-row: 1 / 2;
  align-self: end;
  margin: 10px 20px;
  color: #fff;
  text-shadow: 0 1px 4px rgba(0, 0, 0, 0.2);
}
.profile-imgonly .profile__info p {
  display: none;
}
.profile-imgonly .profile__cta a {
  border-radius: 0;
}

.profile-bigimg {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 400px auto 0px;
  border-radius: 10px;
  width: 650px;
  overflow: hidden;
  margin: auto;
}
.profile-bigimg .profile__image {
  grid-column: span 3;
}
.profile-bigimg .profile__info {
  grid-column: span 2;
  align-self: center;
  padding: 20px 10px 20px 25px;
}
.profile-bigimg .profile__info h3 {
  margin-bottom: 0;
}
.profile-bigimg .profile__info__extra {
  max-height: 0;
  overflow: hidden;
  opacity: 0;
  transition: max-height .3s ease, opacity .3s ease .3s, margin .3s ease;
}
.profile-bigimg .profile__stats {
  display: none;
}
.profile-bigimg .profile__cta {
  padding: 20px 20px 20px 0;
  align-self: center;
}
.profile-bigimg:hover .profile__info__extra {
  display: block;
  max-height: 200px;
  margin: 10px 0 0;
  opacity: 1;
}

main {
  display: grid;
  grid-gap: 30px;
  grid-template-columns: repeat(6, auto);
  grid-template-rows: repeat(4, auto);
  width: 550px;
  justify-content: center;
}

section:nth-child(1) {
  grid-column: 1 / 3;
  justify-self: end;
  align-self: end;
}
section:nth-child(2) {
  grid-column: 3 / 5;
}
section:nth-child(3) {
  grid-column: 5 / 7;
  align-self: end;
}
section:nth-child(4) {
  grid-column: 1 / 7;
  justify-self: center;
}
section:nth-child(5) {
  grid-column: 1 / 4;
  justify-self: end;
}
section:nth-child(6) {
  grid-column: 4 / 7;
  align-self: center;
}
section:nth-child(7) {
  grid-column: 1 / 7;
}

#dark:checked ~ main a.button,
#pinkaru:checked ~ main a.button {
  color: var(--foregroundColor);
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}
#dark:checked ~ main .button:hover,
#pinkaru:checked ~ main .button:hover {
  background: var(--primaryShade2);
}
#dark:checked ~ main .button:active,
#pinkaru:checked ~ main .button:active {
  background: var(--primaryShade1);
}
#dark:checked ~ main .profile-default img,
#pinkaru:checked ~ main .profile-default img {
  border-bottom: 7px solid var(--secondaryShade5);
}
#dark:checked ~ main .profile-smallimg img,
#pinkaru:checked ~ main .profile-smallimg img {
  box-shadow: 0 0 0 7px var(--secondaryShade5);
}
#dark:checked ~ main .profile-wide img,
#pinkaru:checked ~ main .profile-wide img {
  box-shadow: 0 0 0 4px var(--secondaryShade5);
}

</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />

<div class='my_btn'>
	<a type="button" class="btn btn-outline-danger" href="#aa">找店家</a>
	<a type="button" class="btn btn-outline-danger" href="#bb">找方案</a>
	<a type="button" class="btn btn-outline-danger" href="#cc">找作品</a>
<!-- 	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name" -->
<%-- 		style='background-image: url("${pageContext.request.contextPath}/data/icon/search-user.png") ; '> --%>
</div>

<div class='partnerDiv'>
<h2 class='text-center p-3 display-4 text-light' id="aa" >店家一覽</h2>
	<div class='container'>
	<div class='row justify-content-center'>
		
		
		<c:forEach var='partnerBean' items="${pbList}" end='3'>
		
		<div class="profile profile-wide col-4 mx-2 my-2">
              <div class="profile__image"><img src="<c:url value='/getPartnerCoverImage/${partnerBean.p_id}'/>" alt="Doggo"/></div>
              <div class="profile__info">
                <h3>${partnerBean.p_storeName}</h3>
                <p class="profile__info__extra JQellipsis">${partnerBean.p_info}</p>
              </div>
              <div class="profile__stats">
                <p class="profile__stats__title">Service</p>
                <h5 class="profile__stats__info">${partnerBean.p_service}</h5>
              </div>
              <div class="profile__stats">
                <p class="profile__stats__title">Area</p>
                <h5><c:choose>
   				 		<c:when test="${partnerBean.p_area == 1}">
        				北部
    					</c:when>
    					<c:when test="${partnerBean.p_area == 2}">
     					中部
	  					 </c:when>
	  					<c:when test="${partnerBean.p_area == 3}">
	        			南部
	    				</c:when>
	    				<c:when test="${partnerBean.p_area == 4}">
	     				東部
	  					  </c:when>	   	
	    				<c:otherwise>
	       				離島
	    				</c:otherwise>
					</c:choose>
				</h5>
              </div>
              <div class="profile__stats">
                <p class="profile__stats__title">Review</p>
                <h5 class="profile__stats__info">${partnerBean.p_review}
                	
                	
                </h5>
              </div>
              <div class="profile__cta"><a class="button" href="<c:url value='/showPartnerDetail/${partnerBean.p_id}'/>">More</a></div>
            </div>
		
		
		
		
		
		
<!-- 			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3 ' > -->
<!-- 				<div class="card shadow border-info"> -->
<%-- 				  <img src="<c:url value='/getPartnerStampImage/${partnerBean.p_id}'/>" class="card-img-top" alt="..."> --%>
<!-- 				  <div class="card-body"> -->
<%-- 				    <h5 class="card-title" id="${partnerBean.p_storeName}" >${partnerBean.p_storeName}</h5> --%>
<%-- 				    <p class="card-text">${partnerBean.p_service}</p> --%>
<%-- 				    <p class="card-text">${partnerBean.p_info}</p> --%>
<%-- 				    <a href="<c:url value='/showPartnerDetail/${partnerBean.p_id}'/>" class="btn btn-primary">查看店家</a> --%>
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</c:forEach>
		</div>
	</div>
</div>
<div class='programDiv'>	
<h2 class='text-center p-5 text-light display-4' id="bb" >方案一覽</h2>
<div class='container'>


	<div class='row col-12 justify-content-center ml-3'>
	
		<c:forEach var='programBean' items="${programList}" end='7'>
		<div class=" col-lg-3  col-md-4 col-12">
			<article class="my-card card--1 mb-5" style='background-image: url("${pageContext.request.contextPath}/_06_Program/getProgramImage/${programBean.prm_Id}")'>
        
				<div class="card__img" style='background-image: url("${pageContext.request.contextPath}/_06_Program/getProgramImage/${programBean.prm_Id}")'></div>
				<a href="<c:url value='/_06_Program/ProgramDetail/${programBean.prm_Id}'/>" class="card_link">
				   <div class="card__img--hover" style='background-image: url("${pageContext.request.contextPath}/_06_Program/getProgramImage/${programBean.prm_Id}")'></div>
				 </a>
				 
				<div class="card__info">
				  <span class="card__category">類別:${programBean.prm_Category}</span>
				  <h4 class="card__title">${programBean.prm_Title}</h4>
				  <span class="card__by"><a href="<c:url value='/_06_Program/ProgramDetail/${programBean.prm_Id}'/>" class="card__author" title="author">價錢:${programBean.prm_Price}</a></span>
				</div>
			  </article>
		</div>
			
			<!-- <div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'>
				<div class="card shadow border-info">
				  <img src="<c:url value='/_06_Program/getProgramImage/${programBean.prm_Id}'/>"  class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">${programBean.prm_Title}</h5>
				    <p class="card-text">${programBean.prm_Content}</p>
				    <p class="card-text">${programBean.prm_Price}</p>
				    <a href="<c:url value='/_06_Program/ProgramDetail/${programBean.prm_Id}'/>" class="btn btn-primary">詳細內容</a>
				  </div>
				</div>
			</div> -->
		</c:forEach>
	</div>	
</div>	
</div>
<div class=''>
<!--  <h2 class='text-center p-3' id="cc">作品集一覽</h2> -->
<!-- 	<div class='row ml-5 mr-5 col-9 mx-auto'> -->
	
<%-- 		<c:forEach var='portfoliosBean' items="${portfolioList}" end='7'> --%>
<!-- 			<div class='col-lg-3 col-sm-6 col-12 mb-3 mt-3'> -->
<!-- 				<div class="card shadow border-info"> -->
<%-- 				  <img src="<c:url value='/getPFCoverImage/${portfoliosBean.pfmId}'/>" class="card-img-top" alt="..."> --%>
<!-- 				  <div class="card-body"> -->
<%-- 				    <h5 class="card-title">${portfoliosBean.pfmName}</h5> --%>
<%-- 				    <p class="card-text">${portfoliosBean.pfmInfo}</p> --%>
<%-- 				    <p class="card-text">${portfoliosBean.partnerBean.p_storeName}</p> --%>
<%-- 				    <a href="<spring:url value='/portfolio?pfmId=${portfoliosBean.pfmId}' />" class="btn btn-primary">Go somewhere</a> --%>
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 		</c:forEach> --%>
<!-- 	</div>	 --> 
	        <!-- our Memories start -->
			<div class=" portfolioDiv our-memories-area">
				<div class="container">
					<!-- section tittle -->
					<div class="row ">
						<div class="col-lg-12">
							<div class="section-tittle text-center">
								<img src="assets/img/memories/section_tittle_flowre.png" alt="">
								<h2 class='text-center p-2' id="cc" >作品集一覽</h2>
							</div>
						</div>
					</div>
					<div class="row no-gutters">
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="${pageContext.request.contextPath}/images/show/show8-min.jpg" alt="">
									<div class="menorie-icon" href="${pageContext.request.contextPath}/images/show/show8-min.jpg">
										<i class="fas fa-plus"></i>
									</div>
								</div>
							</div>
						</div> 
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="${pageContext.request.contextPath}/images/show/show6-min.jpg" alt="">
									<div class="menorie-icon" href="${pageContext.request.contextPath}/images/show/show6-min.jpg">
										<i class="fas fa-plus"></i>
									</div>
								</div>
							</div>
						</div> 
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="${pageContext.request.contextPath}/images/show/show7-min.jpg" alt="">
									<div class="menorie-icon" href="${pageContext.request.contextPath}/images/show/show7-min.jpg">
										<i class="fas fa-plus"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="${pageContext.request.contextPath}/images/show/show2-min.jpg" alt="">
									<div class="menorie-icon" href="${pageContext.request.contextPath}/images/show/show2-min.jpg">
										<i class="fas fa-plus"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="${pageContext.request.contextPath}/images/show/show7-min.jpg" alt="">
									<div class="menorie-icon" href="${pageContext.request.contextPath}/images/show/show7-min.jpg">
										<i class="fas fa-plus"></i>
									</div>
								</div>
							</div>
						</div>   
						<div class="col-lg-4 col-md-4">
							<div class="memory">
								<div class="memories-img">
									<img src="${pageContext.request.contextPath}/images/show/show9-min.jpg" alt="">
									<div class="menorie-icon" href="${pageContext.request.contextPath}/images/show/show9-min.jpg">
										<i class="fas fa-plus"></i>
									</div>
								</div>
							</div>
						</div> 
						
					</div>
				</div>
				<!-- Shape Img -->
				<div class="memories-shape d-none d-xl-block">
<!-- 					<img src="assets/img/memories/left-img.png" class="memories-shape1" alt=""> -->
<!-- 					<img src="assets/img/memories/right-img.png" class="memories-shape2" alt=""> -->
				</div>
			</div>
</div>	

	<img src="<c:url value='/data/icon/up-arrow.png'/> " class='topBtn' id="topBtn">
	<jsp:include page="/fragment/footerMVC.jsp" />
	<script>
		$(".my_btn > a").click(function(e){
			$(".my_btn > a").removeClass("selected");
			$(this).addClass("selected");

			var id = $(this).attr("href");
			var y = $(id).offset().top - 100;
		
			$("body").stop().animate({scrollTop:y},2000);
		})
		$("#topBtn").click(function(e){
			$("body").animate({scrollTop:70},2000);
		})
		
		
		$(function () {

		var $win = $(window);

		var $topBtn = $('.topBtn');

	// 當用戶滾動到離頂部100像素時，展示回到頂部按鈕

		$win.scroll(function () {

			if ($win.scrollTop() > 100) {

			$topBtn.show();

			} else {

			$topBtn.hide();

			}

			});

			// 當用戶點擊按鈕時，通過動畫效果返回頭部

			$topBtn.click(function () {

			$('html, body').animate({scrollTop: 0}, 1500);

				});

});

// $(document).ready(function () {
// 	var programImageSrc = "http://localhost:8080/Java014_02HSM/_06_Program/getProgramImage/${programBean.prm_Id} />" ;
// 	$('.card--1').css({'background-image': 'url(' + programImageSrc + ')'});
//  	$('.card--1').css("background-image","url(" + programImageSrc + ")");
//  	$('.card__img').css("background-image",url(' + programImageSrc + '));
//  	$('.card__img--hover').css("background-image",url(' + programImageSrc + '));
//  	$('.card--1--hover').css("background-image",url(' + programImageSrc + '));
// });

function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
</script>
	<!-- ---------------------------分隔線---------------------------------------			 -->
<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="${pageContext.request.contextPath}/js/show/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="${pageContext.request.contextPath}/js/show/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/show/popper.min.js"></script>
<%--         <script src="${pageContext.request.contextPath}/js/show/bootstrap.min.js"></script> --%>
	    <!-- Jquery Mobile Menu -->
        <script src="${pageContext.request.contextPath}/js/show/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="${pageContext.request.contextPath}/js/show/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/show/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="${pageContext.request.contextPath}/js/show/gijgo.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="${pageContext.request.contextPath}/js/show/wow.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/show/animated.headline.js"></script>
        <script src="${pageContext.request.contextPath}/js/show/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="${pageContext.request.contextPath}/js/show/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/show/jquery.nice-select.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/show//jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="${pageContext.request.contextPath}/js/show/contact.js"></script>
        <script src="${pageContext.request.contextPath}/js/show/jquery.form.js"></script>
        <script src="${pageContext.request.contextPath}/js/show/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/show/mail-script.js"></script>
        <script src="${pageContext.request.contextPath}/js/show/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${pageContext.request.contextPath}/js/show/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/js/show/main.js"></script>
        <script>
//         如果字數太多，用...取代
		$(function() {
			var len = 40;
			$(".JQellipsis").each(function(i) {
				if ($(this).text().length > len) {
					$(this).attr("title", $(this).text());
					var text = $(this).text().substring(0, len - 1) + "...";
					$(this).text(text);
				}
			});
		});
	</script>
        
</body>
</html>