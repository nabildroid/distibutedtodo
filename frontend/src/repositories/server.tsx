import axios from "axios";
import { ITodo } from "../App";




const api = axios.create({
    baseURL: "http://localhost:3000"
})



export async function getTodos(): Promise<ITodo[]> {


    const { data } = await api.get("/")

    console.log(data)
    return []


}
