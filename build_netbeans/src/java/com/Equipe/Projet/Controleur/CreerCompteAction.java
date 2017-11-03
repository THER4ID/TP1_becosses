/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

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
        String motdepasse = Request.getParameter("mdp");
        
        
        
        return "/PageConnexion.jsp";
    }
    
}
