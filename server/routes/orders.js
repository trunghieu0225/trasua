const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController');

// GET /api/orders
router.get('/', orderController.getAll);

// GET /api/orders/:id -> Tra cứu 1 đơn hàng theo mã đơn hoặc SĐT
router.get('/:id', orderController.getById);

// POST /api/orders
router.post('/', orderController.create);

// PUT /api/orders/:id/status
router.put('/:id/status', orderController.updateStatus);

module.exports = router;
