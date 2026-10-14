import {createClient} from '@supabase/supabase-js';
export type Player={id:string;name:string;nickname:string|null;type:'fixed'|'guest'};
export type Pelada={id:string;played_on:string;created_at:string};
export type Goal={id:string;pelada_id:string;player_id:string;quantity:number};
const url=import.meta.env.VITE_SUPABASE_URL;
const key=import.meta.env.VITE_SUPABASE_ANON_KEY;
export const db=url&&key?createClient(url,key):null;
export const configured=Boolean(db);
export function uid(){return crypto.randomUUID()}
