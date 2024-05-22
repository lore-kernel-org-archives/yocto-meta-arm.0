Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58932C41513
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 16:05:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1289.1716393896159240664
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 May 2024 09:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1359339;
	Wed, 22 May 2024 09:05:19 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.84.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2176F3F766;
	Wed, 22 May 2024 09:04:54 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH scarthgap 0/5] Fix ACS test failures for corstone1000
Date: Wed, 22 May 2024 18:04:38 +0200
Message-Id: <20240522160443.89173-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 May 2024 16:05:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5755

From: Bence Balogh <bence.balogh@arm.com>

The commits contain fixes for ACS regressions and for private
authenticated variable handling. For this, TF-M and TS
patches were added.

Bence Balogh (5):
  arm-bsp/trusted-services: corstone1000: add EFI var handling fixes
  arm-bsp/trusted-services: corstone1000: add fixes for private auth
    vars
  arm-bsp/trusted-firmware-m: corstone1000: increase PS sizes
  arm-bsp/trusted-services: corstone1000: increase comm buffer size
  arm-bsp/trusted-firmware-m: corstone1000: increase RSE_COMMS buff size

 ...1000-Increase-RSE_COMMS-buffer-size.patch} |   4 +-
 ...ne1000-Increase-buffers-for-EFI-vars.patch |  45 ++
 .../trusted-firmware-m-corstone1000.inc       |   3 +-
 ...-Fix-Avoid-redefinition-of-variables.patch |  28 +
 ...x-GetNextVariableName-NameSize-input.patch | 495 ++++++++++++
 ...r-handling-of-variable-index-loading.patch |  82 ++
 ...pi-to-create-uefi-priv-var-fingerpri.patch | 758 ++++++++++++++++++
 ...estamp-validation-for-uefi-variables.patch | 146 ++++
 ...n-uefi-variable-authentication-steps.patch | 282 +++++++
 ...e-Authenticated-Variable-verificatio.patch | 292 +++++++
 ..._COMMS-cmake-variables-to-cahce-vars.patch |  37 +
 .../trusted-services/ts-arm-platforms.inc     |   8 +
 .../ts-sp-se-proxy_%.bbappend                 |   1 +
 .../ts-sp-smm-gateway_%.bbappend              |   1 +
 14 files changed, 2179 insertions(+), 3 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
009-platform-CS1000-Increase-RSE_COMMS-buffer-size.patch =3D> 0009-platfo=
rm-corstone1000-Increase-RSE_COMMS-buffer-size.patch} (87%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0011-Fix-Avoid-redefinition-of-variables.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Fix-GetNextVariableName-NameSize-input.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Fix-error-handling-of-variable-index-loading.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-Provide-crypto-api-to-create-uefi-priv-var-fingerpri.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0015-Add-timestamp-validation-for-uefi-variables.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0016-Isolate-common-uefi-variable-authentication-steps.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0017-Implement-Private-Authenticated-Variable-verificatio.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0018-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch

--
2.25.1


