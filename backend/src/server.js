import express from 'express';
import admin from 'firebase-admin';
import notificationsRouter from './routes/notifications.js';
import statusRouter from './routes/status.js';

const serviceAccount = require('../firebase_adminsdk.json');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/notifications', notificationsRouter);
app.use('/status', statusRouter);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});

export { admin };
