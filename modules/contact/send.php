<?php
require_once('../../includes/init.php');
session_start();

$req = new Zend_Controller_Request_Http();

$config = getConfig($req->uuid);
if (empty($config)) {
	sendResponse(false);
}

$captcha		= $_SESSION['captcha_keystring'];
$isCaptchaOk	= ($config->isPassCaptcha || $captcha && $req->captcha == $captcha);

if (!$isCaptchaOk) {
	$_SESSION['captcha_keystring'] = null;
	exit(Zend_Json::encode(array('result' => false, 'code' => 'badCaptcha', 'message' => $config->badCaptcha)));
}

$body = $req->getParam('message', '');
$fromEmail = null;
foreach ($config->fields as $field) {
	if (!$fromEmail && $field->type == 'email') {
		$fromEmail = $req->getParam($field->name, '');
	}

	if (in_array($field->name, array('message'))) {
		continue;
	}
	$body .= "\n{$field->title}: " . $req->getParam($field->name, '');
}

$mail = new Zend_Mail('utf-8');
$mail->addHeader('X-Mailer', 'Parallels Web Presence Builder');
$mail->setBodyText($body);

if ($fromEmail) {
	$mail->setFrom($fromEmail, $req->name ? $req->name : '');
}

$mail->addTo($config->recipients);
$mail->setSubject($config->subject);
$mail->send();

$_SESSION['captcha_keystring'] = null;
exit(Zend_Json::encode(array('result' => true, 'message' => $config->reply)));

/**
 * Write response and terminate script
 *
 * @param bool $result
 * @param string $message
 * @param array $extra
 */
function sendResponse($result, $message = '', $extra = array()) {
	exit(Zend_Json::encode(
		(array('result' => $result, 'message' => $message)) + $extra)
	);
}

/**
 * Returns config for contact module
 *
 * @param $name
 * @return null|Zend_Config
 */
function getConfig($name) {
	$configPath = './../../data/' . $name . '.php';

	if (!empty($name) && preg_match('/^[a-f0-9]{8}-([a-f0-9]{4}-){3}[a-f0-9]{12}$/', $name)
		&& is_file($configPath)) {
		return new Zend_Config(require $configPath);
	}

	return null;
}