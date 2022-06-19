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
            <div class="container-fluid px-4">
                <br/>
                <div class="card mb-4">
                    <div class="card-header">
                        <div class= "search-left">
                            <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Thêm Khóa Sinh</button>
                            <form action="">
                                <select name="cars" id="cars">
                                    <option value="volvo">Nam</option>
                                    <option value="saab">Nữ</option>
                                </select>
                                <select name="ages" id="ages">
                                    <option value="volvo">10 tuổi</option>
                                    <option value="saab">15 tuổi</option>
                                    <option value="saab">17 tuổi</option>
                                    <option value="saab">14 tuổi</option>
                                    <option value="saab">12 tuổi</option>
                                </select>
                                <select name="family" id="family">
                                    <option value="volvo">Trần Hưng Đạo</option>
                                    <option value="saab">Trần Nhân Tông</option>
                                    <option value="saab">Hồ Chí Minh</option>
                                </select>
                                <!-- <input type="submit" value="Tìm Kiếm" class="btn-submit"> -->
                            </form>
                        </div>

                        <div class = "search-code">
                            <form action="">
                                <input type="text" id="lname" name="lname" placeholder="Nhập SBD">
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
                                <th>Tuổi</th>
                                <th>Giới tính</th>
                                <th>Điểm danh</th>
                                <th>Tùy Chỉnh</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <tr>
                                <td>Tiger Nixon</td>
                                <td>System Architect</td>
                                <td>Edinburgh</td>
                                <td>61</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck" name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Garrett Winters</td>
                                <td>Accountant</td>
                                <td>Tokyo</td>
                                <td>63</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck" name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Ashton Cox</td>
                                <td>Junior Technical Author</td>
                                <td>San Francisco</td>
                                <td>66</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck" name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Cedric Kelly</td>
                                <td>Senior Javascript Developer</td>
                                <td>Edinburgh</td>
                                <td>22</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"  name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Airi Satou</td>
                                <td>Accountant</td>
                                <td>Tokyo</td>
                                <td>33</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck" name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Brielle Williamson</td>
                                <td>Integration Specialist</td>
                                <td>New York</td>
                                <td>61</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck" name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Herrod Chandler</td>
                                <td>Sales Assistant</td>
                                <td>San Francisco</td>
                                <td>59</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"  name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Rhona Davidson</td>
                                <td>Integration Specialist</td>
                                <td>Tokyo</td>
                                <td>55</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"  name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Colleen Hurst</td>
                                <td>Javascript Developer</td>
                                <td>San Francisco</td>
                                <td>39</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck" name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Sonya Frost</td>
                                <td>Software Engineer</td>
                                <td>Edinburgh</td>
                                <td>23</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck" name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Jena Gaines</td>
                                <td>Office Manager</td>
                                <td>London</td>
                                <td>30</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck" name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Quinn Flynn</td>
                                <td>Support Lead</td>
                                <td>Edinburgh</td>
                                <td>22</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"  name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Charde Marshall</td>
                                <td>Regional Director</td>
                                <td>San Francisco</td>
                                <td>36</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"  name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Haley Kennedy</td>
                                <td>Senior Marketing Designer</td>
                                <td>London</td>
                                <td>43</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"  name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Tatyana Fitzpatrick</td>
                                <td>Regional Director</td>
                                <td>London</td>
                                <td>19</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"  name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Brenden Wagner</td>
                                <td>Software Engineer</td>
                                <td>San Francisco</td>
                                <td>28</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"  name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Fiona Green</td>
                                <td>Chief Operating Officer (COO)</td>
                                <td>San Francisco</td>
                                <td>48</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"   name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Donna Snider</td>
                                <td>Customer Support</td>
                                <td>New York</td>
                                <td>27</td>
                                <td>
                                    <input type="checkbox" class="isAttendedCheck"  name="isAttended" value="isAttended"  />
                                    <label class="checkbox-text">Không tham gia</label>
                                </td>
                                <td>
                                    <a href="details.html" class="add" title="View" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a href="details.html" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" ><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div>
                    <button type="button" class="btn btn-info save-attention">Lưu điểm danh</button>
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
<script>
    $(document).ready(function() {
    $(".isAttendedCheck").change(function() {
        var label = $(this).parents("td").find('[class=checkbox-text]');
        label.text(this.checked  ? "Tham gia" : "Không tham gia");
    });
});
</script>
</body>
</html>
