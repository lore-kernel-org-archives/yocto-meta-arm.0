Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFBAFD8773
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:43:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76211.1773754994885782945
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 155BB1477;
	Tue, 17 Mar 2026 06:43:08 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD4633F778;
	Tue, 17 Mar 2026 06:43:13 -0700 (PDT)
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 0/3] Make corstone1000 multicore configuration platform-agnostic
Date: Tue, 17 Mar 2026 13:42:54 +0000
Message-ID: <20260317134259.493017-1-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:43:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6956

Corstone-1000 SMP enablement in meta-arm is currently tied to=20
FVP-specific machine features and guards.

This series switches SMP to a generic `corstone1000_smp` machine
feature and adds the TF-A and TF-M changes needed to replace FVP-only=20
multicore conditionals. OP-TEE utalises the new machine feature=20
through its recipe configuration.

Alex Chapman (3):
  arm-bsp: corstone1000: Make multicore configuration platform-agnostic
  arm-bsp/trusted-firmware-a: corstone1000: Remove FVP requirement for
    TF-A multicore
  arm-bsp/trusted-firmware-m: corstone1000: Remove FVP requirement for
    TF-M multicore

 ...lticore.yml =3D> corstone1000-multicore.yml} |   4 +-
 .../documentation/corstone1000/user-guide.rst |   4 +-
 ...000-make-mutlicore-support-platform-.patch | 113 ++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |   3 +-
 ...ke-mutlicore-support-platform-generi.patch |  90 ++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   3 +-
 .../optee/optee-os-corstone1000-common.inc    |   2 +-
 7 files changed, 212 insertions(+), 7 deletions(-)
 rename kas/{corstone1000-fvp-multicore.yml =3D> corstone1000-multicore.y=
ml} (69%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-feat-corestone-1000-make-mutlicore-support-platform-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-Platform-CS1K-make-mutlicore-support-platform-generi.patch

