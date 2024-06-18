import axios from "axios"

describe(" API workout", () => {

    test("Should register a goal ", async () => {
        const input = {
            userId: 'aa354842-59bf-42e6-be3a-6188dbb5fff8'
            , workoutId: "4861bbd3-3f79-4d99-8427-4e4fa852827d"
            , target: 100
            , description: "I want do push 100 push flex" // in minutes 
            , type: "musculature"
        }
        const response = await axios.post('http://localhost:3000/goal/register', input)
        expect(response.status).toBe(200)

        const responseGoal = await axios.get(`http://localhost:3000/goal/${response.data.GoalId}`)

        expect(responseGoal.status).toBe(200)
        expect(responseGoal.data.Goal.workoutId).toBe(input.workoutId)
        expect(responseGoal.data.Goal.target).toBe(input.target)
        expect(responseGoal.data.Goal.description).toBe(input.description)
        expect(responseGoal.data.Goal.type).toBe(input.type)


    });

})