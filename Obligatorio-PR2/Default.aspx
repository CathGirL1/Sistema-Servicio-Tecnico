<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Obligatorio_PR2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Menu ID="Menu1" runat="server"></asp:Menu>
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle"></h1><asp:AdRotator ID="AdRotator1" runat="server" />
                <asp:BulletedList ID="BulletedList1" runat="server"></asp:BulletedList>
                <asp:AdRotator ID="AdRotator2" runat="server" />
                <asp:AdRotator ID="AdRotator3" runat="server" />
                <asp:BulletedList ID="BulletedList2" runat="server"></asp:BulletedList>
                <asp:Button ID="Button1" runat="server" Text="Button" />
               
            <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle"></h2>
                <p>
                    ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 id="librariesTitle"></h2>
                <p>
                    NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 id="hostingTitle"></h2>
                <p>
                    You can easily find a web hosting company that offers the right mix of features and price for your applications.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                </p>
            </section>
        </div>
    </main>

</asp:Content>
