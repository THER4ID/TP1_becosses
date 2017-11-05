/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

import com.Equipe.Projet.Modele.Classes.Toilette;
import com.Equipe.Projet.Modele.DAO.ToiletteDAO;
import com.Equipe.Projet.Modele.Util.Connexion;
import java.io.IOException;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Le Paré
 */
public class CreerLieuAjaxAction implements AjaxAction, RequestAware, Action  {
    private HttpServletRequest Request;
    private HttpServletResponse Response;
    @Override
    public String execute() {
        String valider = "False";
        Toilette tempToilette = new Toilette();
        tempToilette.setCompteId(Integer.parseInt(Request.getParameter("CompteId")));
        tempToilette.setEtat(Integer.parseInt(Request.getParameter("Etat")));
        tempToilette.setTypeDeService(Integer.parseInt(Request.getParameter("TypeDeService")));
        tempToilette.setLatitude(Double.parseDouble(Request.getParameter("Latitude")));
        tempToilette.setLongitude(Double.parseDouble(Request.getParameter("Longitude")));
        tempToilette.setDescription(Request.getParameter("Description"));
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnx;
            cnx = Connexion.getInstance();
            ToiletteDAO daoToilette = new ToiletteDAO(cnx);
            if(daoToilette.create(tempToilette)){
                return "True";
            }else {
                return "False";
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreerLieuAjaxAction.class.getName()).log(Level.SEVERE, null, ex);         
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
