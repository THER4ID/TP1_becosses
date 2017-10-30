/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Modele.DAO;

import com.Equipe.Projet.Modele.Classes.Compte;
import com.Equipe.Projet.Modele.Classes.Toilette;
import com.Equipe.Projet.Modele.Util.Connexion;
import com.google.gson.Gson;
import java.sql.Connection;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Le Paré
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Connection cnx;
       cnx = Connexion.getInstance();
       ToiletteDAO daoToilette = new ToiletteDAO(cnx);
       List<Toilette> liste = new LinkedList<>();
       liste = daoToilette.findAll();
       String json = new Gson().toJson(liste);
       System.out.println(json);
       //CompteDAO dao = new CompteDAO(cnx);
       //Compte cpt = new Compte(1,"f@mail.com","f","Pare","Francis",13,"Montreal");
      // System.out.println(dao.create(cpt));
    }
    
}
