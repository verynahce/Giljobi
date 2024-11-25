package com.prj.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "DUTY")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Duty {
	
	@Id
	@Column(name = "DUTY_ID")
	private Long dutyId;   
	
	@Column(name = "DUTY_NAME")
	private String dutyName;
}
