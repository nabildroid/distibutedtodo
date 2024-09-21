import { useEffect, useState } from 'react'


import * as Server from "./repositories/server"
export type ITodo = {
  title: string;
  checked: boolean;
  id: string;
}

function App() {
  const todos: ITodo[] = [
    {
      checked: true,
      id: "ddfzfze",
      title: "Todo number 1"
    },
    {
      checked: true,
      id: "ddfzezfzef",
      title: "Todo number 2"
    }
  ]


  useEffect(() => {
    Server.getTodos();
  }, [])


  return (
    <div className='w-screen h-dvh bg-zinc-900'>

      <h1 className='text-4xl py-4 text-center text-zinc-200'>
        Distributed Todo List
      </h1>


      <div className='mx-auto max-w-2xl'>

        <div className="w-full py-2 border-b-2  border-zinc-500 flex items-center ">

        </div>

        <div >
          {todos.map((todo) => <div className='flex' key={todo.id}>
            <input type="checkbox" checked={todo.checked} />
            <h2 className='text-2xl text-white font-bold'>{todo.title}</h2>
          </div>)}

        </div>
      </div>

    </div>
  )
}

export default App
