/// show thông báo
function showToast(message, duration, position, backColor = "green") {
    Toastify({
        text: message,
        duration: duration,
        close: true,
        gravity: "top",
        position: position,
        backgroundColor: backColor
    }).showToast();
}


//Show ảnh
function previewImage(nameFileUpLoad, nameImg) {
    var fileUpload = document.querySelector(nameFileUpLoad);
    var preview = document.getElementById(nameImg);

    // Kiểm tra nếu không có file nào được chọn
    if (fileUpload.files.length === 0) {
        return;
    }

    // Đọc file hình ảnh được chọn
    var reader = new FileReader();
    reader.onload = function (e) {
        preview.setAttribute("src", e.target.result);
        preview.style.display = "block";
    };
    reader.readAsDataURL(fileUpload.files[0]);
}

function onClickShowImg(nameControl) {
    document.querySelector(nameControl).click();
}