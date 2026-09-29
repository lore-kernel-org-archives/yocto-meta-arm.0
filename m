Return-Path: <Oscar.Belshaw@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9540ACA5FAE
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 14:30:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9124.1790692197339377025
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 07:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KwrxO1N0;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: oscar.belshaw@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 629631516;
	Tue, 29 Sep 2026 07:29:53 -0700 (PDT)
Received: from e142471.cambridge.arm.com (e142471.arm.com [10.2.210.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 637833F86F;
	Tue, 29 Sep 2026 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790692196; bh=QaIQlFTYKm4CDLQ5HWQCkglWUoRuNnkwYvKH/1pgMLU=;
	h=From:To:Cc:Subject:Date:From;
	b=KwrxO1N05fv+rb/bZunOrHtuJbSlji+fzCKBoHuSGhhRgMmjdXnEgX06cNXjzTOaD
	 FjNdKxAGpwkEzI1uiAoQWMCOVeE3AKyBn9VyBgVboVVURRbl7T9fP/MWNljBIZOCwX
	 vOyWL5+xi4GeSPX/PD5ES/RHBgLTDjaIClGRn/4w=
From: Oscar Belshaw <Oscar.Belshaw@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Oscar Belshaw <Oscar.Belshaw@arm.com>
Subject: [PATCH 0/1] arm-bsp/corstone1000: update TF-A to 2.15.0
Date: Tue, 29 Sep 2026 15:29:49 +0100
Message-ID: <20260929142950.1899977-1-Oscar.Belshaw@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:30:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7178

Oscar Belshaw (1):
  arm-bsp/corstone1000: update TF-A to 2.15.0

 .../conf/machine/include/corstone1000.inc     |   4 +-
 .../corstone1000-a320/topics/user-guide.md    |   2 +-
 .../documentation/corstone1000/user-guide.rst |   2 +-
 ...corstone1000-add-Cortex-A320-support.patch | 231 ------------------
 ...-corstone1000-align-BL-config-region.patch |  45 ++++
 ...000-make-mutlicore-support-platform-.patch | 113 ---------
 ...-corstone1000-delay-early-GPT-access.patch |  83 +++++++
 ...corstone1000-Add-Cortex-A320-support.patch | 157 ------------
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |   5 -
 .../trusted-firmware-a-corstone1000.inc       |   6 +-
 10 files changed, 134 insertions(+), 514 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-plat-corstone1000-add-Cortex-A320-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-plat-corstone1000-align-BL-config-region.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-feat-corestone-1000-make-mutlicore-support-platform-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-plat-corstone1000-delay-early-GPT-access.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/tf-a-tests/0001-plat-corstone1000-Add-Cortex-A320-support.patch


