Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C184CA5FD7
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 14:04:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12414.1769004242639614624
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 06:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 762E21476;
	Wed, 21 Jan 2026 06:03:55 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.80.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F6823F694;
	Wed, 21 Jan 2026 06:04:01 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 0/3] arm/arm-bsp: optee: upgrade to 4.9.0
Date: Wed, 21 Jan 2026 14:03:33 +0000
Message-ID: <20260121140356.16818-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Jan 2026 14:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6860

OP-TEE version 4.9.0 has been released on 2026-01-16 [1].
Upgrade OP-TEE recipes to point to version 4.9.0, and drop patches
from layers as they are already present in upstream.
In addition, point corestone1000 machine to a new version, as 4.7.0
is dropped from the layer.
Link: [1]: https://github.com/OP-TEE/optee_os/blob/master/CHANGELOG.md#op=
-tee---version-490-2026-01-16

Hugues KAMBA MPIANA (3):
  arm/arm-bsp: optee: add version 4.9.0
  arm-bsp/corstone1000: move to support OP-TEE version 4.9
  arm/arm-bsp: optee: drop version 4.7.0

 .../conf/machine/include/corstone1000.inc     |   4 +-
 .../documentation/corstone1000/conf.py        |   2 +-
 .../documentation/corstone1000/user-guide.rst |   6 +-
 ...corstone1000-Add-Cortex-A320-support.patch | 143 ------------------
 .../optee/optee-os-corstone1000-common.inc    |   4 -
 ...ptee-ftpm_4.7.0.bb =3D> optee-ftpm_4.9.0.bb} |   4 +-
 ...ant-update-udev-systemd-install-code.patch |  78 ----------
 .../optee/optee-client_4.7.0.bb               |   5 -
 .../optee/optee-client_4.9.0.bb               |   4 +
 .../optee/optee-client_git.bb                 |   7 +-
 .../optee/optee-examples_4.7.0.bb             |   4 -
 .../optee/optee-examples_4.9.0.bb             |   4 +
 ...it_4.7.0.bb =3D> optee-os-tadevkit_4.9.0.bb} |   0
 .../{optee-os_4.7.0.bb =3D> optee-os_4.9.0.bb}  |   4 +-
 ...ptee-test_4.7.0.bb =3D> optee-test_4.9.0.bb} |   4 +-
 15 files changed, 22 insertions(+), 251 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0001-plat-corstone1000-Add-Cortex-A320-support.patch
 rename meta-arm/recipes-security/optee-ftpm/{optee-ftpm_4.7.0.bb =3D> op=
tee-ftpm_4.9.0.bb} (97%)
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
 rename meta-arm/recipes-security/optee/{optee-os_4.7.0.bb =3D> optee-os_=
4.9.0.bb} (65%)
 rename meta-arm/recipes-security/optee/{optee-test_4.7.0.bb =3D> optee-t=
est_4.9.0.bb} (90%)


