<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Obligatorio_PR2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Menu ID="Menu1" runat="server"></asp:Menu>
    <main>
        <div class="tituloInicio">
          <h1>¡Bienvenido a TechRequest!</h1>
            <br />
            <br />
            <br />
          <p class="contactoSoporte">
            Contacto de soporte: <a href="mailto:cathy@gmail.com">cathy@gmail.com</a> 
              <br />
            <a href="mailto:mati@gmail.com">mati@gmail.com</a>
          </p>
        </div>
    </main>

    <style>

                   
            .tituloInicio {
              text-align: center; 
              margin-top: 40px; 
            }

          
            .tituloInicio h1 {
              font-size: 27px; 
              color: black; 
              text-transform: uppercase; 
              border: 10px solid #d3d3d3; 
              padding: 10px 20px; 
              border-radius: 30px; 
              display: inline-block; 
              animation: movimientoFantastico 3s infinite ease-in-out; 
            }

            
            @keyframes movimientoFantastico {
              0%, 100% {
                transform: scale(1) rotate(0deg); 
              }
              50% {
                transform: scale(1.2) rotate(10deg); 
              }
            }

            
            .tituloInicio .contactoSoporte {
              margin-top: 15px; 
              font-size: 18px; 
              color: #555;
              font-style: italic; 
            }


           



    </style>
</asp:Content>
