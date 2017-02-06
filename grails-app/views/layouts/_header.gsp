<html>
<head>
    <title>Welcome to Product Mangement System</title>
</head>
<link rel="stylesheet" href="https://unpkg.com/purecss@0.6.2/build/pure-min.css" integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD" crossorigin="anonymous" />
<style>

body{
    font-size: 1em;
}
.main-wrapper{
    margin: 0 auto;
    padding: 10px;
    max-width: 60em;
}
    .custom-menu-wrapper{
        background: darkred;
        color: white;

    }
    .heading{
        clear: both;
        padding: 10px;
        text-align: center;
        font-size: 25px;
        text-transform: uppercase;
    }
    .menu {
        clear: both;
        display: flex;
    }
    .menu>ul>li{
        float: left;
        list-style: none;
        margin-right: 2px;
        position: relative;
    }
    .menu li ul
    {
        z-index: 2;
        display: none;
        list-style: none;
        position: absolute;
        top:30px;
        left: 0;
        width: 200px;
        padding: 0;
        margin: 0;
    }
    .menu li ul li{
        clear: both;
        display: flex;
    }
    .menu li:hover ul{
        display: inherit;
    }
    .menu a{
        text-decoration: none;
        color: #fff3f3;
        background-color: firebrick;
        width: 100%;
        padding: 10px;
    }
    .menu a:hover{
        background-color: #333333;
    }
    .logout{
        color: #fff3f3;
        float: right;
        font-size: 12px;
        text-decoration: none;
    }
        .logout a{
        color: #fff3f3;
        float: right;
        font-size: 12px;
    }
    table{
        padding: 5px;
        background-color: #eeeeee;
    }
    table td{
        padding: 5px;
    }
</style>
<body>
<div class="main-wrapper">
<div class="custom-menu-wrapper">
    <div class="heading">Welcome to Inventory Management System
        <g:if test="${session?.user}">
        <span class="logout">
            <div>Welcome ${session?.user?.fullName} </div>
            <div><g:link controller="user" action="logout"> Log Out</g:link></div>
        </span></g:if></div>
    <div class="menu">
        <ul>
            <li><g:link uri="/">Home</g:link></li>
        <li><g:link controller="user" action="list">Users</g:link>
            <g:if test="${session?.user?.admin}">
                <ul>
                    <li><g:link controller="user" action="create">Add a User</g:link> </li>
                </ul>
            </g:if></li>
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