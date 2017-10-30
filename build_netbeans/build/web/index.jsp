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

              .search {
                width: 150%;
                position: relative;
                bottom:50%;
                height: 20px;
                left: 70%;
                transform: translate(-50%, -50%);



              }

              .searchTerm {
                float: left;
                width: 100%;
                border: 3px solid #00B4CC;
                padding: 5px;

                border-radius: 5px;
                outline: none;
                color: #9DBFAF;
              }

              .searchTerm:focus{
                color: #00B4CC;
              }

              .searchButton {
                position: absolute;  
                right: -50px;
                width: 40px;
                height: 36px;
                border: 1px solid #00B4CC;
                background: #00B4CC;
                text-align: center;
                color: #fff;
                border-radius: 5px;
                cursor: pointer;
                font-size: 20px;
              }
              .connection{
                  left:350px;
              }
          

            
        </style>
    </head>
  <body>
   <div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="#">toilettes</a>
          </div>
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Accueil</a></li>
            <li><a href="#">Favoris</a></li>
            <li><a href="#">Sauvegarder</a></li>
            <li><a href="#">Page 3</a></li>
            <li>
                <a>
                    
                    <div class="search">
                        <input type="text" class="searchTerm" placeholder="quel endroit cherchez-vous?">

                        <button type="submit" class="searchButton">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>                    
                </a>                
            </li> 
            <li><a href="PageConnexion.jsp" class="connection">se connecter</a>
            </li>
          
            
          </ul>
    
        </div>     
    </nav>
        <div id="map"></div>

    </div>
      <script> 
        function initMap() {
        
            //Carte
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: {lat: 45.5017, lng: -73.5673},
                
                mapTypeControl: true,
                
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                    mapTypeIds: ['roadmap', 'terrain']
                }
            });
            
           
            //ajout de marqueurs
            
            
            map.addListener('dblclick', function(e) {
                placeMarker(e.latLng,map);
            });
            
           
            //scripts pour la barre de recherche
            
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
            
            
            //fonction de placemements de marqueurs
            function placeMarker(location,map){
                var marker = new google.maps.Marker({
                    position: location,
                    map: map,
                    animation: google.maps.Animation.DROP
                });
            
            
                //fenetre de details
                var infoWindow = new google.maps.InfoWindow({
                   
                   
                   content: " </br><button type='button'>Sauvegarder</button><button type='button'>modifier</button>" 
                   
                });
                //ajout de listener
                marker.addListener('mouseover',function(){
                    infoWindow.open(map,marker);
                });
                marker.addListener('click',function(){
                   infoWindow.close(map,marker);
                });
            }
            $.getJSON('ListeToilette.action?Action=ListeToiletteAjax',function(data,status){
                alert("Bonjours");
                for(i=0;i >1;i++){
                    var positionToilette = {lat:data[i].Latitude, lng:data[i].Longitude };
                    placeMarker(positionToilette,map);
                }
            });
        }
        
        
    
        //ajout d'un marqueur avec un click
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3gKwa-w0U3DzR9pp02SOhPQaYN4KWCqY&callback=initMap">
    </script>
  </body>
</html>
