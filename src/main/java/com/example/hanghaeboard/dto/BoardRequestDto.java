package com.example.hanghaeboard.dto;

import lombok.Getter;

@Getter
public class BoardRequestDto {

    private String title;
    private String contents;
    private String author;
    private String password;

}