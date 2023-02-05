import { Router } from 'express';
import statusChecker from '../middlewares/statusChecker';
import { admin } from '../server';

const router = Router();

router.post('/send', statusChecker, (req, res) => {
  const { title, body, data = null } = req.body;
  if (!title || !body) return res.status(400).json({ error: 'Missing title or body' });

  const notification = { title, body };

  admin
    .messaging()
    .sendToTopic(
      'everyone',
      { notification, ...(data instanceof Object && Object.keys(data).length && { data }) },
      { priority: 'high' }
    )
    .then((response) => {
      console.log('Successfully sent message:', response);
      res.status(200).json({ message: 'Notification sent' });
    })
    .catch((error) => {
      console.log('Error sending message:', error);
      res.status(500).json({ error: 'Notification not sent' });
    });
});

export default router;
