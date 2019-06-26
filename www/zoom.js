cordova.define("cordova-plugin-zoom.zoom", function (require, exports, module) {
    var argscheck = require('cordova/argscheck'),
        channel = require('cordova/channel'),
        utils = require('cordova/utils'),
        exec = require('cordova/exec'),
        cordova = require('cordova');

    function Zoom() { }
    /**
     * Initialize ZOOM service
     *
     * @param {Function} appKey As provided by ZOOM service
     * @param {Function} appSecret As provided by ZOOM service
     * @param {Function} sdkDomain Which will be used to host the meetings
     * @param {Function} successCallback The function to call when the heading data is available
     * @param {Function} errorCallback The function to call when there is an error getting the heading data. (OPTIONAL)
     */
    Zoom.prototype.initZoom = function (appKey, appSecret, sdkDomain, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "Zoom", "initZoom", [appKey, appSecret, sdkDomain]);
    };

    /**
     * Initialize ZOOM service
     *
     * @param {Function} userName Display name
     * @param {Function} meetingNumber Meeting idetifier to be joint
     * @param {Function} successCallback The function to call when the heading data is available
     * @param {Function} errorCallback The function to call when there is an error getting the heading data. (OPTIONAL)
     */
    Zoom.prototype.joinMeeting = function (userName, meetingNumber, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "Zoom", "joinMeeting", [userName, meetingNumber]);
    };

    /**
     * Initialize ZOOM service
     *
     * @param {Function} userID The user idetifier
     * @param {Function} userName Display name
     * @param {Function} userToken Authentication token
     * @param {Function} successCallback The function to call when the heading data is available
     * @param {Function} errorCallback The function to call when there is an error getting the heading data. (OPTIONAL)
     */
    Zoom.prototype.startZAKMeeting = function (userID, userName, userToken, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "Zoom", "startZAKMeeting", [userID, userName, userToken]);
    };

    module.exports = new Zoom();

});