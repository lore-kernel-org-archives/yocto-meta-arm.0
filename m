Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA38C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:38:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.28400.1653316730886319793
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 07:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78C73139F;
	Mon, 23 May 2022 07:38:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE21D3F70D;
	Mon, 23 May 2022 07:38:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-bsp/linux-yocto: move 5.4 kernel recipe to meta-gem5
Date: Mon, 23 May 2022 15:38:45 +0100
Message-Id: <20220523143846.2645047-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 14:38:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3454

The only user of the old 5.4 kernel is meta-gem5, so move it into that
layer to keep it separate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-kernel/linux/linux-yocto_5.4.bb                       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arm-bsp =3D> meta-gem5}/recipes-kernel/linux/linux-yocto_5.=
4.bb (100%)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb b/meta-=
gem5/recipes-kernel/linux/linux-yocto_5.4.bb
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
rename to meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bb
--=20
2.25.1


