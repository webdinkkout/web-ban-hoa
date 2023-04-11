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

function renderProducts(products) {
    var $productsContainer = $('#ajaxProducts');

    // Xóa các phần tử hiện tại
    $productsContainer.empty();

    // Thêm sản phẩm vào danh sách
    $.each(products, function (index, product) {
        var html = `

              <div class="col-lg-3">
                    <div class="content-wrapper-card-product">
                        <div class="content-wrapper-card-product-card-product-top">
                            <a href='ProductDetail.aspx?product-id=${product.Id}'>
                                <img src='${product.Thumbnail}' />
                            </a>
                        </div>
                        <div class="content-wrapper-card-product-card-product-bottom">
                            <a href='ProductDetail.aspx?product-id=${product.Id}&ci=${product.Category_Id}' class="content-wrapper-card-product-card-product-bottom__link">${product.Name}</a>
                            <div class="content-wrapper-card-product-card-product-price">
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--old">
                                    ${formatCurrency(product.Old_Price)}
                                </p>
                                <p class="content-wrapper-card-product-card-product-price__price-product wrapper-card-product-card-product-price__price-product--current">
                                       ${formatCurrency(product.Current_Price)}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

`;
        $productsContainer.append(html);
    });
}



// Sự kiện click cho nút "Tìm kiếm"
$("#btnSearchPrice").click(function (e) {
    e.preventDefault();
    // Lấy giá trị min và max từ hai trường input
    var min = $("#txtMin").val();
    var max = $("#txtMax").val();
    var id = selectedCategories.join(",");

    // Gửi request ajax để lấy danh sách sản phẩm phù hợp
    $.ajax({
        url: "CategoriesDetail.aspx/SearchByPrice",
        type: "POST",
        data: JSON.stringify({ minPrice: min, maxPrice: max, categoryIds: id }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var products = $.parseJSON(response.d);

            // Render danh sách sản phẩm
            renderProducts(products);
            //$("#ajaxProducts").html(response.d);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            console.log("Lỗi", thrownError);
        }
    });
});

function formatCurrency(amount) {
    // Định dạng tiền tệ sang chuỗi
    const formatter = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
        minimumFractionDigits: 0
    });

    // Định dạng số thành chuỗi tiền tệ
    return formatter.format(amount);
}