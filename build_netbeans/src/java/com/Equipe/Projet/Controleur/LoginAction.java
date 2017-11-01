/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

import com.Equipe.Projet.Modele.Classes.Compte;
import com.Equipe.Projet.Modele.DAO.CompteDAO;
import com.Equipe.Projet.Modele.Util.Connexion;
import com.google.gson.Gson;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author usager
 */
public class LoginAction implements RequestAware, Action{

    private HttpServletRequest Request;
    private HttpServletResponse Response;
    
    @Override
    public void setRequest(HttpServletRequest r) {
        this.Request = r;
    }

    @Override
    public void setResponse(HttpServletResponse r) {
        this.Response = r;
    }

    @Override
    public String execute() {
        
        String courriel = Request.getParameter("courriel");
        String motdepasse = Request.getParameter("mdp");
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Connection cnx;
        cnx = Connexion.getInstance();       
        CompteDAO dao = new CompteDAO(cnx);
        Compte c = new Compte();
        HttpSession session = Request.getSession();
        
        System.out.println("debut!!!");
       
            
        c = dao.FindByCourriel(courriel);
        
        System.out.println(c.getMotDePasse());
        System.out.println(motdepasse);
        System.out.println(c.getMotDePasse().length());
        System.out.println(motdepasse.length());
        try{
        
            if(!(c.getMotDePasse().equals(motdepasse))){
                Request.setAttribute("message","mot de passe invalide");
                System.out.println("pas connecter");
                return "/PageConnexion.jsp";
            }
            else{
                session.setAttribute("IdConnect",c.getIdCompte());
                System.out.println("connecter");
                return "/index.jsp";
            }
        
        }
        catch(Exception e){
            System.out.println("champ vide!!!");
            Request.setAttribute("message","un champ est vide!!");
            return "/PageConnexion.jsp";
        }
        

    }
    
}
