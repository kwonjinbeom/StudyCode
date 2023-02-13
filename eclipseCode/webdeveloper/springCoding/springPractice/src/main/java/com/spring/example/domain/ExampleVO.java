package com.spring.example.domain;

import lombok.AllArgsConstructor;
//import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExampleVO {

  private Integer no;
  private String name;
  private String phone;

}