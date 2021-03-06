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
public class ActionBuilder {
    public static Action getAction(String actionName) {
        if (actionName != null)
            switch (actionName) {
                case "CreerCompte":
                    return new CreerCompteAction();
                case "ListeToiletteAjax":
                    return new ListeToiletteAjaxAction();
                case "CreerLieuAjax":
                    return new CreerLieuAjaxAction();
                case "connection":
                    return new LoginAction();
                case "deconnexion":
                    return new ActionDeconnexion();
                case "creation":
                    return new CreerCompteAction();
                case"ListeCommentaireAjax":
                    return new ListeCommentaireAjaxAction();
                case "GetCompteAjax":
                    return new GetCompteAjaxAction();
                case "CommenterUnLieuAjax":
                    return new CommenterUnLieuAjaxAction();
            }
        return new DefaultAction();
    }
}
