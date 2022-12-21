Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393AEC10F1B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:33:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17285.1671625993111510819
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 04:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E56D12F4;
	Wed, 21 Dec 2022 04:33:52 -0800 (PST)
Received: from e126544.arm.com (unknown [10.57.74.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BE993F703;
	Wed, 21 Dec 2022 04:33:09 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 0/5] Bump TF-M version to v1.7
Date: Wed, 21 Dec 2022 12:32:31 +0000
Message-Id: <20221221123236.342413-1-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 12:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4209

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

This change is Bumping the version of TF-M to v1.7 and remove=20
v1.6 recipe.
Side changes required:
- Change musca_b1 platform name
- Create bsp recipe for corstone1000
- Remove TF-M out of tree patches for corstone1000

Mohamed Omar Asaker (5):
  arm-bsp/trusted-services: corstone1000: Use the stateless platform
    service calls
  arm-bsp/trusted-firmware-m: Bump TFM to v1.7
  arm-bsp/trusted-firmware-m: corstone1000: TFM 1.7
  arm-bsp/musca_b1: Edit the platform name
  arm-bsp/trusted-firmware-m: Remove TF-M 1.6 recipe

 meta-arm-bsp/conf/machine/musca-b1.conf       |   2 +-
 ...e1000-platform-secure-test-framework.patch | 359 -----------
 ...ake-external-system-support-optional.patch |  77 ---
 ...ble-secure-enclave-run-without-host-.patch | 298 ---------
 ...on-Allow-configuration-of-input-and-.patch |  72 ---
 ...pport-for-UEFI-FMP-image-Information.patch | 573 ------------------
 ...0-remove-two-partition-configuration.patch |  51 --
 ...ne1000-adjust-PS-asset-configuration.patch |  27 -
 ...trusted-firmware-m-1.7.0-corstone1000.inc} |  18 +-
 ...pend =3D> trusted-firmware-m_1.7.%.bbappend} |   2 +-
 ...3-Use-the-stateless-platform-service.patch | 140 +++++
 .../trusted-services/ts-arm-platforms.inc     |   1 +
 .../trusted-firmware-m_1.7.0.bb               | 142 +++++
 13 files changed, 292 insertions(+), 1470 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0001-corstone1000-platform-secure-test-framework.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0002-corstone1000-make-external-system-support-optional.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0003-corstone1000-enable-secure-enclave-run-without-host-.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0004-Platform-Partition-Allow-configuration-of-input-and-.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0005-corstone1000-support-for-UEFI-FMP-image-Information.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0006-corstone1000-remove-two-partition-configuration.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0007-corstone1000-adjust-PS-asset-configuration.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-c=
orstone1000.inc =3D> trusted-firmware-m-1.7.0-corstone1000.inc} (65%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1=
.6.%.bbappend =3D> trusted-firmware-m_1.7.%.bbappend} (54%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0023-Use-the-stateless-platform-service.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_1.7.0.bb

--=20
2.25.1


