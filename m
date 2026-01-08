Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4D3D1D490
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 20:18:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16171.1767903500236595878
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 12:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A803F497;
	Thu,  8 Jan 2026 12:18:12 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.48.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C95EC3F5A1;
	Thu,  8 Jan 2026 12:18:18 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH whinlatter 0/2] corstone1000: Whinlatter release
Date: Thu,  8 Jan 2026 20:18:10 +0000
Message-ID: <20260108201812.37201-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jan 2026 20:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6824

Contains:

Documentation updates
Pinning of SHAs

Hugues KAMBA MPIANA (2):
  corstone1000: Pin layers SHA for whinlatter release
  docs:corstone1000: Update user guide

 kas/corstone1000-a320.yml                     |   2 +
 kas/corstone1000-base.yml                     |   7 +-
 .../documentation/corstone1000/change-log.rst |  73 ++-
 .../corstone1000/release-notes.rst            |  14 +-
 .../documentation/corstone1000/user-guide.rst | 423 ++++++++++++------
 5 files changed, 369 insertions(+), 150 deletions(-)


