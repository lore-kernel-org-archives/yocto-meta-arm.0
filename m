Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE486D34084
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 15:45:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14516.1769528736532464161
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 07:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 720D11596;
	Tue, 27 Jan 2026 07:45:29 -0800 (PST)
Received: from LXKV206JHX.emea.arm.com (LXKV206JHX.cambridge.arm.com [10.1.28.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75E2E3F632;
	Tue, 27 Jan 2026 07:45:35 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH v3 0/3] arm/arm-bsp: optee: upgrade to 4.9.0
Date: Tue, 27 Jan 2026 15:45:22 +0000
Message-ID: <20260127154532.27572-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 27 Jan 2026 15:45:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6879

Move SRC_URI branch/tag selection to optee.inc so
release recipes fetch tags (with nobranch=3D1) and
_git recipes keep branch=3Dmaster. Update optee-os,
optee-test, and optee-examples to use the shared
selector and remove the optee-test override. Also
switch optee-ftpm=E2=80=99s optee-ta source to a tag-based
fetch for reproducible builds.

Hugues KAMBA MPIANA (3):
  arm/arm-bsp: optee: add version 4.9.0
  arm-bsp/corstone1000: move to support OP-TEE version 4.9
  arm/arm-bsp: optee: drop version 4.7.0

 .../conf/machine/include/corstone1000.inc     |   4 +-
 .../documentation/corstone1000/user-guide.rst |   4 +-
 ...corstone1000-Add-Cortex-A320-support.patch | 143 ------------------
 .../optee/optee-os-corstone1000-common.inc    |   4 -
 ...ptee-ftpm_4.7.0.bb =3D> optee-ftpm_4.9.0.bb} |   8 +-
 ...ant-update-udev-systemd-install-code.patch |  78 ----------
 .../optee/optee-client_4.7.0.bb               |   5 -
 .../optee/optee-client_4.9.0.bb               |   4 +
 .../optee/optee-client_git.bb                 |   7 +-
 .../recipes-security/optee/optee-examples.inc |   2 +-
 .../optee/optee-examples_4.7.0.bb             |   4 -
 .../optee/optee-examples_4.9.0.bb             |   4 +
 ...it_4.7.0.bb =3D> optee-os-tadevkit_4.9.0.bb} |   0
 meta-arm/recipes-security/optee/optee-os.inc  |   2 +-
 .../recipes-security/optee/optee-os_4.7.0.bb  |   8 -
 .../recipes-security/optee/optee-os_4.9.0.bb  |   6 +
 .../recipes-security/optee/optee-test.inc     |   2 +-
 ...ptee-test_4.7.0.bb =3D> optee-test_4.9.0.bb} |   9 +-
 .../recipes-security/optee/optee-test_git.bb  |   5 +-
 meta-arm/recipes-security/optee/optee.inc     |   3 +
 20 files changed, 40 insertions(+), 262 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0001-plat-corstone1000-Add-Cortex-A320-support.patch
 rename meta-arm/recipes-security/optee-ftpm/{optee-ftpm_4.7.0.bb =3D> op=
tee-ftpm_4.9.0.bb} (93%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/0001-tee=
-supplicant-update-udev-systemd-install-code.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_4.7.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-client_4.9.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_4.7.0.=
bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.9.0.=
bb
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_4.7.0.bb =3D> =
optee-os-tadevkit_4.9.0.bb} (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_4.7.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.9.0.bb
 rename meta-arm/recipes-security/optee/{optee-test_4.7.0.bb =3D> optee-t=
est_4.9.0.bb} (68%)


