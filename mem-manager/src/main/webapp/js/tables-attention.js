 var idList = "";
    $(document).ready(function() {
    $(".isAttendedCheck").change(function() {

        var label = this.parentElement.getElementsByClassName("checkbox-text")[0];
        var origin = label.id;
        var changed= this.checked  ? "true" : "false";
        label.innerText = this.checked  ? "Tham gia" : "Không tham gia";
        console.log(origin + "||" + changed);
        if(origin !== changed){
            if(idList.includes(this.id)){
            }else{
                idList = idList.concat(this.id + ",");
            }
        }else{
            if(idList.includes(this.id)){
                idList = idList.replace(this.id + ",", "");
            }else{
            }
        }

    });
});

$(document).ready(function() {

    $("#attention").click(function() {
        window.location.href = "/submitAttention?idList=".concat(idList.slice(0, -1));
    });
});