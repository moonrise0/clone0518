package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Getter
@AllArgsConstructor
@ToString
@Setter
@NoArgsConstructor
public class Review {
    private String name;
    private String text;
    private Date rdate;
}
