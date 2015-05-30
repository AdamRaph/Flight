/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Victor
 */
@Entity
@Table(name = "ticket")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ticket.findAll", query = "SELECT t FROM Ticket t"),
    @NamedQuery(name = "Ticket.findByTicketID", query = "SELECT t FROM Ticket t WHERE t.ticketID = :ticketID"),
    @NamedQuery(name = "Ticket.findBySourceAirport", query = "SELECT t FROM Ticket t WHERE t.sourceAirport = :sourceAirport"),
    @NamedQuery(name = "Ticket.findByDestinationAirport", query = "SELECT t FROM Ticket t WHERE t.destinationAirport = :destinationAirport"),
    @NamedQuery(name = "Ticket.findByDepartTime", query = "SELECT t FROM Ticket t WHERE t.departTime = :departTime"),
    @NamedQuery(name = "Ticket.findByArriveTime", query = "SELECT t FROM Ticket t WHERE t.arriveTime = :arriveTime"),
    @NamedQuery(name = "Ticket.findByPayed", query = "SELECT t FROM Ticket t WHERE t.payed = :payed")})
public class Ticket implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ticketID")
    private Integer ticketID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "sourceAirport")
    private String sourceAirport;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "destinationAirport")
    private String destinationAirport;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "departTime")
    private String departTime;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "arriveTime")
    private String arriveTime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "payed")
    private boolean payed;
    @JoinColumn(name = "seat_number", referencedColumnName = "seat_number")
    @ManyToOne(optional = false)
    private Seat seatNumber;
    @JoinColumn(name = "scheduleID", referencedColumnName = "scheduleID")
    @ManyToOne(optional = false)
    private Schedule scheduleID;
    @JoinColumn(name = "customer_id", referencedColumnName = "customer_id")
    @ManyToOne(optional = false)
    private Customer customerId;

    public Ticket() {
    }

    public Ticket(Integer ticketID) {
        this.ticketID = ticketID;
    }

    public Ticket(Integer ticketID, String sourceAirport, String destinationAirport, String departTime, String arriveTime, boolean payed) {
        this.ticketID = ticketID;
        this.sourceAirport = sourceAirport;
        this.destinationAirport = destinationAirport;
        this.departTime = departTime;
        this.arriveTime = arriveTime;
        this.payed = payed;
    }

    public Integer getTicketID() {
        return ticketID;
    }

    public void setTicketID(Integer ticketID) {
        this.ticketID = ticketID;
    }

    public String getSourceAirport() {
        return sourceAirport;
    }

    public void setSourceAirport(String sourceAirport) {
        this.sourceAirport = sourceAirport;
    }

    public String getDestinationAirport() {
        return destinationAirport;
    }

    public void setDestinationAirport(String destinationAirport) {
        this.destinationAirport = destinationAirport;
    }

    public String getDepartTime() {
        return departTime;
    }

    public void setDepartTime(String departTime) {
        this.departTime = departTime;
    }

    public String getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(String arriveTime) {
        this.arriveTime = arriveTime;
    }

    public boolean getPayed() {
        return payed;
    }

    public void setPayed(boolean payed) {
        this.payed = payed;
    }

    public Seat getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(Seat seatNumber) {
        this.seatNumber = seatNumber;
    }

    public Schedule getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(Schedule scheduleID) {
        this.scheduleID = scheduleID;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ticketID != null ? ticketID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ticket)) {
            return false;
        }
        Ticket other = (Ticket) object;
        if ((this.ticketID == null && other.ticketID != null) || (this.ticketID != null && !this.ticketID.equals(other.ticketID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Ticket[ ticketID=" + ticketID + " ]";
    }
    
}
