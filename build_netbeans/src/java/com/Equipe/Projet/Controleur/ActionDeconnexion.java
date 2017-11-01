/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author usager
 */
public class ActionDeconnexion implements RequestAware, Action{
    
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
        HttpSession session = Request.getSession(true);
        session.removeAttribute("IdConnect"); 
        return "/index.jsp";      
    }
    
}
