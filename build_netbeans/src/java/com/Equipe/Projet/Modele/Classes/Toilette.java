package com.Equipe.Projet.Modele.Classes;

/**
 *
 * @author Le Paré
 */
public class Toilette extends Lieu {
    //Attribut
    public int TypeDeService;
    //Constructeur
    public Toilette(int TypeDeService, int Id, double Latitude, double Longitude, String Description, int Etat, int CompteId) {
        super(Id, Latitude, Longitude, Description, Etat, CompteId);
        this.TypeDeService = TypeDeService;
    }
    //Getter et setter
    public int getTypeDeService() {
        return TypeDeService;
    }

    public void setTypeDeService(int TypeDeService) {
        this.TypeDeService = TypeDeService;
    }
    
}
