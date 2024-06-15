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
            activity: "Running",
            distance: 100 // ins meters
            , duraction: 20 // in minutes
            , burnedCalories: 100 // 

        }
        const response = await axios.post('http://localhost:3000/register', input)
        expect(response.status).toBe(200)
    });
    test("Verificação do fluxo completo de registro de um Treino e atualização de uma Meta", async () => {


    })

})