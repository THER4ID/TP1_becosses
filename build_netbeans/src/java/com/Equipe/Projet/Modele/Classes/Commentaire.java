package com.Equipe.Projet.Modele.Classes;

/**
 *
 * @author Le Paré
 */
public class Commentaire {
    //Attribut
    public int IdCommentaire;
    public String Texte;
    public int IdCompteCreateur;
    public int IdLieuCommenter;
    // Constructeur
    public Commentaire(int IdCommentaire, String Texte, int IdCompteCreateur, int IdLieuCommenter) {
        this.IdCommentaire = IdCommentaire;
        this.Texte = Texte;
        this.IdCompteCreateur = IdCompteCreateur;
        this.IdLieuCommenter = IdLieuCommenter;
    }
    //Getter et Setter

    public Commentaire() {

    }

    public int getIdCommentaire() {
        return IdCommentaire;
    }

    public void setIdCommentaire(int IdCommentaire) {
        this.IdCommentaire = IdCommentaire;
    }

    public String getTexte() {
        return Texte;
    }

    public void setTexte(String Texte) {
        this.Texte = Texte;
    }

    public int getIdCompteCreateur() {
        return IdCompteCreateur;
    }

    public void setIdCompteCreateur(int IdCompteCreateur) {
        this.IdCompteCreateur = IdCompteCreateur;
    }

    public int getIdLieuCommenter() {
        return IdLieuCommenter;
    }

    public void setIdLieuCommenter(int IdLieuCommenter) {
        this.IdLieuCommenter = IdLieuCommenter;
    }
    
    
    
    
}
