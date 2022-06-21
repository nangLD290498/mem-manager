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
                            <form action="searchMembers" id= "form-family">
                                <div class="drop">
                                  <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Gia Đình 1
                                    <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                      <li>&nbsp;&nbsp;<input type="checkbox" name="vehicle3">&nbsp;HTML</li>
                                      <li>&nbsp;&nbsp;<input type="checkbox" name="vehicle3">&nbsp;HTML</li>
                                      <li>&nbsp;&nbsp;<input type="checkbox" name="vehicle3">&nbsp;HTML</li>
                                    </ul>
                                  </div>
                                </div>&nbsp;&nbsp;&nbsp;
                                <div class="drop">
                                  <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Gia Đình 2
                                    <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                      <li>&nbsp;&nbsp;<input type="checkbox" name="vehicle3">&nbsp;HTML</li>
                                      <li>&nbsp;&nbsp;<input type="checkbox" name="vehicle3">&nbsp;HTML</li>
                                      <li>&nbsp;&nbsp;<input type="checkbox" name="vehicle3">&nbsp;HTML</li>
                                    </ul>
                                  </div>
                                </div>&nbsp;&nbsp;&nbsp;
                                <div class="drop">
                                  <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Gia Đình 3
                                    <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                      <li>&nbsp;&nbsp;<input type="checkbox" name="vehicle3">&nbsp;HTML</li>
                                      <li>&nbsp;&nbsp;<input type="checkbox" name="vehicle3">&nbsp;HTML</li>
                                      <li>&nbsp;&nbsp;<input type="checkbox" name="vehicle3">&nbsp;HTML</li>
                                    </ul>
                                  </div>
                                </div>&nbsp;&nbsp;&nbsp;
                                <input type="submit" value="Hiển thị" class="btn-submit">
                            </form>
						</div>
						<div class = "search-code">
							<i class="fa fa-gear" id="setting-icon" ></i>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
							<tr>
								<th>Nguyễn Bỉnh Khiêm</th>
								<th>Trân Nhân Tông</th>
								<th>Trần Hưng Đạo</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td class = "male" style="background: #17a2b82e;;">
									<div class = "edit-btn">
										<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle"  href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-fw"></i></a>
												<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
													<form action="">
														<select name="family-form"  >
															<option value="volvo">Nguyễn Bỉnh Khiêm</option>
															<option value="saab">Trần Nhân Tông</option>
															<option value="opel">Trần Hưng Đạo</option>
														</select>
														<input type="submit" value="Chuyển gia đình">
													</form>
												</ul>
											</li>
										</ul>
									</div>
									<p class = "name">Le Duc Nang - 23</p>
								</td>
								<td class = "female" style="background: #ffc0cb91;;">
									<div class = "edit-btn">
										<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle"  href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-fw"></i></a>
												<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
													<form action="">
														<select name="family-form"  >
															<option value="volvo">Nguyễn Bỉnh Khiêm</option>
															<option value="saab">Trần Nhân Tông</option>
															<option value="opel">Trần Hưng Đạo</option>
														</select>
														<input type="submit" value="Chuyển gia đình">
													</form>
												</ul>
											</li>
										</ul>
									</div>
									<p class = "name">Lê Thị Hoài Trang - 20</p>
								</td>
								<td class = "male" style="background: #17a2b82e;;">
									<div class = "edit-btn">
										<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle"  href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-fw"></i></a>
												<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
													<form action="">
														<select name="family-form"  >
															<option value="volvo">Nguyễn Bỉnh Khiêm</option>
															<option value="saab">Trần Nhân Tông</option>
															<option value="opel">Trần Hưng Đạo</option>
														</select>
														<input type="submit" value="Chuyển gia đình">
													</form>
												</ul>
											</li>
										</ul>
									</div>
									<p class = "name">Nguyễn Văn Thành - 34</p>
								</td>
							</tr>
							<tr>
								<td class = "male" style="background: #17a2b82e;;">
									<div class = "edit-btn">
										<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle"  href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-fw"></i></a>
												<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
													<form action="">
														<select name="family-form"  >
															<option value="volvo">Nguyễn Bỉnh Khiêm</option>
															<option value="saab">Trần Nhân Tông</option>
															<option value="opel">Trần Hưng Đạo</option>
														</select>
														<input type="submit" value="Chuyển gia đình">
													</form>
												</ul>
											</li>
										</ul>
									</div>
									<p class = "name">Nguyễn Văn Thành - 34</p>
								</td>
								<td class = "male" style="background: #17a2b82e;;">
									<div class = "edit-btn">
										<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-fw"></i></a>
												<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
													<form action="">
														<select name="family-form"  >
															<option value="volvo">Nguyễn Bỉnh Khiêm</option>
															<option value="saab">Trần Nhân Tông</option>
															<option value="opel">Trần Hưng Đạo</option>
														</select>
														<input type="submit" value="Chuyển gia đình">
													</form>
												</ul>
											</li>
										</ul>
									</div>
									<p class = "name">Lê Đức Năng - 23</p>
								</td>
								<td class = "male" style="background: #ffc0cb91;;">
									<div class = "edit-btn">
										<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle"  href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-fw"></i></a>
												<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
													<form action="">
														<select name="family-form"  >
															<option value="volvo">Nguyễn Bỉnh Khiêm</option>
															<option value="saab">Trần Nhân Tông</option>
															<option value="opel">Trần Hưng Đạo</option>
														</select>
														<input type="submit" value="Chuyển gia đình">
													</form>
												</ul>
											</li>
										</ul>
									</div>
									<p class = "name">Lê Thị Hoài Trang - 23</p>
								</td>
							</tr>
							</tbody>
						</table>
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
