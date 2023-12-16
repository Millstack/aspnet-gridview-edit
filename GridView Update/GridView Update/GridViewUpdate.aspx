<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridViewUpdate.aspx.cs" Inherits="GridView_Update_GridViewUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update GridView</title>

    <!--Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+J2Wk5vqXn3Fm/z2N1r8f6VZJ4T3Hdvh4kXG1j4fZ6IsU2f5" crossorigin="anonymous"></script>
    <!--AJAX JS-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!--Bootstrap JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="card-body m-5">
            <asp:GridView ShowHeaderWhenEmpty="true" ID="gridDView" runat="server" AutoGenerateColumns="false"
                AutoGenerateEditButton="false" OnRowEditing="OnRowEditing" OnRowUpdating="OnRowUpdating" OnRowCancelingEdit="OnRowCancelingEdit" DataKeyNames="id"
                CssClass="table table-bordered border border-1 border-dark-subtle table-hover text-center">

                <HeaderStyle CssClass="align-middle table-primary" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true" SortExpression="id" ItemStyle-CssClass="col-xs-3 align-middle text-start fw-light" />
                    <asp:BoundField DataField="BoqItem" HeaderText="Item Description" ReadOnly="true" SortExpression="BoqItem" ItemStyle-CssClass="col-xs-3 align-middle text-start fw-light" />
                    <asp:BoundField DataField="BoqUOM" HeaderText="Unit of Measurement" ReadOnly="true" SortExpression="BoqUOM" ItemStyle-CssClass="col-xs-3 align-middle fw-light" />

                    <asp:TemplateField HeaderText="Qty Measured" ItemStyle-CssClass="col-xs-3 align-middle">
                        <ItemTemplate>
                            <asp:Label ID="lblBoqQty1" runat="server" ReadOnly="true" CssClass="col-md-12" type="number" Text='<%# Bind("BoqQty") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="BoqQty" runat="server" CssClass="col-md-12" type="number" Text='<%# Bind("BoqQty") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="BoqRate" HeaderText="BoQ Unit Rate" ReadOnly="true" SortExpression="BoqRate" ItemStyle-CssClass="col-xs-3 align-middle fw-light" />

                    <asp:CommandField ShowEditButton="True" HeaderText="Action" ItemStyle-CssClass="col-md-2 align-middle fw-light" ControlStyle-CssClass="btn btn-light border border-dark-subtle rounded-1 fs-6 fw-light shadow-sm" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
