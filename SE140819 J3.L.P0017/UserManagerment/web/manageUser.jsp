<%-- 
    Document   : managerUser
    Created on : Jun 28, 2021, 20:17:43 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Edit Profile User</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/manage.css">
    </head>
    <body>
          <style>
            body{
            background: #1dbf73;
                }
        </style>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10 col-xl-10 mx-auto">
                    <font color="white"><h2>USER PAGE</h2></font>

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link btn-primary" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-primary" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Promotion</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                            <form action="update" method="POST">
                                <div class="row mt-5 align-items-center">
                                    <div class="col-md-3 text-center mb-5">
                                        <div class="avatar avatar-xl">
                                            <img src="${sessionScope.ManageUser.photo}" alt="..." />
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-4" />
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <font color="white"><label for="UserName" >User Name</label></font>
                                        <input type="text" id="UserName" name="txtUserName" class="form-control" value="${sessionScope.ManageUser.userName}" required="true"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <font color="white"><label for="Phone">Phone</label></font>
                                        <input type="text" id="Phone" class="form-control" name="txtPhone" value="${sessionScope.ManageUser.phone}" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <font color="white"><label for="inputEmail4">Email</label></font>
                                    <input  type="text" class="form-control" id="inputEmail4" name="txtEmail" value="${sessionScope.ManageUser.email}" required="true" />
                                </div>
                                <div class="form-group">
                                    <font color="white"><label for="inputAddress5">Photo URL</label></font>
                                    <input type="text" class="form-control" id="inputAddress5" name="txtPhoto" value="${sessionScope.ManageUser.photo}" required="true"/>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <font color="white"><label for="inputCompany5">Rank</label></font>

                                        <input class="form-control " type="number" name="txtRank" value="${sessionScope.ManageUser.rank}" placeholder="" required="true"
                                               <c:if test="${sessionScope.roleID == 2}">
                                                   readonly="true"
                                               </c:if>   
                                               >
                                    </div>

                                        <c:if test="${sessionScope.roleID == 1}">                                                                       
                                        <div class="form-group col-md-6">
                                            <font color="white"><label for="inputState5">Status</label></font>
                                            <select name="status" id="inputState5" class="form-control">                                   
                                                <option 
                                                    <c:if test="${sessionScope.ManageUser.status}">
                                                        selected
                                                    </c:if>
                                                    >Active</option>
                                                <option
                                                    <c:if test="${!sessionScope.ManageUser.status}">
                                                        selected
                                                    </c:if>>Non-Active</option>
                                            </select>

                                        </div>
                                    </c:if>  
                                    <div class="form-group col-md-6">
                                        <font color="white"><label for="inputZip5">Role ID</label></font>
                                        <c:forEach var="role" items="${sessionScope.ListRole}">
                                            <c:if test="${sessionScope.ManageUser.roleID == role.roleID && role.roleID == 1}">
                                                <input type="text" class="form-control" id="inputZip5" name="txtRole" value="${role.roleName}" required="true"/>
                                            </c:if>
                                            <c:if test="${sessionScope.ManageUser.roleID == role.roleID && role.roleID == 2}">
                                                <input type="text" class="form-control" id="inputZip5" name="txtRole" value="${role.roleName}" required="true"
                                                       <c:if test="${sessionScope.roleID == 2}">
                                                           readonly="true"
                                                       </c:if>  />
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                                <hr class="my-4" />
                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <font color="white"><label for="inputPassword4">Old Password</label></font>
                                            <input type="password" class="form-control" id="inputPassword5" name="txtPassword" value="${sessionScope.ManageUser.password}" required="true"/>
                                        </div>

                                        <div class="form-group">
                                            <font color="white"><label for="inputPassword5">New Password</label></font>
                                            <input type="password" class="form-control" id="inputPassword5" name="txtNewPassword" value="${param.txtNewPassword}"/>
                                        </div>
                                        <div class="form-group">
                                            <font color="white"><label for="inputPassword6">Confirm Password</label></font>
                                            <input type="password" class="form-control" id="inputPassword6" name="txtConfirmPassword" value="${param.txtConfirmPassword}"/>
                                        </div>
                                    </div>
                                    
                                </div>
                                <input type="hidden" name="txtUserID" value="${sessionScope.ManageUser.userID}" />
                                <button type="submit" class="btn btn-primary">Save Change</button>
                                <a href="navigation?btAction=home">Home Page</a>
                            </form>               
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Promotion</th>
                                        <th>Rank</th>
                                        <th>Date Join</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="h" items="${sessionScope.ListHistory}">
                                        <tr>
                                            <td>${h.userName}</td>
                                            <td>${h.proName}</td>
                                            <td>${h.rank}</td>
                                            <td>${h.dateIn}</td>
                                        </tr>    
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>


                       
                    </div>
                </div>
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            <c:if test="${requestScope.Confirm != null}">
            swal("Warning!", "${requestScope.Confirm}", "warning");
            </c:if>
        </script>
    </body>
</html>
