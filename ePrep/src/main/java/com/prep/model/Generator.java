package com.prep.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "generator")
@SecondaryTable(name="equipment")
public class Generator {

	
		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		private Long id;
		
		
		@Column(table = "equipment")
		private String equipType = "trailer";
		
		@JsonIgnore
		@OneToOne
		@MapsId
		private Trailers trailer;
		
		private String genName;
		private Long hours;
		private String lastService; // date
		private Long lastServiceHours;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public Trailers getTrailer() {
			return trailer;
		}
		public void setTrailer(Trailers trailer) {
			this.trailer = trailer;
		}
		public String getGenName() {
			return genName;
		}
		public void setGenName(String genName) {
			this.genName = genName;
		}
		public Long getHours() {
			return hours;
		}
		public void setHours(Long hours) {
			this.hours = hours;
		}
		public String getLastService() {
			return lastService;
		}
		public void setLastService(String lastService) {
			this.lastService = lastService;
		}
		public Long getLastServiceHours() {
			return lastServiceHours;
		}
		public void setLastServiceHours(Long lastServiceHours) {
			this.lastServiceHours = lastServiceHours;
		}
		public String getEquipType() {
			return equipType;
		}
		public void setEquipType(String equipType) {
			this.equipType = equipType;
		}
		@Override
		public String toString() {
			return "Generator [id=" + id + ", trailer=" + trailer + ", genName=" + genName + ", hours=" + hours
					+ ", lastService=" + lastService + ", lastServiceHours=" + lastServiceHours + "]";
		}
		
		
		
		
}
