/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

import com.Equipe.Projet.Modele.Classes.Compte;
import com.Equipe.Projet.Modele.DAO.CompteDAO;
import com.Equipe.Projet.Modele.Util.Connexion;
import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Le Paré
 */
public class CreerCompteAction implements Action, RequestAware {
    private HttpServletRequest Request;
    private HttpServletResponse Response;



    @Override
    public void setRequest(HttpServletRequest request) {
       this.Request = request;
    }

    @Override
    public void setResponse(HttpServletResponse response) {
        this.Response = response;
    }
    
    @Override
    public String execute() {
        
        String prenom = Request.getParameter("prenom");
        String nom = Request.getParameter("nom");
        String age = Request.getParameter("age");
        String ville = Request.getParameter("villecreer");
        //conversion de l'age
        int ageconverti = Integer.parseInt(age);
        
        String motdepasse = Request.getParameter("mdpcreer");
        String courriel = Request.getParameter("courrielcreer");
        
        Connection cnx;
        cnx = Connexion.getInstance();       
        CompteDAO dao = new CompteDAO(cnx);
        
        Compte c = new Compte();
        //liste des adresses courriels
        c = dao.FindByCourriel(courriel);
        
        try{
            if(c == null){
                
                Compte comptecreer = new Compte();
                comptecreer.setPrenom(prenom);
                comptecreer.setNom(nom);
                comptecreer.setAge(ageconverti);
                comptecreer.setVille(ville);
                comptecreer.setCourriel(courriel);
                comptecreer.setMotDePasse(motdepasse);
                dao.create(comptecreer);
                return "/PageConnexion.jsp";
            }
            else{
                Request.setAttribute("message","ce compte existe deja avec cette adresse courriel!!");
                return "/index.jsp";
            }
        
        }
        catch(Exception e){
            Request.setAttribute("message","erreur lors de la creation du compte");
            return "/CreerCompte.jsp";
        
        }
        
        
    }
    
}
