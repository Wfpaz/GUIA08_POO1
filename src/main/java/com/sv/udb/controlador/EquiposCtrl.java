/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.Equipos;
import com.sv.udb.recursos.Conexion;
import java.io.File;
import java.io.FileInputStream;
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
public class EquiposCtrl {
    
    public boolean guardar(Equipos Obje) {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("INSERT INTO equipos VALUES(NULL,?,?,?)");
            cmd.setString(1, Obje.getNombEquipo());
            cmd.setString(2, Obje.getDescEquipo());
            cmd.setString(3, String.valueOf(Obje.getImagen()));
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
    
    public List<Equipos> consTodo(){ 
        List<Equipos> resp = new ArrayList();
       Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("SELECT * FROM equipos");
            ResultSet rs = cmd.executeQuery();
            while(rs.next())
            {
                resp.add(new Equipos(rs.getInt(1),rs.getString(2),rs.getString(3)));
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

    public boolean eliminar(Equipos obje) {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("DELETE FROM equipos WHERE codi_equi = ?");
            cmd.setString(1, String.valueOf(obje.getCodiEquipos()));
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

    public boolean modificar(Equipos obje) {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("UPDATE equipos SET nomb_equi = ?, desc_equi = ? WHERE codi_equi = ?");
            cmd.setString(1, obje.getNombEquipo());
            cmd.setString(2, obje.getDescEquipo());
            cmd.setString(3, String.valueOf(obje.getCodiEquipos()));
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
    
    public Equipos consUno(int id){
        Equipos resp = new Equipos();
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("Select * from equipos where codi_equi = ?");
            cmd.setInt(1, id);
            ResultSet rs = cmd.executeQuery();
            while (rs.next())
            {
                resp.setCodiEquipo(rs.getInt(1));
                resp.setNombEquipo(rs.getString(2));
                resp.setDescEquipo(rs.getString(3));
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
