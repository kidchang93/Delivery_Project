package model;

import lombok.Data;


// 롬복을 사용해 반복작업을 최소화.
//
@Data
public class Parcel {

	private int parcelNo;
	
	private String parcelName;

	private int parcelWeight;
	
	private String parcelSize;

	private int parcelFee;

	private String waybillNo;

	

}
