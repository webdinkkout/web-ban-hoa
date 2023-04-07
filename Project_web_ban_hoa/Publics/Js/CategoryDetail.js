var selectedCategories = [];

$(document).ready(function () {
    $("input[type=checkbox]").each(function () {
        if (this.checked) {
            selectedCategories.push(this.value);
        }
    });

    // Gọi Ajax với các giá trị category được lưu trữ trong mảng selectedCategories
    var url = `/GetProductsByCategory.aspx?categoryIds=${selectedCategories.join(",")}&ns=999`;
    $.ajax({
        url: url,
        type: "GET",
        success: function (data) {
            $("#ajaxProducts").html(data);
        },
        error: function () {
            alert("Lỗi khi tải sản phẩm!");
        }
    });
});

function onCategoryCheckboxChanged(checkbox) {
    var categoryId = checkbox.value;
    var isChecked = checkbox.checked;
    if (isChecked) {
        // Thêm giá trị category mới vào mảng selectedCategories
        selectedCategories.push(categoryId);
    } else {
        // Xóa giá trị category khỏi mảng selectedCategories
        var index = selectedCategories.indexOf(categoryId);
        if (index > -1) {
            selectedCategories.splice(index, 1);
        }
    }

    // Gọi Ajax với các giá trị category được lưu trữ trong mảng selectedCategories
    var url = "/GetProductsByCategory.aspx?categoryIds=" + selectedCategories.join(",");
    $.ajax({
        url: url,
        type: "GET",
        success: function (data) {
            $("#ajaxProducts").html(data);
        },
        error: function () {
            alert("Lỗi khi tải sản phẩm!");
        }
    });
}

$('.search-inner-controls a').click(function (e) {
    e.preventDefault();


    $('.search-inner-controls a').removeClass('search-inner-controls__control--active');

    $(this).addClass('search-inner-controls__control--active');
    const sortType = $(this).attr('data-ns');

    var url = `/GetProductsByCategory.aspx?categoryIds=${selectedCategories.join(",")}&ns=${sortType}`;
    $.ajax({
        url: url,
        type: "GET",
        success: function (data) {
            $("#ajaxProducts").html(data);
        },
        error: function () {
            alert("Lỗi khi tải sản phẩm!");
        }
    });
});

