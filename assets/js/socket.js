import { Socket } from "phoenix"

let socket = new Socket("/socket", {params: { guardian_token: window.userToken}})

socket.connect()

export default socket
