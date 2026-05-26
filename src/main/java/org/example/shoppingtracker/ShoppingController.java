package org.example.shoppingtracker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/cumparaturi")
@CrossOrigin(origins = "*")
public class ShoppingController {

    @Autowired
    private ShoppingRepository repository;

    @GetMapping
    public List<ShoppingItem> getAll() {
        return repository.findAll();
    }

    @PostMapping
    public ShoppingItem add(@RequestBody ShoppingItem item) {
        return repository.save(item);
    }
}
