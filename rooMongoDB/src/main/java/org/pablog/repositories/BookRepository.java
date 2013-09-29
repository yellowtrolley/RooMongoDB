package org.pablog.repositories;
import java.util.List;
import org.pablog.model.Book;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Book.class)
public interface BookRepository {

    List<Book> findAll();
}
