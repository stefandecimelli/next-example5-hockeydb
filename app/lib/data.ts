import { Pool } from "pg";
import { readFileSync } from 'node:fs';
import * as path from 'path';

const getAllPlayerStatSQL = readFileSync(path.join(process.cwd(), 'app/lib/sql/getAllPlayerStat.sql'), 'utf-8');
const cloudCaCert = readFileSync(path.join(process.cwd(), 'app/lib/cacert/ca-certificate.crt')).toString();

const client = new Pool({
    connectionString: process.env.DATABASE_CONNECTION_URI,
    ssl: { ca: cloudCaCert }
});

export async function getAllPlayerStat() {
    const res = await client.query(getAllPlayerStatSQL);
    return res.rows;
}