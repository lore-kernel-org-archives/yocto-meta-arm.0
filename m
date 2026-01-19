Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730F0CCF2F2
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:47:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33364.1768823244484254229
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Jan 2026 03:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 359131517;
	Mon, 19 Jan 2026 03:47:17 -0800 (PST)
Received: from LXKV206JHX.emea.arm.com (LXKV206JHX.cambridge.arm.com [10.1.33.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FC8B3F740;
	Mon, 19 Jan 2026 03:47:23 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH whinlatter v2 0/2] corstone1000: Fix Ethos-U test build for Cortex-A320 variant
Date: Mon, 19 Jan 2026 11:47:17 +0000
Message-ID: <20260119114719.65080-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Jan 2026 11:47:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6856

Includes:
* meta-ethos SHA change to include fix related to ML repos migration
* documentation update for copyright notice year and Yocto release versio=
n

Changelog :
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
v2:
=20
This version of the patchset also include necessary documentation changes=
.


Hugues KAMBA MPIANA (2):
  corstone1000: Fix Ethos-U test build for Cortex-A320 variant
  arm-bsp/docs:corstone1000: Update copyright notice

 kas/corstone1000-a320.yml                                   | 2 +-
 meta-arm-bsp/documentation/corstone1000/change-log.rst      | 2 +-
 meta-arm-bsp/documentation/corstone1000/index.rst           | 2 +-
 meta-arm-bsp/documentation/corstone1000/release-notes.rst   | 2 +-
 .../documentation/corstone1000/software-architecture.rst    | 4 ++--
 meta-arm-bsp/documentation/corstone1000/user-guide.rst      | 6 +++---
 6 files changed, 9 insertions(+), 9 deletions(-)


