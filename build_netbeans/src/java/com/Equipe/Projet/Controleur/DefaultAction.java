/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Controleur;

/**
 *
 * @author Le Paré
 */
public class DefaultAction implements Action{

    @Override
    public String execute() {
        return "/index.jsp";
    }
    
}
