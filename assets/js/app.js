import 'phoenix_html'
import React from 'react'
import ReactDOM from 'react-dom';

import './dropzone';
import socket from './socket'
import Main from './components/main';

window.renderImageApp = () =>
  ReactDOM.render(<Main socket={socket} />, document.getElementById('image-root'))
