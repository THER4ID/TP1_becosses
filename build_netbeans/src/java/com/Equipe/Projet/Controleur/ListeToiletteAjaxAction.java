/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

import com.Equipe.Projet.Modele.Classes.Toilette;
import com.Equipe.Projet.Modele.DAO.ToiletteDAO;
import com.Equipe.Projet.Modele.Util.Connexion;
import com.google.gson.Gson;
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
public class ListeToiletteAjaxAction implements AjaxAction, RequestAware, Action {
    private HttpServletRequest Request;
    private HttpServletResponse Response;
    
    @Override
    public String execute() {
        String json = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx;
            cnx = Connexion.getInstance();
            ToiletteDAO daoToilette = new ToiletteDAO(cnx);
            List<Toilette> liste = new LinkedList<>();
            liste = daoToilette.findAll();
            json = new Gson().toJson(liste);
            System.out.println("Je suis ici");
            return json;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListeToiletteAjaxAction.class.getName()).log(Level.SEVERE, null, ex);
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
