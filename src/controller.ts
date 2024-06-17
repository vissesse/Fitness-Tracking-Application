import { Request, Response, Router } from "express";
import Connection from "./connection";

const app = Router()

app.get('/', (request: Request, response: Response) => {
    const data = {
        message: "Wellcome to Fitness-Tracking-Application",
        version: "version: 1.0"
    }
    return response.status(200).send(data);
})
app.post('/activity/register', async (request: Request, response: Response) => {
    const input = request.body
    const connection = new Connection()
    const activityId = crypto.randomUUID()

    await connection.query(`insert into fitness_tracking.activities (activity_id, type, description) values ($1, $2, $3)`,
        [activityId, input.type, input.description])

    await connection.close()

    const outPut = {
        activityId: activityId
    }
    return response.status(200).send(outPut);
})

app.get('/activity/:activityId', async (request: Request, response: Response) => {
    const connection = new Connection()

    const [activityData] = await connection.query(`select * from fitness_tracking.activities where activity_id=$1`,
        [request.params.activityId])
    const activity = {
        activityId: activityData.activity_id,
        type: activityData.type,
        description: activityData.description,
    }

    await connection.close()

    const outPut = {
        activity
    }
    return response.status(200).send(outPut);
})

app.post('/workout/register', async (request: Request, response: Response) => {
    const input = request.body
    const connection = new Connection()
    const workoutId = crypto.randomUUID()
    const date = new Date()
    const distance = null
    await connection.query(`insert into fitness_tracking.workout (workout_id, activity_id, user_id, date, duration, calories, pace, location) values ($1, $2, $3, $4, $5, $6, $7, $8)`,
        [workoutId
            , input.activityId
            , input.userId
            , date
            , input.duraction 
            , input.calories
            , input.pace
            , input.location])

    await connection.close()

    const outPut = {
        activityId: workoutId
    }
    return response.status(200).send(outPut);
})
app.get('/workout/:activityId', async (request: Request, response: Response) => {
    const connection = new Connection()

    const [activityData] = await connection.query(`select * from fitness_tracking.activities where activity_id=$1`,
        [request.params.activityId])
    const activity = {
        activityId: activityData.activity_id,
        type: activityData.type,
        description: activityData.description,
    }

    await connection.close()

    const outPut = {
        activity
    }
    return response.status(200).send(outPut);
})
export default app