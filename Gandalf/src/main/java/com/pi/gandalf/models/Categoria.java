package com.pi.gandalf.models;
// Generated 07/10/2017 20:49:51 by Hibernate Tools 4.3.1


import com.google.gson.annotations.Expose;
import java.util.HashSet;
import java.util.Set;

/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     @Expose(serialize = true)
     private int idCategoria;
     @Expose(serialize = true)
     private String nomeCategoria;
     @Expose(serialize = true)
     private String descCategoria;
     @Expose(serialize = false)
     private Set produtos = new HashSet(0);

    public Categoria() {
    }

	
    public Categoria(int idCategoria, String nomeCategoria) {
        this.idCategoria = idCategoria;
        this.nomeCategoria = nomeCategoria;
    }
    public Categoria(int idCategoria, String nomeCategoria, String descCategoria, Set produtos) {
       this.idCategoria = idCategoria;
       this.nomeCategoria = nomeCategoria;
       this.descCategoria = descCategoria;
       this.produtos = produtos;
    }
   
    public int getIdCategoria() {
        return this.idCategoria;
    }
    
    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    public String getNomeCategoria() {
        return this.nomeCategoria;
    }
    
    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }
    public String getDescCategoria() {
        return this.descCategoria;
    }
    
    public void setDescCategoria(String descCategoria) {
        this.descCategoria = descCategoria;
    }
    public Set getProdutos() {
        return this.produtos;
    }
    
    public void setProdutos(Set produtos) {
        this.produtos = produtos;
    }




}

