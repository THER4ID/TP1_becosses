/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Equipe.Projet.Modele.DAO;

import com.Equipe.Projet.Modele.Classes.Toilette;
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
public class ToiletteDAO extends DAO<Toilette> {

    public ToiletteDAO(Connection cnx) {
        super(cnx);
    }

    @Override
    public boolean create(Toilette t) {
        String req = "INSERT INTO toilette (`IDCOMPTE` , `LONGITUDE` , `LATITUDE`,`DESCRIPTION`, `ETAT` , `TYPEDESERVICE` ) "+
			     "VALUES (?,?,?,?,?,?)";
		//System.out.println("REQUETE "+req);
		PreparedStatement stm = null;
		try 
		{
			stm = cnx.prepareStatement(req);
                        stm.setInt(1,t.getCompteId());
                        stm.setDouble(2,t.getLongitude());
                        stm.setDouble(3,t.getLatitude());
                        stm.setString(4,t.getDescription());
                        stm.setInt(5,t.getEtat());
                        stm.setInt(6,t.getTypeDeService());
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
    
    public List<Toilette> findToiletteByCompte(int id) throws SQLException{
        
        List<Toilette> liste = new LinkedList<>();
        try{
            PreparedStatement stm = null;
            String req = "SELECT * FROM toilette WHERE IdCompte=?";
            stm = cnx.prepareStatement(req);
            stm.setInt(1, id);
            ResultSet r = stm.executeQuery();           
            while(r.next())
            {
                Toilette t = new Toilette();
                t.setId(r.getInt("IdToilette"));
                t.setCompteId(r.getInt("IdCompte"));
                t.setLongitude(r.getDouble("Longitude"));
                t.setLatitude(r.getDouble("Latitude"));
                t.setDescription(r.getString("Description"));
                t.setEtat(Integer.parseInt(r.getString("Etat")));
                t.setTypeDeService(Integer.parseInt(r.getString("TypeDeService")));
                liste.add(t);        
            }
            r.close();
            stm.close();
        }
        catch(SQLException e){
        
        
        }
        
        return liste;
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
