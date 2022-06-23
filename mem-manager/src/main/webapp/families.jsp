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
<body class="sb-nav-fixed">
<%@include file="includedJsp/header.jsp" %>
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
                            <form id= "form-family">
                                <c:if test="${not empty groups}">
                                    <c:forEach items="${groups}" var="item">
                                        <div class="drop">
                                          <div class="dropdown">
                                            <button class="btn btn-primary dropdown-toggle" id="${item.groupName}" type="button" data-toggle="dropdown">${item.groupName}
                                            <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <c:if test="${not empty item.families}">
                                                    <c:forEach items="${item.families}" var="family">
                                                        <li>&nbsp;&nbsp;<input type="checkbox" name="${family.name}">&nbsp;${family.name}</li>
                                                    </c:forEach>
                                                </c:if>
                                            </ul>
                                          </div>
                                        </div>&nbsp;&nbsp;&nbsp;
                                    </c:forEach>
                                </c:if>

                                <button onclick="filterFamily()" class="btn-submit">Hiển thị</button>
                            </form>
						</div>
						<div class = "search-code">
                            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-gear" id="setting-icon" ></i></a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#!">Xuất excel</a></li>
                                        <li><a class="dropdown-item" href="/getParam">Chia gia đình</a></li>
                                        <li><a class="dropdown-item" href="">Sửa tên gia đình</a></li>
                                    </ul>
                                </li>
                            </ul>

						</div>
					</div>
					<div class="group-body">
					    <c:if test="${not empty groups}">
                            <c:forEach items="${groups}" var="item">
                                <div class="family-body" id="${item.groupName}">
                                    <h4>${item.groupName}</h4>
                                    <c:if test="${not empty item.families}">
                                        <c:forEach items="${item.families}" var="family">
                                            <div class="family-container" id="${family.name}">
                                                <p class= "family-name">${family.name}</p>
                                                <c:if test="${not empty family.members}">
                                                    <c:forEach items="${family.members}" var="member">
                                                        <div class="name"><i class='fas fa-edit'></i>${member.name}</div>
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
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>

</body>
</html>
