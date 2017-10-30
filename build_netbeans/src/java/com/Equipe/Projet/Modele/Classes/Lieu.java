package com.Equipe.Projet.Modele.Classes;

/**
 *
 * @author Le Paré
 */
public abstract class Lieu {
    public int Id;
    public double Latitude;
    public double Longitude;
    public String Description;
    public int Etat;// 0= public, 1=Privé
    public int CompteId;

    public Lieu(int Id, double Latitude, double Longitude, String Description, int Etat, int CompteId) {
        this.Id = Id;
        this.Latitude = Latitude;
        this.Longitude = Longitude;
        this.Description = Description;
        this.Etat = Etat;
        this.CompteId = CompteId;
    }

    public Lieu() {
    }
    

    public void setId(int Id) {
        this.Id = Id;
    }

    public void setLatitude(double Latitude) {
        this.Latitude = Latitude;
    }

    public void setLongitude(double Longitude) {
        this.Longitude = Longitude;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setEtat(int Etat) {
        this.Etat = Etat;
    }

    public void setCompteId(int CompteId) {
        this.CompteId = CompteId;
    }

    public int getId() {
        return Id;
    }

    public double getLatitude() {
        return Latitude;
    }

    public double getLongitude() {
        return Longitude;
    }

    public String getDescription() {
        return Description;
    }

    public int getEtat() {
        return Etat;
    }

    public int getCompteId() {
        return CompteId;
    }

   
    
    
}
