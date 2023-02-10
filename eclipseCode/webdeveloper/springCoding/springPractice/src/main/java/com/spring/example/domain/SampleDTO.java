package com.spring.example.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
*/
/*@Setter
@Getter
@ToString*/
@NoArgsConstructor
@AllArgsConstructor
@Data //얘가 get, set tostring 다해줌

public class SampleDTO {
	private String name;
	private int age;
}

