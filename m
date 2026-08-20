Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62441C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:56:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.563.1787237756912538793
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 07:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=MSiDGXSe;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A2D1153B;
	Thu, 20 Aug 2026 07:55:52 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E993F85F;
	Thu, 20 Aug 2026 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787237756; bh=kyZGoTwGmV9sbUlzgMrEsGyZmNVz/UOTxw5tknPmi8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MSiDGXSemIkLNpg0w0mkOpdFlPSuNWRzFfzENXRySjKoltQ3xfcMYznigDaOYiP3Q
	 5r3wsy+3Aimp6tCgBvqI2BUEWEIpsNAvtXPkHSxKYYKkduXJHHNwpL1vO94qetOwD8
	 oCgBp/+ceaktOYi/FsP9N1vVAGjcewXe8c3W2o5Q=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp/linux: corstone1000: Enable CMA for Ethos-U
Date: Thu, 20 Aug 2026 15:55:45 +0100
Message-ID: <20260820145545.3061675-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820145545.3061675-1-harsimransingh.tungal@arm.com>
References: <20260820145545.3061675-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:56:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7141

Enable CMA in the Corstone-1000 Ethos-U kernel configuration. Larger
Teflon model tests require reliable contiguous buffer allocation and
relies on kernel CMA support.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/ethosu.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/ethosu.=
cfg b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/ethosu.cfg
index aee5312c..5fc75d52 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/ethosu.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/ethosu.cfg
@@ -1,4 +1,6 @@
 CONFIG_SRAM=3Dy
+CONFIG_CMA=3Dy
+CONFIG_DMA_CMA=3Dy
 CONFIG_DRM=3Dy
 CONFIG_DRM_ACCEL=3Dy
 CONFIG_DRM_ACCEL_ARM_ETHOSU=3Dy

