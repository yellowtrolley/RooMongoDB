package org.pablog.model;
import java.util.Date;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Book {
    private String name;
    private String description;
    private String author;
    private Publisher publisher;
    private String isbn;
    private Integer pages;
    private Date datePublished;
}
