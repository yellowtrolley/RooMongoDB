// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.pablog.model;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.pablog.model.Book;
import org.pablog.model.BookDataOnDemand;
import org.pablog.model.Publisher;
import org.pablog.repositories.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect BookDataOnDemand_Roo_DataOnDemand {
    
    declare @type: BookDataOnDemand: @Component;
    
    private Random BookDataOnDemand.rnd = new SecureRandom();
    
    private List<Book> BookDataOnDemand.data;
    
    @Autowired
    BookRepository BookDataOnDemand.bookRepository;
    
    public Book BookDataOnDemand.getNewTransientBook(int index) {
        Book obj = new Book();
        setAuthor(obj, index);
        setDatePublished(obj, index);
        setDescription(obj, index);
        setIsbn(obj, index);
        setName(obj, index);
        setPages(obj, index);
        setPublisher(obj, index);
        return obj;
    }
    
    public void BookDataOnDemand.setAuthor(Book obj, int index) {
        String author = "author_" + index;
        obj.setAuthor(author);
    }
    
    public void BookDataOnDemand.setDatePublished(Book obj, int index) {
        Date datePublished = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDatePublished(datePublished);
    }
    
    public void BookDataOnDemand.setDescription(Book obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void BookDataOnDemand.setIsbn(Book obj, int index) {
        String isbn = "isbn_" + index;
        obj.setIsbn(isbn);
    }
    
    public void BookDataOnDemand.setName(Book obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void BookDataOnDemand.setPages(Book obj, int index) {
        Integer pages = new Integer(index);
        obj.setPages(pages);
    }
    
    public void BookDataOnDemand.setPublisher(Book obj, int index) {
        Publisher publisher = null;
        obj.setPublisher(publisher);
    }
    
    public Book BookDataOnDemand.getSpecificBook(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Book obj = data.get(index);
        BigInteger id = obj.getId();
        return bookRepository.findOne(id);
    }
    
    public Book BookDataOnDemand.getRandomBook() {
        init();
        Book obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return bookRepository.findOne(id);
    }
    
    public boolean BookDataOnDemand.modifyBook(Book obj) {
        return false;
    }
    
    public void BookDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = bookRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Book' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Book>();
        for (int i = 0; i < 10; i++) {
            Book obj = getNewTransientBook(i);
            try {
                bookRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            data.add(obj);
        }
    }
    
}
