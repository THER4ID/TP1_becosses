/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

import com.Equipe.Projet.Modele.Classes.Commentaire;
import com.Equipe.Projet.Modele.DAO.CommentaireDAO;
import com.Equipe.Projet.Modele.Util.Connexion;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Le Paré
 */
public class ListeCommentaireAjaxAction implements AjaxAction, RequestAware, Action {
    private HttpServletRequest Request;
    private HttpServletResponse Response;

    
    @Override
    public String execute() {
        // On va chercher l'id du lieu commenté 
        int idLieu = Integer.parseInt(Request.getParameter("idLieu"));
        List<Commentaire> liste = new LinkedList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx;
            cnx = Connexion.getInstance();
            CommentaireDAO daoCommentaire = new CommentaireDAO(cnx);
            liste = daoCommentaire.FindByIdDeLieu(idLieu);
            String json = new Gson().toJson(liste);
            Response.getWriter().write(json);
            return "True";
        } catch (ClassNotFoundException | IOException ex) {
            Logger.getLogger(ListeCommentaireAjaxAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "False";
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
