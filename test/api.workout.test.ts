import axios from "axios"

describe(" API workout", () => {

    test("Should register a workout ", async () => {
        const input = {
            userId: 'aa354842-59bf-42e6-be3a-6188dbb5fff8'
            , activityId: "4861bbd3-3f79-4d99-8427-4e4fa852827d" 
            , pace: "slowly"
            , duraction: 20 // in minutes 
            , calories: 120
            , location: 'Luanda principal Gimmy'
        }
        const response = await axios.post('http://localhost:3000/workout/register', input)
        expect(response.status).toBe(200)

        const responseActivity = await axios.get(`http://localhost:3000/workout/${response.data.workoutId}`)

        expect(responseActivity.data.activity.activityName).toBe(input.activityId)
        expect(responseActivity.data.activity.locaction).toBe(input.location)


    });

})