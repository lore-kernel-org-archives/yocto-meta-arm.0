Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C38C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 12:09:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48659.1723475080071454330
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Aug 2024 08:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33758FEC;
	Mon, 12 Aug 2024 08:05:05 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.80.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DB2C3F6A8;
	Mon, 12 Aug 2024 08:04:38 -0700 (PDT)
From: hugues.kambampiana@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Hugues Kamba-Mpiana <hugues.kambampiana@arm.com>
Subject: [PATCH 0/2] arm-bsp/documentation: corstone1000: Deprecation of Sphinx context injection
Date: Fri, 16 Aug 2024 05:09:38 -0700
Message-ID: <20240812150417.157272-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Old-Date: Mon, 12 Aug 2024 16:04:15 +0100
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Aug 2024 12:09:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5960
Message-ID: <20240816120938.VOT9iE9vsgSdNUFTS1bl60rRiYi5-xsoJhCfdHfMSRc@z>

From: Hugues Kamba-Mpiana <hugues.kambampiana@arm.com>

Hugues Kamba-Mpiana (2):
  arm-bsp/documentation: corstone1000: Deprecation of Sphinx context
    injection
  arm-bsp/documentation: corstone1000: Install Sphinx theme as
    recommended

 .../documentation/corstone1000/conf.py        | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)


