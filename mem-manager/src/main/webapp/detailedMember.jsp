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
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<%@include file="includedJsp/header.jsp" %>
<div id="layoutSidenav">
    <%@include file="includedJsp/sideBar.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Thông tin khóa sinh</h1><br>
                <div>
                    <form action="/members">
                        <input type="hidden" id="memberID" value="${member.id}" name="id"  readonly/>
                        <label >Họ Tên:</label>
                        <input type="text" class="readonly" value="${member.name}" readonly /><br><br>
                        <label>Nhóm:</label>
                        <c:if test="${not empty member.family.group}">
                            <input type="text" class="readonly" value="${member.family.group.groupName}" readonly /><br><br>
                        </c:if>
                        <c:if test="${empty member.family.group}">
                             <input type="text" class="readonly" value="Chưa được xếp" readonly /><br><br>
                        </c:if>
                        <label>Gia Đình:</label>
                        <c:if test="${not empty member.family}">
                            <input type="text" class="readonly" value="${member.family.name}" readonly /><br><br>
                        </c:if>
                        <c:if test="${empty member.family}">
                             <input type="text" class="readonly" value="Chưa được xếp" readonly /><br><br>
                        </c:if>
                        <label>SBD:</label>
                        <input type="text" class="readonly" value="${member.code}" readonly/ ><br><br>
                        <label>Tuổi:</label>
                        <input type="number" class="readonly" value="${member.age}" readonly><br><br>
                        <label>Giới Tính:</label>
                        <input type="text" class="readonly" value="${member.gender}" readonly/ ><br><br>
                        <label>Điểm danh:</label>
                        <c:if test="${isAtending == 'true'}">
                            <input type="text" class="readonly" value="Tham Gia" readonly/ ><br><br>
                        </c:if>
                        <c:if test="${isAtending == 'false'}">
                             <input type="text" class="readonly" value="Không tham Gia" readonly/ ><br><br>
                        </c:if>
                        <label>Điện thoại:</label>
                        <input type="text" class="readonly" value="${member.phoneNumber}" readonly><br><br>
                        <label>Tên người thân:</label>
                        <input type="text" class="readonly" value="${member.relativeName}" readonly/><br><br>
                        <label>Mối quan hệ:</label>
                        <input type="text" class="readonly" value="${member.relationship}"readonly/><br><br>
                        <label>Điện thoại:</label>
                        <input type="text" class="readonly" value="${member.relativePhoneNumber}" readonly/><br><br>

                        <input type="submit" value="Xong">
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
