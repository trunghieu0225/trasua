const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController');

// GET /api/orders
router.get('/', orderController.getAll);

// POST /api/orders
router.post('/', orderController.create);

// PUT /api/orders/:id/status
router.put('/:id/status', orderController.updateStatus);

module.exports = router;
