import axios from "axios"

describe(" API", () => {
    test("Api should be up", async () => {
        const response = await axios.get('http://localhost:3000/')
        expect(response.status).toBe(200)
        expect(response.data.message).toContain("Wellcome to Fitness-Tracking-Application")
        expect(response.data.version).toContain("version: 1.0")
    });
    test("Should register different types os activities [ Running, walking, cycling, swimming, etc.]", async () => {
        const input = {
            userId: 'aa354842-59bf-42e6-be3a-6188dbb5fff8',
            type: "Running"
            , description: 'Luanda principal Gimmy'
        }
        const response = await axios.post('http://localhost:3000/activity/register', input)
        expect(response.status).toBe(200)

        const responseActivity = await axios.get(`http://localhost:3000/activity/${response.data.activityId}`)

        expect(responseActivity.data.activity.type).toBe(input.type)
        expect(responseActivity.data.activity.description).toBe(input.description)


    });

})