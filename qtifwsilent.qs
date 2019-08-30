function Controller() {
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    })
}

Controller.prototype.WelcomePageCallback = function() {
    // click delay here because the next button is initially disabled for ~1 second
    gui.clickButton(buttons.NextButton, 3000);
}

Controller.prototype.CredentialsPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function()
{
    gui.currentPageWidget().TargetDirectoryLineEdit.setText(installer.environmentVariable("QT_INSTALL_DIR"));
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
    var widget = gui.currentPageWidget();

    widget.deselectAll();
    widget.selectComponent("qt.qt5.5122.win32_msvc2015");
    widget.selectComponent("qt.qt5.5122.win64_msvc2015_64");
    widget.selectComponent("qt.qt5.5122.qtcharts");
    widget.selectComponent("qt.qt5.5122.qtdatavis3d");
    widget.selectComponent("qt.qt5.5122.qtpurchasing");
    widget.selectComponent("qt.qt5.5122.qtvirtualkeyboard");
    widget.selectComponent("qt.qt5.5122.qtwebengine");
    widget.selectComponent("qt.qt5.5122.qtnetworkauth");
    widget.selectComponent("qt.qt5.5122.qtwebglplugin");
    widget.selectComponent("qt.qt5.5122.qtscript");
    widget.selectComponent("qt.tools.vcredist_msvc2015_x86");
    widget.selectComponent("qt.tools.vcredist_msvc2015_x64");

    // widget.selectComponent("qt.5122.win32_msvc2015");
    // widget.selectComponent("qt.5122.win64_msvc2015_64");
    // widget.selectComponent("qt.5122.qtcharts");
    // widget.selectComponent("qt.5122.qtdatavis3d");
    // widget.selectComponent("qt.5122.qtpurchasing");
    // widget.selectComponent("qt.5122.qtvirtualkeyboard");
    // widget.selectComponent("qt.5122.qtwebengine");
    // widget.selectComponent("qt.5122.qtnetworkauth");
    // widget.selectComponent("qt.5122.qtwebglplugin");
    // widget.selectComponent("qt.5122.qtscript");

    gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function()
{
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function() {
	var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm;
	if (checkBoxForm && checkBoxForm.launchQtCreatorCheckBox) {
		checkBoxForm.launchQtCreatorCheckBox.checked = false;
	}
    gui.clickButton(buttons.FinishButton);
}
