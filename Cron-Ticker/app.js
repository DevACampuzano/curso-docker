const cron = require("node-cron");
const { syncDb } = require("./tasks/sync-db");

console.log("Inicio de la APP");

cron.schedule("1-59/5 * * * * *", syncDb);
