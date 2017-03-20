/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.controlador;

import com.sv.udb.modelo.Partidos;
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
public class PartidosCtrl {    
    public boolean guardar(Partidos Obje) {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("INSERT INTO partidos VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);");
            cmd.setString(1, String.valueOf(Obje.getCodEquipo1()));
            cmd.setString(2, String.valueOf(Obje.getCodEquipo2()));
            cmd.setString(3, String.valueOf(Obje.getMarcador1()));
            cmd.setString(4, String.valueOf(Obje.getMarcador2()));
            cmd.setString(5, Obje.getFecha());
            cmd.setString(6, Obje.getHora());
            cmd.setString(7, Obje.getLugar());
            System.err.println("La consulta es: " + cmd.toString());
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
    
    public List<Partidos> consTodo(){ 
        List<Partidos> resp = new ArrayList();
       Connection cn = new Conexion().getConn();
        try
        {
            PreparedStatement cmd = cn.prepareStatement("SELECT * FROM partidos");
            ResultSet rs = cmd.executeQuery();
            while(rs.next())
            {
                resp.add(new Partidos(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8)));
                            //Partidos(int1, int2, int3, int4, int5, String6, String7, String8)
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
    
    public boolean eliminar(Partidos obje) {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("DELETE FROM partidos WHERE id_partidos = ?");
            cmd.setString(1, String.valueOf(obje.getCodPartidos()));
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
    
    public boolean modificar(Partidos obje) {
        boolean resp = false;
        Connection cn = new Conexion().getConn();
        try {
            PreparedStatement cmd = cn.prepareStatement("UPDATE partidos"
                    + " SET id_equipo1=?, id_equipo2=?, marcador_1=?, marcador_2=?, fecha=?, hora=?, lugar=? "
                    + "WHERE id_partidos=?");
            cmd.setString(1, String.valueOf(obje.getCodEquipo1()));
            cmd.setString(2, String.valueOf(obje.getCodEquipo2()));
            cmd.setString(3, String.valueOf(obje.getMarcador1()));
            cmd.setString(4, String.valueOf(obje.getMarcador2()));
            cmd.setString(5, obje.getFecha());
            cmd.setString(6, obje.getHora());
            cmd.setString(7, obje.getLugar());
            cmd.setString(8, String.valueOf(obje.getCodPartidos()));
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
}
