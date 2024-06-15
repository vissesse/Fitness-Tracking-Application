import express from 'express';
import controller from './controller'
const app = express();
app.use(express.json());

app.use(controller)

app.listen(3000);