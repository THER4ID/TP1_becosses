/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

import com.Equipe.Projet.Modele.Classes.Commentaire;
import com.Equipe.Projet.Modele.DAO.CommentaireDAO;
import com.Equipe.Projet.Modele.Util.Connexion;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Le Paré
 */
public class CommenterUnLieuAjaxAction implements AjaxAction, RequestAware, Action {
    private HttpServletRequest Request;
    private HttpServletResponse Response;
    @Override
    public String execute() {
        Commentaire comm = new Commentaire();
        comm.setIdCompteCreateur(Integer.parseInt(Request.getParameter("idCompteConnecte")));
        comm.setIdLieuCommenter(Integer.parseInt(Request.getParameter("idLieu")));
        comm.setTexte(Request.getParameter("TexteCommentaire"));
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx;
            cnx = Connexion.getInstance();
            CommentaireDAO commDAO = new CommentaireDAO(cnx);
            if(commDAO.create(comm)){
                return "True";
            }else
                 return "False";
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CommenterUnLieuAjaxAction.class.getName()).log(Level.SEVERE, null, ex);
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
