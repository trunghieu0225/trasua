const express = require('express');
const router = express.Router();
const toppingController = require('../controllers/toppingController');

// GET /api/toppings
router.get('/', toppingController.getAll);

// POST /api/toppings
router.post('/', toppingController.create);

// DELETE /api/toppings/:id
router.delete('/:id', toppingController.delete);

module.exports = router;
