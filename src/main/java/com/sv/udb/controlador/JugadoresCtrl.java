/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.Jugadores;
import com.sv.udb.recursos.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Walter
 */
public class JugadoresCtrl {
    public boolean guardar(Jugadores Obje) {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("INSERT INTO jugadores VALUES (NULL, ?, ?, ?, ?, ?)");
            cmd.setString(1, String.valueOf(Obje.getCodEquipo()));
            cmd.setString(2, Obje.getNomJugador());
            cmd.setString(3, String.valueOf(Obje.getEdad()));
            cmd.setString(4, String.valueOf(Obje.getAltura()));
            cmd.setString(5, String.valueOf(Obje.getPeso()));
            
            cmd.executeUpdate();
            resp = true;
        } catch (Exception e) {
            System.err.println("Error al guardar los datos: " + e.getMessage());
        }
        finally {
            try {
                if (cn!=null) {
                    if (!cn.isClosed()) {
                        cn.close();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resp;
    }
    
    public List<Jugadores> consTodo(){ 
        List<Jugadores> resp = new ArrayList();
       Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("SELECT * FROM jugadores");
            ResultSet rs = cmd.executeQuery();
            while(rs.next())
            {
                resp.add(new Jugadores(rs.getInt(1),rs.getInt(2),rs.getInt(4),rs.getDouble(5),rs.getDouble(6),rs.getString(3)));
                            //Jugadores(int codJugador, int codEquipo, int edad, double altura, double peso, String nomJugador)
            }
        }
        catch(Exception err)
        {
            err.printStackTrace();
        }
        finally
        {
            try
            {
                if(cn!=null)
                {
                    if(!cn.isClosed())
                    {
                        cn.close();
                    }
                }
            }
            catch(SQLException err)
            {
                err.printStackTrace();
            }
        }
        return resp;
    }

    public boolean eliminar(Jugadores obje) {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("DELETE FROM jugadores WHERE codi_juga = ?");
            cmd.setString(1, String.valueOf(obje.getCodJugador()));
            cmd.executeUpdate();
            resp = true;
        } catch (Exception e) {
            System.err.println("Error al eliminar los datos: " + e.getMessage());
        }
        finally {
            try {
                if (cn!=null) {
                    if (!cn.isClosed()) {
                        cn.close();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resp;
    }

    public boolean modificar(Jugadores obje) {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("UPDATE jugadores SET codi_equi=?, nomb_juga=?, edad_juga=?, altu_juga=?, peso_juga=? WHERE codi_juga = ?");
            cmd.setString(1, String.valueOf(obje.getCodEquipo()));
            cmd.setString(2, obje.getNomJugador());
            cmd.setString(3, String.valueOf(obje.getEdad()));
            cmd.setString(4, String.valueOf(obje.getAltura()));
            cmd.setString(5, String.valueOf(obje.getPeso()));
            cmd.setString(6, String.valueOf(obje.getCodJugador()));
            cmd.executeUpdate();
            resp = true;
        } catch (Exception e) {
            System.err.println("Error al actualizar los datos: " + e.getMessage());
        }
        finally {
            try {
                if (cn!=null) {
                    if (!cn.isClosed()) {
                        cn.close();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resp;
    }
    
    public Jugadores consUno(int id){
        Jugadores resp = new Jugadores();
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("Select * from jugadores where codi_juga = ?");
            cmd.setInt(1, id);
            ResultSet rs = cmd.executeQuery();
            while (rs.next())
            {
                resp.setCodEquipo(rs.getInt(1));
                resp.setNomJugador(rs.getString(2));
                resp.setEdad(rs.getInt(3));
                resp.setAltura(rs.getDouble(4));
                resp.setPeso(rs.getDouble(5));
            }
        } catch (Exception ex) {
            System.err.println("Error: " + ex.getMessage());
        }
        finally 
        {
            try 
            {
                if (cn!=null)
                {
                    if (!cn.isClosed())
                    {
                        cn.close();
                    }
                }
            } 
            catch (Exception e) 
            {
                System.err.println("Error: " + e.getMessage());
            }
        }
        return resp;
    }
}
