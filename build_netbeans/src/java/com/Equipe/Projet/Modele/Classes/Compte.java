package com.Equipe.Projet.Modele.Classes;

import java.util.logging.Logger;

/**
 *
 * @author Le Paré
 */
public class Compte {
    //Attribut
    public int IdCompte;
    public String Courriel;
    public String MotDePasse;
    public String Nom;
    public String Prenom;
    public int Age;
    public String Ville;
    //Constructeur
    public Compte(int IdCompte,String Courriel, String MotDePasse, String Nom, String Prenom, int Age, String Ville) {
        this.IdCompte = IdCompte;
        this.Courriel = Courriel;
        this.MotDePasse = MotDePasse;
        this.Nom = Nom;
        this.Prenom = Prenom;
        this.Age = Age;
        this.Ville = Ville;
    }
    //Getter et Setter
    public void setCourriel(String Courriel) {
        this.Courriel = Courriel;
    }

    public String getCourriel() {
        return Courriel;
    }

    public void setIdCompte(int IdCompte) {
        this.IdCompte = IdCompte;
    }

    public void setMotDePasse(String MotDePasse) {
        this.MotDePasse = MotDePasse;
    }

    public void setNom(String Nom) {
        this.Nom = Nom;
    }

    public void setPrenom(String Prenom) {
        this.Prenom = Prenom;
    }

    public void setAge(int Age) {
        this.Age = Age;
    }

    public void setVille(String Ville) {
        this.Ville = Ville;
    }

    public int getIdCompte() {
        return IdCompte;
    }

    public String getMotDePasse() {
        return MotDePasse;
    }

    public String getNom() {
        return Nom;
    }

    public String getPrenom() {
        return Prenom;
    }

    public int getAge() {
        return Age;
    }

    public String getVille() {
        return Ville;
    }

}
