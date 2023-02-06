import fs from 'fs';
import path from 'path';

export default function statusChecker(req, res, next) {
  const statusPath = path.join(__dirname, '../status.json');
  if (!fs.existsSync(statusPath)) {
    fs.writeFileSync(statusPath, JSON.stringify({ active: true }));
  }

  const status = JSON.parse(fs.readFileSync(statusPath, 'utf8'));
  if (!status.active) {
    res.status(202).json({ message: 'Push notifications for sensor are paused.' });
  } else {
    next();
  }
}
