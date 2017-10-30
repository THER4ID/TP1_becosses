/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Modele.DAO;

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
public class ToiletteDAO extends DAO<Toilette> {

    public ToiletteDAO(Connection cnx) {
        super(cnx);
    }

    @Override
    public boolean create(Toilette t) {
        String req = "INSERT INTO toilette (`IDCOMPTE` , `LONGITUDE` , `LATITUDE`,`DESCRIPTION`, `ETAT` , `TYPEDESERVICE` ) "+
			     "VALUES ('"+t.getCompteId()+"','"+t.getLongitude()+"','"+t.getLatitude()+"','"+t.getDescription()+"','"+
                             t.getEtat()+"','"+t.getTypeDeService()+"')";
		//System.out.println("REQUETE "+req);
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
    

    @Override
    public Toilette read(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Toilette read(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Toilette x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Toilette x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Toilette> findAll() {
		List<Toilette> liste = new LinkedList<>();
		try 
		{
			Statement stm = cnx.createStatement(); 
			ResultSet r = stm.executeQuery("SELECT * FROM toilette");
			while (r.next())
			{
				Toilette t = new Toilette();
                                t.setCompteId(Integer.parseInt(r.getString("IdCompte")));
                                t.setDescription(r.getString("Description"));
                                t.setEtat(Integer.parseInt(r.getString("Etat")));
                                t.setId(Integer.parseInt(r.getString("IdToilette")));
                                t.setLatitude(Double.parseDouble(r.getString("Latitude")));
                                t.setLongitude(Double.parseDouble(r.getString("Longitude")));
                                t.setTypeDeService(Integer.parseInt(r.getString("TypeDeService")));
				liste.add(t);
			}
			r.close();
			stm.close();
		}
		catch (SQLException exp)
		{
		}
		return liste;
	}
    
}
