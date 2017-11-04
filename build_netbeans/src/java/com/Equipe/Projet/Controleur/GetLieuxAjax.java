/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

import com.Equipe.Projet.Modele.Classes.Compte;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author b0ss
 */
public class GetLieuxAjax implements AjaxAction, RequestAware, Action {
    
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
        
        int idCompte = Integer.parseInt(Request.getParameter("idCompte"));
        Compte cpt = new Compte();
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
