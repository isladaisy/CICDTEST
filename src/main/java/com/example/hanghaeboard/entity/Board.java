package com.example.hanghaeboard.entity;

import com.example.hanghaeboard.dto.BoardRequestDto;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Getter
@Entity
@NoArgsConstructor
public class Board extends Timestamped {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false)
    private Long title;

    @Column(nullable = false)
    private String contents;

    @Column(nullable = false)
    private String author;

    @Column(nullable = false)
    private String password;


    public Board(BoardRequestDto requestDto) {
        this.title = requestDto.getTitle();
        this.contents = requestDto.getContents();
        this.author = requestDto.getAuthor();
        this.password = requestDto.getPassword();
    }

    public void update(BoardRequestDto requestDto) {
        this.title = requestDto.getTitle();
        this.contents = requestDto.getContents();
        this.author= requestDto.getAuthor();
        this.password = requestDto.getPassword();
    }
}