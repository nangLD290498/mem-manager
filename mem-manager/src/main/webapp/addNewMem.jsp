<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                <h1 class="mt-4">Thêm khóa sinh</h1><br>
                <div>
                                    <form method="POST" action="/addNewMem" modelAttribute="member">
                                        <label>Họ Tên:</label>
                                        <input type="text" id="fname" name="name" > <br><br>
                                        <label for="fcode">SBD:</label>
                                        <input type="text" id="fcode" name="code" readonly><br><br>
                                        <label>Tuổi:</label>
                                        <input type="number" id="lage" name="age" ><br><br>
                                        <label>Giới Tính:</label>
                                        <input type="radio" id="lmale" checked name="gender" value="Nam"> Nam &nbsp;&nbsp;
                                        <input type="radio" id="lfemale" name="gender" value="Nữ"> Nữ<br><br>
                                        <label>Điểm danh:</label>
                                        <input type="radio" id="lattention_no" checked name="isAtending" value="true"> Không tham gia &nbsp;&nbsp;
                                        <input type="radio" id="lattention" name="isAtending" value="false"> Tham gia <br><br>
                                        <label>Điện thoại:</label>
                                        <input type="text" id="lphone" name="phoneNumber"><br><br>
                                        <label>Tên người thân:</label>
                                        <input type="text" id="lrelative" name="relativeName"><br><br>
                                        <label>Mối quan hệ:</label>
                                        <input type="text" id="lrelationship" name="relationship"><br><br>
                                        <label>Điện thoại:</label>
                                        <input type="text" id="lrelativephone" name="relativePhoneNumber" ><br><br>

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
