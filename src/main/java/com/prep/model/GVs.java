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
@Table(name= "gvs")
@SecondaryTable(name="equipment")
public class GVs {

	
		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		private Long id;
		
		@Column(table = "equipment")
		private String equipType = "GV";
		
		@JsonIgnore
		@OneToOne
		@MapsId
		private Heads head;
		
		private Long hoursWorked;
		private String IMUModel;
		private String IMUSerialNumber;
		private String IMUManufacturer;
		private String boardVersion;
		private String connectorType;
		private String configuredForType; // AH or EH
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		
		public Heads getHead() {
			return head;
		}
		public void setHead(Heads head) {
			this.head = head;
		}
		public Long getHoursWorked() {
			return hoursWorked;
		}
		public void setHoursWorked(Long hoursWorked) {
			this.hoursWorked = hoursWorked;
		}
		public String getIMUModel() {
			return IMUModel;
		}
		public void setIMUModel(String iMUModel) {
			IMUModel = iMUModel;
		}
		public String getIMUSerialNumber() {
			return IMUSerialNumber;
		}
		public void setIMUSerialNumber(String iMUSerialNumber) {
			IMUSerialNumber = iMUSerialNumber;
		}
		public String getIMUManufacturer() {
			return IMUManufacturer;
		}
		public void setIMUManufacturer(String iMUManufacturer) {
			IMUManufacturer = iMUManufacturer;
		}
		public String getBoardVersion() {
			return boardVersion;
		}
		public void setBoardVersion(String boardVersion) {
			this.boardVersion = boardVersion;
		}
		public String getConnectorType() {
			return connectorType;
		}
		public void setConnectorType(String connectorType) {
			this.connectorType = connectorType;
		}
		public String getConfiguredForType() {
			return configuredForType;
		}
		public void setConfiguredForType(String configuredForType) {
			this.configuredForType = configuredForType;
		}
		public String getEquipType() {
			return equipType;
		}
		public void setEquipType(String equipType) {
			this.equipType = equipType;
		}
		@Override
		public String toString() {
			return "GVs [id=" + id + ", head=" + head + ", hoursWorked=" + hoursWorked + ", IMUModel=" + IMUModel
					+ ", IMUSerialNumber=" + IMUSerialNumber + ", IMUManufacturer=" + IMUManufacturer
					+ ", boardVersion=" + boardVersion + ", connectorType=" + connectorType + ", configuredForType="
					+ configuredForType + "]";
		}
	
		
		
		
		
		
		
}
