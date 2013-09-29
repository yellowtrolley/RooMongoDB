package org.pablog.model;
import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = Book.class, transactional = false)
public class BookIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
}
