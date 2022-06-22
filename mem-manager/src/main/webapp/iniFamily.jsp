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
  <link href="css/iniFamily.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<%@include file="includedJsp/header.jsp" %>
<div id="layoutSidenav">
  <%@include file="includedJsp/sideBar.jsp" %>
  <div id="layoutSidenav_content">
    <main>
      <form id="regForm" action="/familyMgtPage">
          <h1>Chia gia đình</h1>
          <!-- One "tab" for each step in the form: -->
          <div class="tab">
              <p><input type="number" placeholder="Số lượng nhóm" min="1" class="number-group"/></p>
          </div>
          <div class="tab">
              <span>
                  <p><input type="number" class="age-range" placeholder="Độ tuổi bắt đầu nhóm 1" min="10"/>
                  <input type="number"class="age-range right" placeholder="Độ tuổi kết thúc nhóm 1"/></p>
              </span>
              <span>
                  <p><input type="number" class="age-range" placeholder="Độ tuổi bắt đầu nhóm 2"/>
                  <input type="number"class="age-range right" placeholder="Độ tuổi kết thúc nhóm 2" max ="20"/></p>
              </span>
          </div>
          <div class="tab">
              <p><input type="number" placeholder="Số lượng gia đình của nhóm 1" min="1" class="number-group"/></p>
              <p><input type="number" placeholder="Số lượng gia đình của nhóm 2" min="1" class="number-group"/></p>
              <p><input type="number" placeholder="Số lượng gia đình của nhóm 3" min="1" class="number-group"/></p>
          </div>
          <div style="overflow:auto;">
              <div style="float:right;">
                  <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                  <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
              </div>
          </div>
          <!-- Circles which indicates the steps of the form: -->
          <div style="text-align:center;margin-top:40px;">
              <span class="step"></span>
              <span class="step"></span>
              <span class="step"></span>
          </div>
      </form>
    </main>
    <%@include file="includedJsp/footer.jsp" %>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="js/iniFamily.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>


