Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC50FC7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 08:11:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2040.1750234257570536120
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 01:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D5F914BF;
	Wed, 18 Jun 2025 01:10:36 -0700 (PDT)
Received: from MGC575JXM4.arm.com (unknown [10.57.83.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A60B3F66E;
	Wed, 18 Jun 2025 01:10:55 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Clement Faure <clement.faure@arm.com>
Subject: [PATCH 0/3] corstone1000: Upgrade OP-TEE to 4.6.0
Date: Wed, 18 Jun 2025 10:10:44 +0200
Message-Id: <20250618081047.34990-1-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 08:11:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6564

Add recipes for optee 4.6.0
Backport patch for optee-test 4.6.0 to fix compilation
issue with musl.
Set optee 4.6.0 as preferred version for Corstone-1000.
Remove optee 4.3.0 and 4.4.0 recipes.

Clement Faure (1):
  arm-bsp/optee-os: corstone-1000: upgrade to 4.6.0

Cl=C3=A9ment Faure (2):
  arm/optee: remove 4.3.0
  arm/optee: remove 4.4.0

 .../conf/machine/include/corstone1000.inc     |   4 +-
 .../0001-Handle-logging-syscall.patch         |  32 ---
 ...rstone1000-increase-CFG_TZDRAM_SIZE.patch} |   0
 .../optee/optee-os-corstone1000-common.inc    |   3 +-
 ...dd-udev-rule-and-systemd-service-fil.patch | 186 ------------------
 .../optee/optee-client_4.3.0.bb               |  10 -
 ...-client_4.4.0.bb =3D> optee-client_4.6.0.bb} |   4 +-
 .../optee/optee-examples_4.3.0.bb             |   3 -
 .../optee/optee-examples_4.4.0.bb             |   4 -
 .../optee/optee-examples_4.6.0.bb             |   4 +
 .../optee/optee-os-tadevkit_4.3.0.bb          |  26 ---
 ...it_4.4.0.bb =3D> optee-os-tadevkit_4.6.0.bb} |   0
 ...mpile.mk-use-CFLAGS-from-environment.patch |  43 ----
 ....mk-remove-absolute-build-time-paths.patch |  53 -----
 ...02-link.mk-use-CFLAGS-with-version.o.patch |  45 -----
 ...k-generate-version.o-in-link-out-dir.patch |  70 -------
 .../recipes-security/optee/optee-os_4.3.0.bb  |  14 --
 .../{optee-os_4.4.0.bb =3D> optee-os_4.6.0.bb}  |   4 +-
 ...Re-order-the-include-of-sys-stat.h-h.patch |  51 +++++
 .../optee/optee-test_4.3.0.bb                 |  12 --
 ...ptee-test_4.4.0.bb =3D> optee-test_4.6.0.bb} |   9 +-
 21 files changed, 68 insertions(+), 509 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0001-Handle-logging-syscall.patch
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/{=
0002-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch =3D> 0001-plat-cors=
tone1000-increase-CFG_TZDRAM_SIZE.patch} (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/0001-tee=
-supplicant-add-udev-rule-and-systemd-service-fil.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_4.3.0.bb
 rename meta-arm/recipes-security/optee/{optee-client_4.4.0.bb =3D> optee=
-client_4.6.0.bb} (77%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_4.3.0.=
bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_4.4.0.=
bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.6.0.=
bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.3=
.0.bb
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_4.4.0.bb =3D> =
optee-os-tadevkit_4.6.0.bb} (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-compile=
.mk-use-CFLAGS-from-environment.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-mk-comp=
ile.mk-remove-absolute-build-time-paths.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0002-link.mk=
-use-CFLAGS-with-version.o.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0003-link.mk=
-generate-version.o-in-link-out-dir.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_4.3.0.bb
 rename meta-arm/recipes-security/optee/{optee-os_4.4.0.bb =3D> optee-os_=
4.6.0.bb} (75%)
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-regre=
ssion_1000-Re-order-the-include-of-sys-stat.h-h.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_4.3.0.bb
 rename meta-arm/recipes-security/optee/{optee-test_4.4.0.bb =3D> optee-t=
est_4.6.0.bb} (70%)


