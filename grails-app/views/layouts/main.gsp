<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<g:layoutHead/>
		<g:javascript library="application"/>
		<r:layoutResources />
	</head>
	<body>
	<div class="main-wrapper">
		<div class="custom-menu-wrapper">
			<div class="heading">Welcome to Inventory Management System
				<sec:ifLoggedIn>
					<sec:ifAllGranted roles="ROLE_ADMIN">
					<span class="logout">
						<div>Welcome ${session?.user?.fullName} </div>
						<div><g:link controller="user" action="logout"> Log Out</g:link></div>
					</span></sec:ifAllGranted></sec:ifLoggedIn></div>
			<div class="menu">
				<ul>
					<li><g:link uri="/">Home</g:link></li>
					<li><g:link controller="user" action="list">Users</g:link>
						<sec:ifLoggedIn>
							<sec:ifAllGranted roles="ROLE_ADMIN">
							<ul>
								<li><g:link controller="user" action="create">Add a User</g:link> </li>
							</ul>
							</sec:ifAllGranted>
						</sec:ifLoggedIn></li>
					<li><g:link controller="item" action="list">Items</g:link><ul>
						<li><g:link controller="item" action="create">Add an Item</g:link> </li>
						<li><g:link controller="category" action="list">Item Category</g:link></li>
						<li><g:link controller="category" action="create">Add a Category</g:link></li>
					</ul>
					</li>
					<li><g:link controller="user" action="edit" id="${session?.user?.id}">My Account</g:link></li>
				</ul>
			</div>
		</div>
		<div class="main">
		<g:layoutBody/>
		</div>
		<div>Copyright all rights reserved</div>
	</div>
	</body>
</html>
