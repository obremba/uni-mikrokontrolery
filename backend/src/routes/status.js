import { Router } from 'express';
import fs from 'fs';
import path from 'path';

const router = Router();

router.get('/', (req, res) => {
  const statusPath = path.join(__dirname, '../status.json');
  const statusJson = JSON.parse(fs.readFileSync(statusPath, 'utf8'));
  res.status(200).json(statusJson);
});

router.post('/change', (req, res) => {
  const { active = null } = req.body;
  if (active === null) return res.status(400).json({ error: 'Missing active param' });
  if (active !== false && active !== true) return res.status(400).json({ error: 'Invalid active param value' });

  const statusPath = path.join(__dirname, '../status.json');
  const statusJson = JSON.parse(fs.readFileSync(statusPath, 'utf8'));
  statusJson.active = active;
  fs.writeFileSync(statusPath, JSON.stringify(statusJson));

  res.status(200).json({ active: active });
});

export default router;
