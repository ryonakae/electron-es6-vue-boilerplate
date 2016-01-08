import app from 'app'
import BrowserWindow from 'browser-window'
import CrashReporter from 'crash-reporter'
CrashReporter.start()
import Menu from 'menu'
import appMenu from './browser/appMenu';

let mainWindow = null


app.on('window-all-closed', () => {
  if (process.platform != 'darwin') {
    app.quit()
  }
})


app.on('ready', () => {
  Menu.setApplicationMenu(appMenu)

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