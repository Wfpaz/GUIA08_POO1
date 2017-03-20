/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.modelo;

/**
 *
 * @author Walter
 */
public class Partidos {
    int CodPartidos, CodEquipo1, CodEquipo2, Marcador1, Marcador2;
    String Fecha, Hora, Lugar;

    public Partidos() {
    }

    public Partidos(int CodPartidos, int CodEquipo1, int CodEquipo2, int Marcador1, int Marcador2, String Fecha, String Hora, String Lugar) {
        this.CodPartidos = CodPartidos;
        this.CodEquipo1 = CodEquipo1;
        this.CodEquipo2 = CodEquipo2;
        this.Marcador1 = Marcador1;
        this.Marcador2 = Marcador2;
        this.Fecha = Fecha;
        this.Hora = Hora;
        this.Lugar = Lugar;
    }

    public int getCodPartidos() {
        return CodPartidos;
    }

    public void setCodPartidos(int CodPartidos) {
        this.CodPartidos = CodPartidos;
    }

    public int getCodEquipo1() {
        return CodEquipo1;
    }

    public void setCodEquipo1(int CodEquipo1) {
        this.CodEquipo1 = CodEquipo1;
    }

    public int getCodEquipo2() {
        return CodEquipo2;
    }

    public void setCodEquipo2(int CodEquipo2) {
        this.CodEquipo2 = CodEquipo2;
    }

    public int getMarcador1() {
        return Marcador1;
    }

    public void setMarcador1(int Marcador1) {
        this.Marcador1 = Marcador1;
    }

    public int getMarcador2() {
        return Marcador2;
    }

    public void setMarcador2(int Marcador2) {
        this.Marcador2 = Marcador2;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getHora() {
        return Hora;
    }

    public void setHora(String Hora) {
        this.Hora = Hora;
    }

    public String getLugar() {
        return Lugar;
    }

    public void setLugar(String Lugar) {
        this.Lugar = Lugar;
    }

    @Override
    public String toString() {
        return Lugar;
    }  
}
