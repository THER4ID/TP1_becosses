<%-- 
    Document   : Index
    Created on : 2017-10-21, 20:56:41
    Author     : Le Paré
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            #FormAjoutLieu{ 
                margin: 200px 50px 75px 50px;
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
            <li><a href="#">Favoris</a></li>
            <li><a href="#">Sauvegarder</a></li>
            <input id="pac-input" class="controls" type="text" placeholder="Search Box">
            <li><a href="PageConnexion.jsp" class="connection">Se Connecter</a>
            </li>
          
            
          </ul>
    
        </div>     
    </nav>
        <div id="map"></div>
        
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
            </form>
        </div>
    </div>
      <script> 
        //Fonction de placemements de marqueurs
        //Cette Fonction est appelé pour placer des Lieu sur la map
        function placeMarker(location,map,id){
           var marker = new google.maps.Marker({
                position: location,
                map: map,
                animation: google.maps.Animation.DROP                   
            });            
            //On lui ajoute une fenetre de details
            var infoWindow = new google.maps.InfoWindow({
                content: " </br>"+id+"<button type='button'>Sauvegarder</button><button type='button'>modifier</button>" 
            });
            // On ajoute des Listener sur le marqueur
            marker.addListener('mouseover',function(){
                infoWindow.open(map,marker);
            });
            marker.addListener('click',function(){
                infoWindow.close(map,marker);
            });
            }
        // Fonction qui initialise la map
        function initMap() {
            $( "#AjoutLieu" ).toggle();
            //La Carte est placé sur le div 'Map'
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: {lat: 45.5017, lng: -73.5673},
                mapTypeControl: true,
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                    mapTypeIds: ['roadmap', 'terrain']
                }
            }); 
            map.addListener('dblclick', function(event) {
                placeMarker(event.latLng,map);
                ajouterLieu(event.latLng.lat(),event.latLng.lng());
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
            //Elle recoit une chaine Json et place un marqueur dans sur la map
            $.getJSON('ListeToilette.action?Action=ListeToiletteAjax',function(data,status){  
                var nombreDeLieu = Object.keys(data).length;
                for(i=0;i<nombreDeLieu;i++){
                    var positionToilette = {lng:data[i].Longitude,lat:data[i].Latitude };
                    placeMarker(positionToilette,map,data[i].Id);
                }
            });
        }
        // Fonction qui ajoute un lieu à la map
        // Elle fonctionne, Je dois finir la vérification des champs
        function ajouterLieu(Latitude,Longitude){
            $("#AjoutLieu").toggle();
            $('html, body').animate({
                scrollTop: $("#FormAjoutLieu").offset().top}, 2000);
            $("#boutonCreerLieu").click(function() {
                alert(Latitude+" "+$("#description").val()+"  "+$("#etat").val()+"   "+$("input[name=radioTypeDeService]:checked").val());
                var desc =$("#description").val();
                var etat = $("#etat").val();
                var tds = $("input[name=radioTypeDeService]:checked").val();
                $.getJSON('CreerLieu.action?Action=CreerLieuAjax&Description='+desc+'&Etat='+etat+'&TypeDeService='+tds
                        +'&Latitude='+Latitude+'&Longitude='+Longitude+'&CompteId=1',function(data,status){
                        alert(data); 
                });
            });
        }
        
    
        //ajout d'un marqueur avec un click
        
    </script>
    
    
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3gKwa-w0U3DzR9pp02SOhPQaYN4KWCqY&libraries=places&callback=initMap">
    </script>
  </body>
</html>

