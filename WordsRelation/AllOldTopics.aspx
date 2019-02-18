<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllOldTopics.aspx.cs" Inherits="WordsRelation.AllOldTopics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>



















             <!-- start project list -->
               <asp:GridView ID="grdvTopics" runat="server" AutoGenerateColumns="False" >
            <Columns>
              <asp:BoundField DataField="TopicID" HeaderText="Id" Visible="False"></asp:BoundField>
              
              <asp:BoundField DataField="TopicName" HeaderText="Topics">
                  <HeaderStyle BackColor="#3498DB" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="150"></HeaderStyle>
                  
              </asp:BoundField>
          
                 <asp:HyperLinkField Text="View/Edit" HeaderText="View/Edit" DataNavigateUrlFields="TopicID" DataNavigateUrlFormatString="NewTopics.aspx?TopicID={0}">
                         <HeaderStyle BackColor="#3498DB" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="150"></HeaderStyle>
                  <ItemStyle ForeColor="#0066FF"></ItemStyle>
                </asp:HyperLinkField>

            
            </Columns>

     <alternatingrowstyle backcolor="PaleTurquoise"  
          forecolor="DarkBlue"
         />
    <RowStyle ForeColor="#4A3C8C" BackColor="#E7E7FF" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
      </asp:GridView>
        </div>
    </form>
</body>
</html>
