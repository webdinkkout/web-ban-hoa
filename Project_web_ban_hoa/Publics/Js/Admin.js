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

