Return-Path: <arthur.cassegrain@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981C7FC592C
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 10:53:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67633.1772103210121654886
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 02:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arthur.cassegrain@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A2D2153B;
	Thu, 26 Feb 2026 02:53:23 -0800 (PST)
Received: from e142502.nice.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BDC663F73B;
	Thu, 26 Feb 2026 02:53:28 -0800 (PST)
From: Arthur Cassegrain <arthur.cassegrain@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Arthur Cassegrain <arthur.cassegrain@arm.com>
Subject: [PATCH 0/3] arm/[tf-m|trusted-services]: rework dependencies clone to enable devtool
Date: Thu, 26 Feb 2026 11:53:09 +0100
Message-ID: <20260226105312.4084782-1-arthur.cassegrain@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Feb 2026 10:53:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6917

For both tfm and trusted-services, clone all dependencies into the
source tree instead of ${UNPACKDIR}.
This aligns the layout with devtool git-submodule handling, ensuring the
recipe sees a consistent source tree at build time.

tf-m:
 - move dependencies sources to ${S}/external, it allows dependencies to =
be
patched via devtool in the same way as the main tf-m repository.

trusted-services:
 - move dependencies sources to ${S}/ts-external to avoid conflicts with
main repository.

Arthur Cassegrain (2):
  arm-bsp/trusted-firmware-m: fix psa-adac patch paths for corstone1000
  arm/trusted-services: clone dependencies under ts source tree

Clement Faure (1):
  arm/trusted-firmware-m: clone dependencies under tfm source tree

 .../trusted-firmware-m-corstone1000.inc       |  8 +-
 .../trusted-firmware-m-2.1.4-src.inc          | 32 ++++----
 .../trusted-firmware-m-2.2.2-src.inc          | 45 +++++------
 .../trusted-firmware-m-git-src.inc            | 36 ++++-----
 .../trusted-firmware-m/trusted-firmware-m.inc | 14 ++--
 .../trusted-services/trusted-services-src.inc | 74 ++++++++++---------
 .../trusted-services/trusted-services.inc     |  2 +-
 7 files changed, 108 insertions(+), 103 deletions(-)

--=20
2.43.0


