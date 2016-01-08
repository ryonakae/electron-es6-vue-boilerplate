import app from 'app'
import Menu from 'menu'
import MenuItem from 'menu-item'

let template = [{
  label: 'Electron App',
  submenu: [{
    label: 'Quit',
    accelerator: 'Command+Q',
    click: () => {
      app.quit()
    }
  }]
}]

let appMenu = Menu.buildFromTemplate(template)

module.exports = appMenu