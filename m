Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42A4C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 09:12:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2898.1707729166517006192
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 01:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75818DA7;
	Mon, 12 Feb 2024 01:13:27 -0800 (PST)
Received: from e132995.arm.com (unknown [10.57.8.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 062CE3F762;
	Mon, 12 Feb 2024 01:12:44 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp/optee: upgrade optee to 4.1.0 for N1SDP 
Date: Mon, 12 Feb 2024 09:12:34 +0000
Message-Id: <20240212091235.1941562-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Feb 2024 09:12:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5377

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This change updates the optee version to v4.1.0

Harsimran Singh Tungal (1):
  arm-bsp/optee: upgrade optee to 4.1.0 for N1SDP

 meta-arm-bsp/conf/machine/n1sdp.conf          |  8 ++---
 ...lat-n1sdp-add-N1SDP-platform-support.patch | 30 ++++++++++++++-----
 2 files changed, 26 insertions(+), 12 deletions(-)

--=20
2.25.1


