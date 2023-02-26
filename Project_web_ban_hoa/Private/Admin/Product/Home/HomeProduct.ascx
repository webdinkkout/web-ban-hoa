<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeProduct.ascx.cs"
    Inherits="Project_web_ban_hoa.Private.Admin.Product.Home.HomeProduct" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<div class="wrapper-card">
    <canvas id="chart"></canvas>
</div>
<div>
    <asp:Button Text="Click me!" ID="toast" runat="server" OnClientClick="showToast(); return false;" />
</div>
<script>
    // Lấy tham chiếu đến đối tượng canvas
    var ctx = document.getElementById("chart");

    var data = {
        labels: GetProductNames().split(","),
        datasets: [{
            label: 'Số lượng xem',
            data: GetViewCounts().split(","),
            borderWidth: 1
        }]
    };
    new Chart(ctx, {
        type: 'pie',
        data: data,
        options: {
            maintainAspectRatio: false,
            responsive: true,
            width: 300,
            height: 300,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Phương thức lấy tên sản phẩm
    function GetProductNames() {
        <% var productNames = GetNamesFromDatabase(); %>
        return '<%= string.Join(",", productNames) %>';
    }


    // Phương thức lấy số lần xem của sản phẩm
    function GetViewCounts() {
        <% var viewCounts = GetViewCountsFromDatabase(); %>
        return '<%= string.Join(",", viewCounts) %>';
    }



</script>

