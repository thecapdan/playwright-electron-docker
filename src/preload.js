/* eslint global-require: off */
const { contextBridge, ipcRenderer } = require('electron');
const { isTest } = require('./util');

const validChannels = ['increase-window-size', 'open-new-window'];

const invoke = (channel, ...data) =>
  validChannels.includes(channel) ? ipcRenderer.invoke(channel, data) : Promise.reject();

contextBridge.exposeInMainWorld('api', {
  invoke,
});
