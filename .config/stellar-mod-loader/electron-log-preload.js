
      try {
        (function ra({contextBridge:t,ipcRenderer:e}){if(!e)return;e.on("__ELECTRON_LOG_IPC__",(n,r)=>{window.postMessage(U({cmd:"message"},r))}),e.invoke("__ELECTRON_LOG__",{cmd:"getOptions"}).catch(n=>console.error(new Error(`electron-log isn't initialized in the main process. Please call log.initialize() before. ${n.message}`)));let i={sendToMain(n){try{e.send("__ELECTRON_LOG__",n)}catch(r){console.error("electronLog.sendToMain ",r,"data:",n),e.send("__ELECTRON_LOG__",{cmd:"errorHandler",error:{message:r?.message,stack:r?.stack},errorName:"sendToMain"})}},log(...n){i.sendToMain({data:n,level:"info"})}};for(let n of["error","warn","info","verbose","debug","silly"])i[n]=(...r)=>i.sendToMain({data:r,level:n});if(t&&process.contextIsolated)try{t.exposeInMainWorld("__electronLog",i)}catch{}typeof window=="object"?window.__electronLog=i:__electronLog=i})(require('electron'));
      } catch(e) {
        console.error(e);
      }
    