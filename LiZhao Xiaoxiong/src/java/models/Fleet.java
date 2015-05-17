/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Victor
 */
@Entity
@Table(name = "fleet")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fleet.findAll", query = "SELECT f FROM Fleet f"),
    @NamedQuery(name = "Fleet.findByFleetID", query = "SELECT f FROM Fleet f WHERE f.fleetID = :fleetID"),
    @NamedQuery(name = "Fleet.findByAircraft", query = "SELECT f FROM Fleet f WHERE f.aircraft = :aircraft"),
    @NamedQuery(name = "Fleet.findByInService", query = "SELECT f FROM Fleet f WHERE f.inService = :inService"),
    @NamedQuery(name = "Fleet.findByFirstClass", query = "SELECT f FROM Fleet f WHERE f.firstClass = :firstClass"),
    @NamedQuery(name = "Fleet.findByBusinessClass", query = "SELECT f FROM Fleet f WHERE f.businessClass = :businessClass"),
    @NamedQuery(name = "Fleet.findByPremiumClass", query = "SELECT f FROM Fleet f WHERE f.premiumClass = :premiumClass"),
    @NamedQuery(name = "Fleet.findByEconomyClass", query = "SELECT f FROM Fleet f WHERE f.economyClass = :economyClass"),
    @NamedQuery(name = "Fleet.findByTotal", query = "SELECT f FROM Fleet f WHERE f.total = :total")})
public class Fleet implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "fleetID")
    private Integer fleetID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    @Column(name = "aircraft")
    private String aircraft;
    @Basic(optional = false)
    @NotNull
    @Column(name = "inService")
    private int inService;
    @Basic(optional = false)
    @NotNull
    @Column(name = "firstClass")
    private int firstClass;
    @Basic(optional = false)
    @NotNull
    @Column(name = "businessClass")
    private int businessClass;
    @Basic(optional = false)
    @NotNull
    @Column(name = "premiumClass")
    private int premiumClass;
    @Basic(optional = false)
    @NotNull
    @Column(name = "economyClass")
    private int economyClass;
    @Basic(optional = false)
    @NotNull
    @Column(name = "total")
    private int total;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fleetID")
    private List<Seat> seatList;

    public Fleet() {
    }

    public Fleet(Integer fleetID) {
        this.fleetID = fleetID;
    }

    public Fleet(Integer fleetID, String aircraft, int inService, int firstClass, int businessClass, int premiumClass, int economyClass, int total) {
        this.fleetID = fleetID;
        this.aircraft = aircraft;
        this.inService = inService;
        this.firstClass = firstClass;
        this.businessClass = businessClass;
        this.premiumClass = premiumClass;
        this.economyClass = economyClass;
        this.total = total;
    }

    public Integer getFleetID() {
        return fleetID;
    }

    public void setFleetID(Integer fleetID) {
        this.fleetID = fleetID;
    }

    public String getAircraft() {
        return aircraft;
    }

    public void setAircraft(String aircraft) {
        this.aircraft = aircraft;
    }

    public int getInService() {
        return inService;
    }

    public void setInService(int inService) {
        this.inService = inService;
    }

    public int getFirstClass() {
        return firstClass;
    }

    public void setFirstClass(int firstClass) {
        this.firstClass = firstClass;
    }

    public int getBusinessClass() {
        return businessClass;
    }

    public void setBusinessClass(int businessClass) {
        this.businessClass = businessClass;
    }

    public int getPremiumClass() {
        return premiumClass;
    }

    public void setPremiumClass(int premiumClass) {
        this.premiumClass = premiumClass;
    }

    public int getEconomyClass() {
        return economyClass;
    }

    public void setEconomyClass(int economyClass) {
        this.economyClass = economyClass;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @XmlTransient
    public List<Seat> getSeatList() {
        return seatList;
    }

    public void setSeatList(List<Seat> seatList) {
        this.seatList = seatList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (fleetID != null ? fleetID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Fleet)) {
            return false;
        }
        Fleet other = (Fleet) object;
        if ((this.fleetID == null && other.fleetID != null) || (this.fleetID != null && !this.fleetID.equals(other.fleetID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Fleet[ fleetID=" + fleetID + " ]";
    }
    
}
