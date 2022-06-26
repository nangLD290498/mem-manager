<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Tables - SB Admin</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
	<link href="css/chart.css" rel="stylesheet" />
	<link href="css/families.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body class="sb-nav-fixed" >
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- Navbar Brand-->
	<a class="navbar-brand ps-3" >TVTLHR</a>
	<!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
	<!-- Navbar Search-->
	<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		<div class="input-group" style = "display: none;">
			<input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
			<button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
		</div>
	</form>
	<!-- Navbar-->
	<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
			<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" id="excel-export" href="#!">Xuất excel</a></li>
			</ul>
		</li>
	</ul>
</nav>
<div id="layoutSidenav">
	<%@include file="includedJsp/sideBar.jsp" %>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				 <h1 class="mt-4">TVTLHR</h1>
                 <c:if test="${empty message}"><p>Quản Lý gia đình - Đoàn TTNPT Trần Thánh Tông TVTLHR</p></c:if>
                 <p class="message-text">${message}</p>
				<div class="card mb-4">
					<div class="card-header">
						<div class= "search-left">
                            <div id= "form-family">
                                <c:if test="${not empty groups}">
                                    <c:forEach items="${groups}" var="item">
                                        <div class="drop">
                                          <div class="dropdown" data-toggle="tooltip" title=" từ ${item.startAge} đến ${item.endAge} tuổi">
                                            <button class="btn btn-primary dropdown-toggle btn-group-family" id="${item.id}" type="button"  data-toggle="dropdown">${item.groupName}
                                            <span class="caret"></span></button>
                                            <ul class="dropdown-menu" id="${item.id}_dropdown">
                                                <c:if test="${not empty item.families}">
                                                    <c:forEach items="${item.families}" var="family">
                                                        <li>&nbsp;&nbsp;<input type="checkbox" class="family-btn" id="${family.id}_checkbox" name="${family.name}"/>&nbsp;${family.name}</li>
                                                    </c:forEach>
                                                </c:if>
                                            </ul>
                                          </div>
                                        </div>&nbsp;&nbsp;&nbsp;
                                    </c:forEach>
                                </c:if>

                                <button onclick="filterFamily()" class="btn-submit">Hiển thị</button>
                            </div>
						</div>
						<div class = "search-code">
                            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-gear" id="setting-icon" ></i></a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="/getParam">Chia gia đình</a></li>
                                        <li><a class="dropdown-item" href="/editFamilyName">Sửa tên gia đình</a></li>
                                    </ul>
                                </li>
                            </ul>

						</div>
					</div>
					<div class="group-body">
					    <c:if test="${not empty groups}">
                            <c:forEach items="${groups}" var="item">
                                <div class="family-body" style="display:none;" id="${item.id}_group">
                                    <h4>${item.groupName}</h4>
                                    <c:if test="${not empty item.families}">
                                        <c:forEach items="${item.families}" var="family">
                                            <div class="family-container" id="${family.id}_container">
                                                <p class= "family-name">${family.name}</p>
                                                <c:if test="${not empty family.members}">
                                                    <c:forEach items="${family.members}" var="member">
                                                        <p class="name"  <c:if test="${member.gender== 'Nữ'}">style="color: red;"</c:if>>
                                                            <a id="icon" href= "updateMemPage?id=${member.id}&familyMgt=true">
                                                                <c:if test="${member.isAtending== 'true'}">
                                                                    <i class='fas fa-edit'></i>
                                                                </c:if>
                                                                <c:if test="${member.isAtending== 'false'}">
                                                                    <i class='far fa-file'></i>
                                                                </c:if>
                                                            </a>
                                                            ${member.age} - ${member.name}
                                                        </p>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
					        </c:forEach>
					    </c:if>

					</div>
				</div>
			</div>
		</main>
		<%@include file="includedJsp/footer.jsp" %>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
<script src="js/scripts.js"></script>
<script>

var param="";

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});
function filterFamily(){
    //CHECK NHOM TRỐNG -> ẨN
    console.log("check nhóm");
    param="";
    var groupButtons = document.getElementsByClassName("btn-group-family");

    for (let i = 0; i < groupButtons.length; i++) {
        var familydropdown = document.getElementById(groupButtons[i].id+"_dropdown");

        var familyButtons = familydropdown.getElementsByTagName("input");
        var check = true;

        for (let j = 0; j < familyButtons.length; j++) {

            if(familyButtons[j].checked){
                check =false;
                var familyId = familyButtons[j].id.slice(0,-9);
                param = param.concat(familyId + ",");
                console.log("add-nhóm "+i+":"+ familyId + "||" + param);
                var familyCotainer = document.getElementById(familyId+"_container");
                familyCotainer.style.display = "inline-block";
            }else{
                var familyId = familyButtons[j].id.slice(0,-9);
                var familyCotainer = document.getElementById(familyId+"_container");
                familyCotainer.style.display = "none";
                if(param.includes(familyId)){
                     param = param.replace(this.id + ",", "");
                     console.log("remove-nhóm "+i+": "+ familyId + "||" + param);
                }else{
                }
            }
        }
        var groupId = groupButtons[i].id;
        var group = document.getElementById(groupId+"_group");

        if(check){
            group.style.display = "none";
        }else{
            group.style.display = "inline-block";
        }
    }
 }

function pageLoading(){
    var groups = document.getElementsByClassName("family-body");
    for (let j = 0; j < groups.length; j++) {
        groups[j].style.display = "none";
    }
 }

 $(document).ready(function() {

     $("#excel-export").click(function() {
         window.location.href = "/exportFamilyToExcel?familyId=".concat(param.slice(0, -1));
     });
 });
</script>
</body>
</html>
