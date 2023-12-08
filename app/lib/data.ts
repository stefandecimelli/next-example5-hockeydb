import { Pool } from "pg";
import { promises as fs } from 'fs';
import * as path from 'path';

const client = new Pool({ "max": 10, "connectionTimeoutMillis": 0, 'idleTimeoutMillis': 0});
const getAllPlayerStatSQL = 'app/lib/sql/getAllPlayerStat.sql';

export async function getAllPlayerStat() {
    const sqlContent = await fs.readFile(path.join(process.cwd(), getAllPlayerStatSQL), 'utf-8');
    const res = await client.query(sqlContent);
    return res.rows;
}