import pgp from "pg-promise";

export default class Connection {
    private connection: any;

    constructor() {
        this.connection = pgp()("postgres://postgres:root@localhost:5432/app");
    }

    async query(statement: string, data: any) {
        return this.connection.query(statement, data);
    }

    async close() {
        await this.connection.$pool.end();
    }
}
