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
    <link href="css/operatorCss.css" rel="stylesheet" />
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
				<li><a class="dropdown-item" onclick="confirmPopUp('Bạn có chắc chắn muốn xóa tất cả khóa sinh !!')" href="/deleteAll">Xóa tất cả</a></li>
				<li><a class="dropdown-item" href="/exportExcel">Xuất excel</a></li>
				<li onclick="uploadExcel();" class="dropdown-item">Tải lên excel</li>
				<li><a class="dropdown-item" href="">
				<form action="/saveExcelTODb" method="post" enctype="multipart/form-data">
				    <input type="file" name="file" onchange="fileChanged(this);" id="getFile"  accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" style="display:none" />
				    <input type="submit" id="file-submit" value="Submit" style="display:none;"/>
				</form>
				</a></li>
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
                <c:if test="${empty message}"><p>Quản Lý khóa sinh - Đoàn TTNPT Trần Thánh Tông TVTLHR</p></c:if>
                <p class="message-text">${message}</p>
                <div class="card mb-4">
                    <div class="card-header">
                        <div class= "search-left">
                            <a href="addNewMemForm"><button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Thêm Khóa Sinh</button></a>
                            <form action="searchMembers">
                                <select name="gender" id="gender">
                                    <option value="all" <c:if test="${gender == 'all'}">selected</c:if> >All</option>
                                    <option value="Nam" <c:if test="${gender == 'Nam'}">selected</c:if> >Nam</option>
                                    <option value="Nữ" <c:if test="${gender == 'Nữ'}">selected</c:if> >Nữ</option>
                                </select>
                                <select name="age" id="age">
                                    <option value="all" <c:if test="${age == 'all'}">selected</c:if> >All</option>
                                    <c:if test="${not empty ages}">
                                        <c:forEach items="${ages}" var="item">
                                            <option value="${item}" <c:if test="${age == item}">selected</c:if> >${item} tuổi</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                                <select name="isAtending" id="isAtending">
                                    <option value="all" <c:if test="${isAtending == 'all'}">selected</c:if> >All</option>
                                    <option value="true" <c:if test="${isAtending == 'true'}">selected</c:if> >Tham gia</option>
                                    <option value="false" <c:if test="${isAtending == 'false'}">selected</c:if> >Không tham gia</option>
                                 </select>
                                <!-- <select name="family" id="family">
                                    <option value="volvo">Trần Hưng Đạo</option>
                                    <option value="saab">Trần Nhân Tông</option>
                                    <option value="saab">Hồ Chí Minh</option>
                                </select>-->
                                <input type="submit" value="Tìm Kiếm" class="btn-submit">
                            </form>
                        </div>

                        <div class = "search-code">
                            <form action="members" method="get">
                                <input type="text" id="code" name="code" placeholder="Nhập SBD" <c:if test="${not empty param_code}">value="${param_code}"</c:if>>
                                <!-- <input type="submit" value="Submit"> -->
                            </form>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>Tên</th>
                                <th>SBD</th>
                                <th>Nhóm</th>
                                <th>Gia đình</th>
                                <th>Tuổi</th>
                                <th>Giới tính</th>
                                <th>Điểm danh</th>
                                <th>Tùy Chỉnh</th>
                            </tr>
                            </thead>
                            <tbody>
                             <c:if test="${not empty members}">
                                 <c:forEach items="${members}" var="item">
                                    <tr>
                                       <td>${item.name}</td>
                                       <td>${item.code}</td>
                                       <td>
                                       <c:if test="${not empty item.family.group}">
                                            ${item.family.group.groupName}
                                       </c:if>
                                       <c:if test="${empty item.family.group}">
                                            Chưa được chia
                                       </c:if>
                                       </td>
                                        <td>
                                       <c:if test="${not empty item.family}">
                                            ${item.family.name}
                                       </c:if>
                                       <c:if test="${empty item.family}">
                                            Chưa được chia
                                       </c:if>
                                       </td>
                                       <td>${item.age}</td>
                                       <td>${item.gender}</td>
                                       <td>
                                            <input type="checkbox" <c:if test="${item.isAtending == 'true'}"> checked </c:if> class="isAttendedCheck" id="${item.id}" name="isAttended" value="isAttended"  />
                                            <label class="checkbox-text" id="${item.isAtending}">
                                            <c:if test="${item.isAtending == 'true'}">Tham gia</c:if>
                                            <c:if test="${item.isAtending == 'false'}">Không tham gia</c:if>
                                            </label>
                                        </td>
                                        <td>
                                            <a href="/getDetails?id=${item.id}" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                            <a href="/updateMemPage?id=${item.id}" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                            <a href="/deleteMem?code=${item.code}" onclick="confirmPopUp('Bạn có chắc chắn muốn xóa khóa sinh này !!')" class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                        </td>
                                    </tr>
                                 </c:forEach>
                             </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div>
                    <button type="button" class="btn btn-info save-attention" onclick="confirmPopUp('Bạn đang thực hiện điểm danh !!')" id="attention">Lưu điểm danh</button>
                </div>
            </div>
        </main> <br/>
        <%@include file="includedJsp/footer.jsp" %>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
<script src="js/tables-attention.js"></script>
<script src="js/confirm.js"></script>
<script>
function uploadExcel() {
  document.getElementById('getFile').click();

}

function fileChanged(ele){
    document.getElementById('file-submit').click();
}
</script>
</body>
</html>
