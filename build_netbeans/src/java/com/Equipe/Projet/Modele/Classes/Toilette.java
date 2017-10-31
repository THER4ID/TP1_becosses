package com.Equipe.Projet.Modele.Classes;

/**
 *
 * @author Le Paré
 */
public class Toilette extends Lieu {
    //Attribut
    public int TypeDeService;// 0 = homme, 1 = femme, 2 = homme et femme
    //Constructeur
    public Toilette(int TypeDeService, int Id, double Latitude, double Longitude, String Description, int Etat, int CompteId) {
        super(Id, Latitude, Longitude, Description, Etat, CompteId);
        this.TypeDeService = TypeDeService;
    }
    //Getter et setter
    public int getTypeDeService() {
        return TypeDeService; 
    }

    public Toilette() {
    }

    public void setTypeDeService(int TypeDeService) {
        this.TypeDeService = TypeDeService;
    }
    
}
