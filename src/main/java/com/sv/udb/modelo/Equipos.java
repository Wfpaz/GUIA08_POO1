/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.modelo;

import java.awt.Image;

/**
 *
 * @author Walter
 */
public class Equipos {
    private int codiEquipos;
    private String nombEquipo, descEquipo;
    byte[] imagen;

    public Equipos() {
    }

    public Equipos(int codiEquipos, String nombEquipo, String descEquipo, byte[] imagen) {
        this.codiEquipos = codiEquipos;
        this.nombEquipo = nombEquipo;
        this.descEquipo = descEquipo;
        this.imagen = imagen;
    }

    public int getCodiEquipos() {
        return codiEquipos;
    }

    public void setCodiEquipo(int codiEquipo) {
        this.codiEquipos = codiEquipo;
    }

    public String getNombEquipo() {
        return nombEquipo;
    }

    public void setNombEquipo(String nombEquipo) {
        this.nombEquipo = nombEquipo;
    }

    public String getDescEquipo() {
        return descEquipo;
    }

    public void setDescEquipo(String descEquipo) {
        this.descEquipo = descEquipo;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    @Override
    public String toString() {
        return this.nombEquipo;
    }
}
