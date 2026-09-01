const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

// GET /api/products
router.get('/', productController.getAll);

// POST /api/products
router.post('/', productController.create);

module.exports = router;
