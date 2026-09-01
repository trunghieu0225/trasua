const express = require('express');
const cors = require('cors');
require('dotenv').config();

const { testConnection } = require('./config/db');
const authRoutes = require('./routes/auth');
const productRoutes = require('./routes/products');
const toppingRoutes = require('./routes/toppings');
const orderRoutes = require('./routes/orders');

const app = express();
const PORT = process.env.PORT || 5000;

// Enable CORS for frontend clients
app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

// Parse JSON request bodies
app.use(express.json());

// Root API Health Check Endpoint
app.get('/api/health', (req, res) => {
  res.json({
    status: 'ok',
    service: 'TeaJoy Store RESTful Backend API',
    timestamp: new Date().toISOString()
  });
});

// Mount Feature API Routes
app.use('/api/auth', authRoutes);
app.use('/api/products', productRoutes);
app.use('/api/toppings', toppingRoutes);
app.use('/api/orders', orderRoutes);

// Start Server
app.listen(PORT, async () => {
  console.log(`\n==================================================`);
  console.log(`🧋 TEAJOY STORE BACKEND API SERVER IS RUNNING`);
  console.log(`🚀 API Base URL: http://localhost:${PORT}/api`);
  console.log(`==================================================\n`);
  
  await testConnection();
});
