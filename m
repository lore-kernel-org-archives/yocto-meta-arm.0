Return-Path: <Oscar.Belshaw@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC2AC79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:21:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8605.1788877306502519483
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 07:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ewtu9WFS;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: oscar.belshaw@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30B681476;
	Tue,  8 Sep 2026 07:21:42 -0700 (PDT)
Received: from e142471.cambridge.arm.com (e142471.arm.com [10.2.210.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59E9A3F528;
	Tue,  8 Sep 2026 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788877305; bh=crH3Uu1EJHwixKxnm30UC68pxDZL6zM0/t0yILz7T+0=;
	h=From:To:Cc:Subject:Date:From;
	b=ewtu9WFSLU/NjoHF9WSUUvDAj1iNIBhddniGxlzJMYpjjewq7JRDg4I80slEd3i5i
	 HJ9TkkX+58nYDuRWQcnGUgsG89ZE1eWY9fStFl4UhnKu+l+pPgyDoCBTuYO/RxI6CG
	 XFwcd8ZxnPeXi4wakQgy8xpBX64CgEZWAhmG7fCY=
From: Oscar Belshaw <Oscar.Belshaw@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Oscar Belshaw <Oscar.Belshaw@arm.com>
Subject: [PATCH oscbel01/corstone1000/optee-4.10 0/1] arm-bsp/corstone1000: update OP-TEE to 4.10.0
Date: Tue,  8 Sep 2026 15:21:26 +0100
Message-ID: <20260908142127.3759521-1-Oscar.Belshaw@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Sep 2026 14:21:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7159

Updated the OP-TEE version number to 4.10.0

Oscar Belshaw (1):
  arm-bsp/corstone1000: update OP-TEE to 4.10.0

 .../conf/machine/include/corstone1000.inc     |   4 +-
 .../corstone1000-a320/topics/user-guide.md    |   2 +-
 .../documentation/corstone1000/user-guide.rst |  10 +-
 ...0-Specify-GIC-version-in-plat-specif.patch |  45 --
 ...lementation-of-GICv3-to-add-GICv4-su.patch | 460 ------------------
 ...0-Swap-GIC-600-for-GIC-700-for-Corte.patch |  37 --
 .../optee/optee-client_4.9.0.bb               |   4 -
 .../optee/optee-examples_4.9.0.bb             |   4 -
 .../optee/optee-os-corstone1000-common.inc    |   8 -
 .../optee/optee-os-tadevkit_4.9.0.bb          |  30 --
 .../recipes-security/optee/optee-os_4.9.0.bb  |   6 -
 .../optee/optee-test_4.9.0.bb                 |  17 -
 12 files changed, 8 insertions(+), 619 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0001-plat-corstone1000-Specify-GIC-version-in-plat-specif.patc=
h
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0002-gic-Refactor-implementation-of-GICv3-to-add-GICv4-su.patc=
h
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0003-plat-corstone1000-Swap-GIC-600-for-GIC-700-for-Corte.patc=
h
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_4.9.=
0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-examples_4.=
9.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_4.9.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_4.9.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_4.9.0.=
bb


