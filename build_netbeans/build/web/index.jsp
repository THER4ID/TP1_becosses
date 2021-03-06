<%-- 
    Document   : Index
    Created on : 2017-10-21, 20:56:41
    Author     : Le Paré
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Projet Toilette</title>
        <meta charset="utf-8">
        <link href="style.css" rel="stylesheet" type="text/css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        
        <style>
            @import url(https://fonts.googleapis.com/css?family=Roboto:300);
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            .container, .container > div, .container > div #map {
                height: inherit;
                font-family: "Roboto", sans-serif;
            }

            body{
              background: #76b852; /* fallback for old browsers */
              background: -webkit-linear-gradient(right, #76b852, #8DC26F);
              background: -moz-linear-gradient(right, #76b852, #8DC26F);
              background: -o-linear-gradient(right, #76b852, #8DC26F);
              background: linear-gradient(to left, #76b852, #8DC26F);
              font-family: "Roboto", sans-serif;
              -webkit-font-smoothing: antialiased;
              -moz-osx-font-smoothing: grayscale;  
            }
            .connection{
                left:650px;
            }
            #map{
              height: 70%;   
            } 
            .controls {
                margin-top: 10px;
                border: 1px solid transparent;
                border-radius: 2px 0 0 2px;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                height: 32px;
                outline: none;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            }

            #pac-input {
              background-color: #fff;
              font-family: Roboto;
              font-size: 15px;
              font-weight: 300;
              margin-left: 12px;
              padding: 0 11px 0 13px;
              text-overflow: ellipsis;
              width: 300px;
            }

            #pac-input:focus {
              border-color: #4d90fe;
            }

            .pac-container {
              font-family: Roboto;
            }

            #type-selector {
              color: #fff;
              background-color: #4d90fe;
              padding: 5px 11px 0px 11px;
            }

            #type-selector label {
              font-family: Roboto;
              font-size: 13px;
              font-weight: 300;
            }
            #target {
              width: 345px;
            }
            #FormAjoutLieu, #AfficherCommentaire{ 
                margin: 220px 50px 75px 50px;
            }
            td /* Toutes les cellules des tableaux... */
            {
                border: 2px solid black; /* auront une bordure de 1px */
            }
            /* pour la infowindow */
            .iw-content img {
                float: right;
                margin: 0 5px 5px 10px;
                
            }

            .iw-title{
                text-align: center;
                background-color: lightblue;
                font-size: 20px;
            }
            .iw-subTitle{
                font-weight: bold;
                
            }
            .tags{
                font-weight: bold;
                
            }
            .service{
                font-weight: bold;
                color:red;
            }
            .boutons{
                border-radius: 4px;
            #map-canvas {
                margin: 0;
                padding: 0;
                height: 400px;
                max-width: none;
            }
            #map-canvas img {
                max-width: none !important;
            }
            .gm-style-iw {
                width: 350px !important;
                top: 15px !important;
                left: 0px !important;
                background-color: #fff;
                box-shadow: 0 1px 6px rgba(178, 178, 178, 0.6);
                border: 1px solid rgba(72, 181, 233, 0.6);
                border-radius: 10px 10px 10px 10px;;
            }
            #iw-container {
                margin-bottom: 10px;
            }
            #iw-container .iw-title {
                font-family: 'Open Sans Condensed', sans-serif;
                font-size: 22px;
                font-weight: 400;
                padding: 10px;
                background-color: #48b5e9;
                color: white;
                margin: 0;
                border-radius: 500px;
            }
            #iw-container .iw-content {
                font-size: 13px;
                line-height: 18px;
                font-weight: 400;
                margin-right: 1px;
                padding: 15px 5px 20px 15px;
                max-height: 140px;
                overflow-y: auto;
                overflow-x: hidden;
            }
            .iw-content img {
                float: right;
                margin: 0 5px 5px 10px;	
            }
            .iw-subTitle {
                font-size: 16px;
                font-weight: 700;
                padding: 5px 0;
            }
            .iw-bottom-gradient {
                position: absolute;
                width: 326px;
                height: 25px;
                bottom: 10px;
                right: 18px;
                background: linear-gradient(to bottom, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
                background: -webkit-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
                background: -moz-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
                background: -ms-linear-gradient(top, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
            }


        </style>
    </head>
  <body>
   <div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="#">Toilettes</a>
          </div>
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Accueil</a></li>
            
            <li>
                <a class="mes_lieux" 
                    <c:set var="valueconnexion" value="" />
                    <c:choose>
                        <c:when test="${!empty sessionScope.IdConnect}">
                            >Mes lieux
                        </c:when>
                        <c:otherwise>
                            >
                        </c:otherwise>
                    </c:choose>
                </a>
            
            </li>
            
            
            <li><a href="#"></a></li>
            <input id="pac-input" class="controls" type="text" placeholder="Search Box">
            <li>
                
                <a class="connection"
                
                    <c:set var="valueconnexion" value="" />
                    <c:choose>
                        <c:when test="${!empty sessionScope.IdConnect}">
                            href="deconnexion.action?Action=deconnexion"> Se Deconnecter
                        </c:when>
                        <c:otherwise>
                            href="PageConnexion.jsp">Se Connecter
                        </c:otherwise>
                    </c:choose>
                    
                
                </a>
                
            </li>
          
            
          </ul>
    
        </div>     
    </nav>
       <!--
            Ce DIV contien la map généré pas l'API GOOGLE MAPS JAVASCRIPT
       -->
       <div id="map"></div>
       
        <!--
            Container Boostrap contenant le formulaire d'ajout de lieu.
            Elle ne s'affiche que lorsque qu'un utilisateur connecté double
            clique sur la map.
        -->
        <div class="container-fluid" id="AjoutLieu">
            <form id ="FormAjoutLieu">
                <h3>Ajout d'une nouvelle Toilette</h3>
                <div class="form-group">
                  <label>Description:</label>
                  <textarea class="form-control" rows="5" id="description"></textarea>
                </div>
                <div class="form-group">
                  <label>État</label>
                  <select class="form-control" id="etat">
                    <option value = "0">Public</option>
                    <option value = "1">Privé</option>
                  </select>
                </div>
                <div class="form-group">
                    <label class="radio-inline">
                        <input type="radio" name="radioTypeDeService" Value="0">Homme
                    </label>
                    <label class="radio-inline">
                          <input type="radio" name="radioTypeDeService" Value="1">Femme
                    </label>
                    <label class="radio-inline">
                          <input type="radio" name="radioTypeDeService" Value="2">Homme et Femme
                    </label>
                </div>
                <button type="button" id="boutonCreerLieu" class="btn btn-success">Créer</button>
                <button type="button" class="btn btn-success annuler">Annuler</button> 
            </form>
        </div>
        <!--
            Container Boostrap contenant un div listant tous les commentaires de ce lieux et    
            un formulaire d'ajout de commentaire.
        -->
            <div class="container-fluid" id="AfficherCommentaire">
                <h3>Zone Commentaire de la Toilette</h3>
                <div id='ListeCommentaire'>
                </div>
                <!--
                    On affiche à l'utilisateur le formulaire de commentaire seulement s'il est connecté
                    au site.
                 -->
                <c:choose>
                    <c:when test="${!empty sessionScope.IdConnect}">
                <div id='Commenter'>
                    <div class='col-sm-4 col-lg-8 col-md-8'>
                        <form id="FormCommentaire">
                            <h4>Votre commentaire : </h4>
                            <textarea class="form-control" rows="5" id="TexteCommentaire"></textarea>
                            <input type ='hidden' id='IdCompte' value="${sessionScope.IdConnect}" />
                            <span><button type="button" id="boutonCreerCommentaire" class="btn btn-success">Envoyez</button></span>
                        </form>
                    </div>
                </div>
                    </c:when>
                </c:choose>
            </div>
      <script>           
        //Fonction de placemements de marqueurs
        //Cette Fonction est appelé pour placer des Lieu sur la map
        function placeMarker(location,map,icone,idLieu,desc,etat,typeDeService,idCreateur){
           var marker = new google.maps.Marker({
                position: location,
                map: map,
                animation: google.maps.Animation.DROP,  
                icon: icone,
                title:"Porcelain Factory of Vista Alegre"
            });
            
            //variable modif
            var tds_modif;
            var etat_modif;
            
            //modification du type de service de int en string
            if(typeDeService === 0){
                tds_modif = "hommes";
            }
            else if(typeDeService === 1){
                tds_modif = "femmes";
            }
            else if(typeDeService === 2){
                tds_modif = "hommes et femmes";
            }
            
            //modification de l'etat de int en string
            if(etat === 0){
                etat_modif = "publique";
            }
            
            else if(etat === 1){
                etat_modif = "privée";
            }
            //contenu qui sera afficher dans l'infowindow
            
            var content = '<div id="iw-container">' +
                    '<div class="iw-title">R&eacutesum&eacute Des Toilettes</div>' +
                    '<div class="iw-content">' +
                      '<div class="iw-subTitle">Informations</div>' +
                      '<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/JapaneseToiletBidet.jpg/180px-JapaneseToiletBidet.jpg" alt="Porcelain Factory of Vista Alegre" height="115" width="83">' +
      
                      '<p>'+desc+'</br>'+
                      '</br>'+
                      '<b class="service">Cette toilette '+etat_modif+' est disponible pour les '+tds_modif+'</b></br>'+
                      '</p>'+
                      '<div class="iw-subTitle">Informations Suppl&eacutementaires</div>' +
                      '<p><b class="tags">ID du Lieu :</b>'+idLieu +'<br>'+
                      '<b class="tags">ID du cr&eacuteateur: </b>'+idCreateur+'</br>'+
                      '</br>'+
                      '<div  align="center">'+
                      '</br>'+
                      '<button class="boutons" onclick=ListerLesCommentaire("'+idLieu+'") type="button">Commentaire</button>'+
                      '</p>'+
                      '</div>'+
                    '</div>' +
                    '<div class="iw-bottom-gradient"></div>' +
                  '</div>';
            
             
            
            //On créé le infoWindow en y ajoutant le contenu déclaré plus haut
            var infoWindow = new google.maps.InfoWindow({
                maxWidth: 350,
                content: content
              
            });
 
            // On ajoute des Listener d'ouvertur et de fermeture du infowindow
            google.maps.event.addListener(map, 'click', function() {
                infoWindow.close();
            });

            marker.addListener('click',function(){
                infoWindow.open(map,marker);
            });

            
          
        }
        
        
        // Fonction qui initialise la map
        // Cette fonction appelé à l'ouverture du site
        // On l'appel au même moment de donnée la clé d'utilisation
        function initMap() {

            //La Carte est placé sur le div 'Map'
            //On lui donne sa grandeur, son lieu de départ et on lui donne un style
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: {lat: 45.5017, lng: -73.5673},
                mapTypeControl: true,
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                    mapTypeIds: ['roadmap', 'terrain']
                }
            });
            
            // On ajoute un listener double-clique sur la map.
            // Il faut double-cliquez sur un point et être connecté 
            // pour afficher le formulaire de création de lieu.
            map.addListener('dblclick', function(event) {
                if($.trim($("a.connection").html())==="Se Deconnecter"){
                    ajouterLieu(event.latLng.lat(),event.latLng.lng());
                } else{
                    alert("Vous devez être connecté pour créer un lieu");
                }
                
            });
            

            //Ajout d'une barre de recherche
            var input = document.getElementById('pac-input');
            var searchBox = new google.maps.places.SearchBox(input);
            map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
 
            map.addListener('bounds_changed', function() {
                searchBox.setBounds(map.getBounds());
            });

            searchBox.addListener('places_changed', function() {
                var places = searchBox.getPlaces();

                if (places.length === 0) {
                    return;
                }
                
                var bounds = new google.maps.LatLngBounds();
            
                places.forEach(function(place) {
                    if (!place.geometry) {
                      console.log("Returned place contains no geometry");
                      return;
                    }
                   
                    if (place.geometry.viewport) {
                      // Only geocodes have viewport.
                      bounds.union(place.geometry.viewport);
                    } else {
                      bounds.extend(place.geometry.location);
                    }

                });
                //ajuste la vue de la carte autour de la recherche
                map.fitBounds(bounds);
            });
            
            //Sous-Fonction AJax/jQuery
            //Elle va chercher la liste des lieux dans l'action 'ListeToiletteAjax'
            //Elle recoit une chaine Json et place les lieu sur la map
            $.getJSON('ListeToilette.action?Action=ListeToiletteAjax',function(data,status){  
                // On détermine le nombre de lieux
                var nombreDeLieu = Object.keys(data).length;
                for(i=0;i<nombreDeLieu;i++){
                    //On trouve la position
                    var positionToilette = {lng:data[i].Longitude,lat:data[i].Latitude};
                    //On décide du type d'icone qui sera afficher
                    // Selon l'état de la toilette 0 = public et 1 = privé
                    var imageEtat =(data[i].Etat === 0?"public":"prive");
                    var icone = {
                        url:"./Multimedia/toilette_"+imageEtat+"_fermee.png",
                        scaledSize: new google.maps.Size(60, 60)
                    };
                    // On appel la fonction placemarker créé plus haut qui créé et affiche le lieu sur la map
                    placeMarker(positionToilette,map,icone,data[i].Id,data[i].Description,data[i].Etat,data[i].TypeDeService,data[i].CompteId);
                }
            });
        }
      
        //Function de démarrage
        $( document ).ready(function() {
            // On met à hide le formulaire d'ajout de lieu et la section commentaire
            $( "#AjoutLieu" ).toggle();
            $("#AfficherCommentaire").toggle();
            // On ajoute un evenement click sur les boutons de classe annuler
            $(".annuler").click(function(){
                $("#AjoutLieu").toggle();
                $("#ListeCommentaire").empty();

            });
            // Si le focus de la souris va sur la map, on cache 
            // le formulaire d'ajout de lieu et la section commentaire.
            $("#map").mouseenter(function(){
                $("#AjoutLieu").hide();
                $("#AfficherCommentaire").hide();
                $("#ListeCommentaire").empty();
            });
        });
        
        // Fonction qui ajoute un lieu à la map
        function ajouterLieu(Latitude,Longitude){
            // On affiche le formulaire avec une
            // animation qui nous rend à la section d'ajout de lieu
            $("#AjoutLieu").toggle();
            $('html, body').animate({
                scrollTop: $("#FormAjoutLieu").offset().top}, 2000);
            
            // On met un evenement click sur le bouton de creation de lieu
            $("#boutonCreerLieu").click(function() {
                // On va chercher les information lié au formulaire
                var desc =$("#description").val();
                var etat = $("#etat").val();
                var tds = $("input[name=radioTypeDeService]:checked").val();
                // Si le formulaire est belle et bien remplis
                if ($.trim(desc) !== "" & tds < 3){
                    // FOnction Ajax-Jquery
                    // On ajoute à la base de donnée une nouvelle toilette
                    $.getJSON('CreerLieu.action?Action=CreerLieuAjax&Description='+desc+'&Etat='+etat+'&TypeDeService='+tds
                            +'&Latitude='+Latitude+'&Longitude='+Longitude+'&CompteId=1',function(data,status){
                    }); 
                    // On ferme le formulaire 
                    // On remet à zéro les information du formulaire
                    $("#AjoutLieu").toggle();
                    $("#FormAjoutLieu")[0].reset();
                }else {
                    alert("Veuillez remplir tous les champs !!");
                }
            });
        }
                
        // FOnction Ajax Jquery
        // Lorsque l'utilisateur clique sur le bouton commentaire dans la fenêtre d'un lieu,
        // on affaiche tous les commentaire de ce lieu dans la zon de commentaire qui s'ouvre lors
        // du clique.
        function ListerLesCommentaire(idLieu){
            // On efface tous les commentaires précédent
            $("#ListeCommentaire").empty();
            // On affiche la zone de commentaire avec une animation
            $("#AfficherCommentaire").toggle();
            $('html, body').animate({
                scrollTop: $("#AfficherCommentaire").offset().top}, 2000);
            // On va chercher tous les commentaire du Lieu qui vien d'être cliquer
            $.getJSON('ListeCommentaire.action?Action=ListeCommentaireAjax&idLieu='+idLieu,function(dataCom,status){
                var nombreDeLieu = Object.keys(dataCom).length;         
                if(nombreDeLieu > 0){
                    // On fait une boucle d'affichage qui affiche tous les commentaires
                    for(i=0;i<nombreDeLieu;i++){
                        var texteCommentaire = dataCom[i].Texte;
                         NouveauCommentaire(texteCommentaire,dataCom[i].IdCompteCreateur);
                    }
                }else{
                    $("#ListeCommentaire").append("Aucun Commentaire pour ce lieu.");
                }
            });
            // On ajoute un focntion click sur le bouton de création de commentaire
            $("#boutonCreerCommentaire").click(function() {
                var IdCompteConnecte = $("#IdCompte").val();
                var leCommentaire = $.trim($("#TexteCommentaire").val());
                if (leCommentaire) {
                    // Fonction Ajax-Jquery
                    // ON créé la le commentaire dans la base de donnée
                    $.getJSON('CommenterUnLieu.action?Action=CommenterUnLieuAjax&IdCompteConnecte='+IdCompteConnecte+'&IdLieu='+idLieu+'&TexteCommentaire='+leCommentaire,function(data,status){});
                    $("#FormCommentaire")[0].reset();
                    // On affiche le commentaire
                    NouveauCommentaire(leCommentaire,IdCompteConnecte);
                                    

                }
            });
        }
        // Function Ajax-Jquery
        // ON recoit en paramètre les information d'un commentaire
        // On crée dans la base de donnée un nouveau commentaire avec les bonnes information 
        function NouveauCommentaire(TexteCommentaire,IdCompte){
            $.getJSON('GetCompte.action?Action=GetCompteAjax&idCompte='+IdCompte,function(dataCpt,status){
                // Chaque commentaire est placé dans un panel qu'on affiche à l'écran
                var commentaireHtml =   "<div class='col-sm-4 col-lg-8 col-md-8'>"+
                                            "<div class='panel panel-primary'>"+
                                                "<div class='panel-heading'><span class='glyphicon glyphicon-user'></span><span> "+dataCpt.Prenom+" "+dataCpt.Nom+"</span></div>"+
                                                "<div class='panel-body'>"+		
                                                    "<p>"+TexteCommentaire+"</p>";+
                                                "</div>"+
                                             "</div>"+
                                        "</div>";
                            // On ajoute le commentaire au DIV ListeCommentaire
               $("#ListeCommentaire").append(commentaireHtml);
            });  
        }
        
    </script>
    
   <!--
        Script qui initialise avec l'API google maps la map sur notre site avec l'aide de la clé.
        C'est à la fin qu'on appel la fonction InitMap
   -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3gKwa-w0U3DzR9pp02SOhPQaYN4KWCqY&libraries=places&callback=initMap">
    </script>
  </body>
</html>

