Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23091.1792676451382047429
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 06:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sWMQU+N7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B54502C34;
	Thu, 22 Oct 2026 06:40:47 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 759723F673;
	Thu, 22 Oct 2026 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792676450; bh=tUGKFrv8J2z4d/1SjiZy2m1MEAeS3O9DPbw/yUGkCbs=;
	h=From:To:Cc:Subject:Date:From;
	b=sWMQU+N7GfEpbaaonpvVa9GkGb8tOfBD6y9RyJw7b5BwPtq90hwI5MteF2JOgMqkP
	 yX7+bSuuDrk4o/Yp6xJgtfQj7k9lXE6AARpeFOt9DWKPICo3gYzeSYmyLBF6tofl9D
	 OaK4zTJH/dzX5LoqsqmFXnq1lTjNUYYrwe3gRBQw=
From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH] arm/linux-yocto: enable /dev/mem for Trusted Services tests
Date: Thu, 22 Oct 2026 14:40:36 +0100
Message-ID: <20261022134036.2410154-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:40:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7194
Content-Type: text/plain; charset="utf-8"

The Trusted Services uefi-test uses /dev/mem to map its
MM communication buffer. The no-strict-devmem.cfg fragment
relaxes the mapping restrictions, while CONFIG_DEVMEM
controls whether /dev/mem is available.

Enable CONFIG_DEVMEM in the same fragment so the test can
open /dev/mem and map the communication buffer.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 meta-arm/recipes-kernel/linux/files/no-strict-devmem.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-kernel/linux/files/no-strict-devmem.cfg b/m=
eta-arm/recipes-kernel/linux/files/no-strict-devmem.cfg
index d372acae..78a5f92f 100644
--- a/meta-arm/recipes-kernel/linux/files/no-strict-devmem.cfg
+++ b/meta-arm/recipes-kernel/linux/files/no-strict-devmem.cfg
@@ -1 +1,2 @@
+CONFIG_DEVMEM=3Dy
 CONFIG_STRICT_DEVMEM=3Dn
