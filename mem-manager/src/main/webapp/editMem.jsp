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
    <link href="css/error-add.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<%@include file="includedJsp/header.jsp" %>
<div id="layoutSidenav">
    <%@include file="includedJsp/sideBar.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Chỉnh sửa thông tin khóa sinh</h1>
                <div>
                    <form action="/updateMember">
                        <input type="hidden"  value="true" <c:if test="${familyMgt == true}">name="familyMgt"</c:if>  readonly/>
                        <input type="hidden" id="memberID" value="${member.id}" name="id"  readonly/>
                        <p class="error-text"><c:if test="${existed == 'true'}">Hãy thay đổi thông tin để chỉnh sửa</c:if></p>
                        <c:if test="${empty existed}"><p>Thông tin khóa sinh</p></c:if>
                        <label >Họ Tên:</label>
                        <input type="text" value="${member.name}" name="name"  required /><br><br>
                        <label>Gia Đình:</label>
                        <c:if test="${not empty member.family}">
                            <input type="text" class = "readonly" value="${item.family.name}"  readonly /><br><br>
                        </c:if>
                        <c:if test="${empty member.family}">
                             <input type="text" class = "readonly" value="Chưa được xếp" readonly /><br><br>
                        </c:if>
                        <label>SBD:</label>
                        <input type="text" class = "readonly" value="${member.code}" name="code" readonly/ ><br><br>
                        <label>Tuổi:</label>
                        <input type="number" value="${member.age}" name = "age" required /><br><br>
                        <label>Giới Tính:</label>
                        <input type="radio" <c:if test="${member.gender == 'Nam'}">checked</c:if> id="lmale" name="gender" value="Nam" /> Nam &nbsp;&nbsp;
                        <input type="radio" <c:if test="${member.gender == 'Nữ'}">checked</c:if> id="lfemale" name="gender" value="Nữ"> Nữ<br><br>
                        <label>Điểm danh:</label>
                        <input type="radio" <c:if test="${isAtending == 'false'}">checked</c:if>  name="isAtending" value="false"> Không tham gia &nbsp;&nbsp;
                        <input type="radio" <c:if test="${isAtending == 'true'}">checked</c:if>  name="isAtending" value="true"> Tham gia <br><br>
                        <label>Điện thoại:</label>
                        <input type="text" value="${member.phoneNumber}" name=phoneNumber ><br><br>
                        <label>Tên người thân:</label>
                        <input type="text" value="${member.relativeName}" name="relativeName"><br><br>
                        <label>Mối quan hệ:</label>
                        <input type="text" value="${member.relationship}" name = "relationship"><br><br>
                        <label>Điện thoại:</label>
                        <input type="text" value="${member.relativePhoneNumber}" name = "relativePhoneNumber"><br><br>

                        <input type="submit" onclick="confirmPopUp('bạn đang chỉnh sửa thông tin khóa sinh !!')" value="Xong">
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
<script src="js/confirm.js"></script>
</body>
</html>
