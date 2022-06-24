<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Dashboard - SB Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
  <link href="css/details.css" rel="stylesheet" />
  <link href="css/familiName.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<%@include file="includedJsp/header.jsp" %>
<div id="layoutSidenav">
  <%@include file="includedJsp/sideBar.jsp" %>
  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Nhập tên gia đình</h1><br>
        <div>
          <form action="processEditFamilyName">
                    <div class="group-body">
					    <c:if test="${not empty groups}">
                            <c:forEach items="${groups}" var="item">
                                <div class="family-body" id="${item.id}_group">
                                    <br><label>Tên nhóm</label> <input type="text" class="input-name" name="groupName" value="${item.groupName}"><br>
                                    <c:if test="${not empty item.families}">
                                        <c:forEach items="${item.families}" var="family">
                                            <div class="family-container" id="${family.id}_container">
                                                <label>Tên gia đình</label><input type="text" class="input-name family" id="fname" name="familyName" value="${family.name}">
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
					        </c:forEach>
					    </c:if>

					</div>

            <br><input type="submit" value="Xong">
          </form>
        </div>
      </div>
    </main>
    <%@include file="includedJsp/footer.jsp" %>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
