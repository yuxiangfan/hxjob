package com.hx.hxjob.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ArticleCommand {
    private int id;
    private int cid;
    private String title;
    private String title1;
    private String brief1;
    private String editor;
    private String publishtime1;
    private String nature;
    private String brief;
    private String publishtime;
    private Advice news;
    private String content;
    private int commandCount;
    private int newtitle;
    private String imagenew;

    /*验证用户关注状态*/
    private Boolean whetherAttention;
}
