import { Request, Response, Router } from "express";

const app = Router()

app.get('/', (request: Request, response: Response) => {
    const data = {
        message: "Wellcome to Fitness-Tracking-Application",
        version: "version: 1.0"
    }
    return response.status(200).send(data);
})
export default app