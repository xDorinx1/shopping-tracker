package org.example.shoppingtracker;

import jakarta.persistence.*;

@Entity
public class ShoppingItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String obiect;
    private Double cost;
    private String categorie;

    // Constructor gol cerut de JPA
    public ShoppingItem() {}

    // Getters si Setters manuali (fara Lombok)
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getObiect() { return obiect; }
    public void setObiect(String obiect) { this.obiect = obiect; }

    public Double getCost() { return cost; }
    public void setCost(Double cost) { this.cost = cost; }

    public String getCategorie() { return categorie; }
    public void setCategorie(String categorie) { this.categorie = categorie; }
}