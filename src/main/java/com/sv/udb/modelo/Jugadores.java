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
public class Jugadores {
    private int codJugador, codEquipo, edad;
    private double altura, peso;
    private String nomJugador;

    public Jugadores() {
    }

    public Jugadores(int codJugador, int codEquipo, int edad, double altura, double peso, String nomJugador) {
        this.codJugador = codJugador;
        this.codEquipo = codEquipo;
        this.edad = edad;
        this.altura = altura;
        this.peso = peso;
        this.nomJugador = nomJugador;
    }

    public int getCodJugador() {
        return codJugador;
    }

    public void setCodJugador(int codJugador) {
        this.codJugador = codJugador;
    }

    public int getCodEquipo() {
        return codEquipo;
    }

    public void setCodEquipo(int codEquipo) {
        this.codEquipo = codEquipo;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public String getNomJugador() {
        return nomJugador;
    }

    public void setNomJugador(String nomJugador) {
        this.nomJugador = nomJugador;
    }

    @Override
    public String toString() {
        return this.nomJugador;
    }
    
}
