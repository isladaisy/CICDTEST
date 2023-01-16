package com.example.hanghaeboard.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class BoardDeleteDto {

    private Boolean success;

    public BoardDeleteDto(Boolean success) {
        this.success = success;
    }
}
