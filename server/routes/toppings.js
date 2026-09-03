const express = require('express');
const router = express.Router();
const toppingController = require('../controllers/toppingController');

// GET /api/toppings
router.get('/', toppingController.getAll);

// POST /api/toppings
router.post('/', toppingController.create);

// PUT /api/toppings/:id
router.put('/:id', toppingController.update);

// DELETE /api/toppings/:id
router.delete('/:id', toppingController.delete);

module.exports = router;
