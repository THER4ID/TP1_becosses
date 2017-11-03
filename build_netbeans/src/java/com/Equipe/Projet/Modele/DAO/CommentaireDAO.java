/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Modele.DAO;

import com.Equipe.Projet.Modele.Classes.Commentaire;
import com.Equipe.Projet.Modele.Classes.Compte;
import com.Equipe.Projet.Modele.Classes.Toilette;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Le Paré
 */
public class CommentaireDAO extends DAO<Commentaire> {

    public CommentaireDAO(Connection cnx) {
        super(cnx);
    }

    @Override
    public boolean create(Commentaire c) {
        String req = "INSERT INTO commentaire (`IDCOMPTE` , `IDTOILETTE` , `TEXTE`) "+
			     "VALUES ('"+c.getIdCompteCreateur()+"','"+c.getIdLieuCommenter()+"','"+c.getTexte()+"')";
		Statement stm = null;
		try 
		{
			stm = cnx.createStatement(); 
			int n= stm.executeUpdate(req);
			if (n>0)
			{
				stm.close();
				return true;
			}
		}
		catch (SQLException exp)
		{
		}
		finally
		{
			if (stm!=null)
			try {
				stm.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		return false;
    }
    public List<Commentaire> FindByIdDeLieu(int idLieu){
		List<Commentaire> liste = new LinkedList<>();
		try 
		{
			Statement stmCommentaire = cnx.createStatement();                       
			ResultSet resCommentaire = stmCommentaire.executeQuery("SELECT * FROM commentaire WHERE IdToilette ='"+idLieu+"'");

			while (resCommentaire.next())
			{
                                Commentaire c = new Commentaire();
                                c.setIdCommentaire(resCommentaire.getInt("IdCommentaire"));
                                c.setIdCompteCreateur(resCommentaire.getInt("IdCompte"));
                                c.setTexte(resCommentaire.getString("Texte"));
                                c.setIdLieuCommenter(resCommentaire.getInt("IdToilette"));
				liste.add(c);
			}
			resCommentaire.close();
			stmCommentaire.close();
		}
		catch (SQLException exp)
		{
		}
		return liste;
	}

                

    @Override
    public Commentaire read(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Commentaire read(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Commentaire x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Commentaire x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Commentaire> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
