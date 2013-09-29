package org.pablog.web;
import org.pablog.model.Publisher;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/publishers")
@Controller
@RooWebScaffold(path = "publishers", formBackingObject = Publisher.class)
public class PublisherController {
}
