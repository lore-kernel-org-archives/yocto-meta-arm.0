Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4627AC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:57:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24525.1706108264403775389
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 06:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCCFB1FB;
	Wed, 24 Jan 2024 06:58:28 -0800 (PST)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.31.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E01F33F5A1;
	Wed, 24 Jan 2024 06:57:42 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] n1sdp:arm-bsp/optee: Update optee to v4.0 
Date: Wed, 24 Jan 2024 14:57:33 +0000
Message-Id: <20240124145734.1694665-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Jan 2024 14:57:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5356

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This change updates the optee version to v4.0

Harsimran Singh Tungal (1):
  n1sdp:arm-bsp/optee: Update optee to v4.0

 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 ...DR-affinity-shift-and-mask-for-32-bi.patch | 29 -------------------
 ...at-n1sdp-add-N1SDP-platform-support.patch} |  0
 ...atch =3D> 0002-Handle-logging-syscall.patch} |  0
 ...at-n1sdp-register-DRAM1-to-optee-os.patch} |  0
 ...-external-device-tree-base-and-size.patch} |  0
 .../recipes-security/optee/optee-os-n1sdp.inc |  9 +++---
 .../optee/optee-os-tadevkit_4.0.0.bbappend    |  6 ++++
 .../optee/optee-os_4.0.0.bbappend             |  1 +
 .../optee/optee-test_4.0.0.bbappend           |  6 ++++
 10 files changed, 18 insertions(+), 35 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1=
sdp/0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0002-pl=
at-n1sdp-add-N1SDP-platform-support.patch =3D> 0001-plat-n1sdp-add-N1SDP-=
platform-support.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0003-Ha=
ndle-logging-syscall.patch =3D> 0002-Handle-logging-syscall.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0004-pl=
at-n1sdp-register-DRAM1-to-optee-os.patch =3D> 0003-plat-n1sdp-register-D=
RAM1-to-optee-os.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0005-pl=
at-n1sdp-add-external-device-tree-base-and-size.patch =3D> 0004-plat-n1sd=
p-add-external-device-tree-base-and-size.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_4.0.0.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_4.0.0.=
bbappend

--=20
2.25.1


