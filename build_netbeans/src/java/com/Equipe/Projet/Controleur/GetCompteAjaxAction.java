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
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Le Paré
 */
public class GetCompteAjaxAction implements AjaxAction, RequestAware, Action  {

    private HttpServletRequest Request;
    private HttpServletResponse Response;

    
    @Override
    public String execute() {
        // On va chercher l'id du lieu commenté 
        int idCompte = Integer.parseInt(Request.getParameter("idCompte"));
        Compte cpt = new Compte();
        String json = "[]";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx;
            cnx = Connexion.getInstance();
            CompteDAO daoCompte = new CompteDAO(cnx);
            cpt = daoCompte.FindById(idCompte);
            json = new Gson().toJson(cpt);
            return json;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListeCommentaireAjaxAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return json;
    }
    @Override
    public void setRequest(HttpServletRequest r) {
        this.Request = r;
    }

    @Override
    public void setResponse(HttpServletResponse r) {
        this.Response = r;    
    }
    
}
