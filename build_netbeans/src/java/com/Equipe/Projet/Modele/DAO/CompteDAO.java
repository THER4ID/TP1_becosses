package com.Equipe.Projet.Modele.DAO;

import com.Equipe.Projet.Modele.Classes.Compte;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Le Paré
 */
public class CompteDAO extends DAO<Compte> {

    public CompteDAO(Connection cnx) {
        super(cnx);
    }

    @Override
    public boolean create(Compte x) {
        		String req = "INSERT INTO compte (`COURRIEL` , `MOTDEPASSE` , `AGE`,`VILLE`, `NOM` , `PRENOM` ) "+
			     "VALUES (?,?,?,?,?,?)";
		PreparedStatement stm = null;
		try 
		{
			stm = cnx.prepareStatement(req);
                        stm.setString(1,x.getCourriel());
                        stm.setString(2,x.getMotDePasse());
                        stm.setInt(3,x.getAge());
                        stm.setString(4,x.getVille());
                        stm.setString(5,x.getNom());
                        stm.setString(6,x.getPrenom());
			int n= stm.executeUpdate();
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

    
    
    public Compte FindByCourriel(String courriel) {
        PreparedStatement stm = null;
        ResultSet r = null;
        
        try
        {
            String req ="SELECT * FROM compte WHERE Courriel =?";
            stm = cnx.prepareStatement(req);
            stm.setString(1,courriel);
            r = stm.executeQuery();
            if(r.next())
            {
                Compte c = new Compte();
                c.setIdCompte(r.getInt("IdCompte"));
                c.setCourriel(r.getString("Courriel"));
                c.setMotDePasse(r.getString("MotDePasse"));
                c.setNom(r.getString("Nom"));
                c.setPrenom(r.getString("Prenom"));
                c.setAge(r.getInt("Age"));
                c.setVille(r.getString("Ville"));
                r.close();
                stm.close();
                return c;
                
            }
        }
        catch(SQLException exp)
        {
        }
        finally
        {
            if (stm!=null)
            {
                try
                {
                    r.close();
                    stm.close();
                }
                catch(SQLException e)
                {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }
    
    
        public Compte FindById(int id) {
        PreparedStatement stm = null;
        ResultSet r = null;
        
        try
        {
            String req ="SELECT * FROM compte WHERE IdCompte =?";
            stm = cnx.prepareStatement(req);
            stm.setInt(1,id);
            r = stm.executeQuery();
            if(r.next())
            {
                Compte c = new Compte();
                c.setIdCompte(r.getInt("IdCompte"));
                c.setCourriel(r.getString("Courriel"));
                c.setMotDePasse(r.getString("MotDePasse"));
                c.setNom(r.getString("Nom"));
                c.setPrenom(r.getString("Prenom"));
                c.setAge(r.getInt("Age"));
                c.setVille(r.getString("Ville"));
                r.close();
                stm.close();
                return c;
                
            }
        }
        catch(SQLException exp)
        {
        }
        finally
        {
            if (stm!=null)
            {
                try
                {
                    r.close();
                    stm.close();
                }
                catch(SQLException e)
                {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }
    
    @Override
    public List<Compte> findAll() {
        List<Compte> liste = new LinkedList();
        
        try
        {
           Statement stm = cnx.createStatement();
           ResultSet r = stm.executeQuery("SELECT * FROM Compte");
           while(r.next())
           {
                Compte c = new Compte();
                c.setIdCompte(r.getInt("IdCompte"));
                c.setCourriel(r.getString("Courriel"));
                c.setMotDePasse(r.getString("MotDePasse"));
                c.setNom(r.getString("Nom"));
                c.setPrenom(r.getString("Prenom"));
                c.setAge(r.getInt("Age"));
                c.setVille(r.getString("Ville"));   
                liste.add(c);
           }
           r.close();
           stm.close();
        }
        catch(SQLException exp)
        {
        
        }
        return liste;
    }

    @Override
    public Compte read(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Compte read(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Compte x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Compte x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}