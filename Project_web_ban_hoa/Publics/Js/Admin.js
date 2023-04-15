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

//show alert
function sweetAlertConfirm(btnDelete, title, text) {
    if (btnDelete.dataset.confirmed) {
        // The action was already confirmed by the user, proceed with server event
        btnDelete.dataset.confirmed = false;
        return true;
    } else {
        event.preventDefault();
        swal.fire({
            title: title,
            text: text,
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Không',
            confirmButtonText: 'Có',
        }).then(function (result) {
            if (result.value) {
                btnDelete.dataset.confirmed = true;
                btnDelete.click();
            }
        });
    }
}

