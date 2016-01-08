import app from 'app'
import BrowserWindow from 'browser-window'
import CrashReporter from 'crash-reporter'
CrashReporter.start()
let mainWindow = null


app.on('window-all-closed', () => {
  if (process.platform != 'darwin') {
    app.quit()
  }
})


app.on('ready', () => {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    titleBarStyle: 'hidden-inset',
    webPreferences: {
      webSecurity: false
    }
  })

  mainWindow.loadURL('file://' + __dirname + '/renderer/index.html')

  // debug
  mainWindow.openDevTools()

  mainWindow.on('closed', () => {
    mainWindow = null
  })
})