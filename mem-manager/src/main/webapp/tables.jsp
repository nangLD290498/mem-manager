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
<%@include file="includedJsp/header.jsp" %>
<div id="layoutSidenav">
    <%@include file="includedJsp/sideBar.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <p class="error-text">${message}</p>
            <c:if test="${empty message}"><br></c:if>
            <div class="container-fluid px-4">
                <br/>
                <div class="card mb-4">
                    <div class="card-header">
                        <div class= "search-left">
                            <a href="addNewMemForm"><button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Thêm Khóa Sinh</button></a>
                            <form action="searchMembers">
                                <select name="gender" id="gender">
                                    <option value="all" <c:if test="${gender == 'all'}">selected</c:if> >--all--</option>
                                    <option value="Nam" <c:if test="${gender == 'Nam'}">selected</c:if> >Nam</option>
                                    <option value="Nữ" <c:if test="${gender == 'Nữ'}">selected</c:if> >Nữ</option>
                                </select>
                                <select name="age" id="age">
                                    <option value="all" <c:if test="${age == 'all'}">selected</c:if> >--all--</option>
                                    <c:if test="${not empty ages}">
                                        <c:forEach items="${ages}" var="item">
                                            <option value="${item}" <c:if test="${age == item}">selected</c:if> >${item} tuổi</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                                <select name="isAtending" id="isAtending">
                                    <option value="all" <c:if test="${isAtending == 'all'}">selected</c:if> >--all--</option>
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
                                <th>Gia đình</th>
                                <th>SBD</th>
                                <th>Tuổi</th>
                                <th>Giới tính</th>
                                <th>Điểm danh</th>
                                <th>Tùy Chỉnh</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Tên</th>
                                <th>Gia đình</th>
                                <th>SBD</th>
                                <th>Tuổi</th>
                                <th>Giới tính</th>
                                <th>Điểm danh</th>
                                <th>Tùy Chỉnh</th>
                            </tr>
                            </tfoot>
                            <tbody>
                             <c:if test="${not empty members}">
                                 <c:forEach items="${members}" var="item">
                                    <tr>
                                       <td>${item.name}</td>
                                       <td>
                                           <c:if test="${not empty item.family}">
                                                ${item.family.name}
                                           </c:if>
                                           <c:if test="${empty item.family}">
                                                Chưa được xếp
                                           </c:if>
                                       </td>
                                       <td>${item.code}</td>
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
                                            <a href="/deleteMem?code=${item.code}" class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                        </td>
                                    </tr>
                                 </c:forEach>
                             </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div>
                    <button type="button" class="btn btn-info save-attention" id="attention">Lưu điểm danh</button>
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
</body>
</html>
