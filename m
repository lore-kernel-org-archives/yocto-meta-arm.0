Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BD0CD11BF
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 14:59:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17861.1710860347350271700
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 07:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66F08153B
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Mar 2024 07:59:41 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 589B63F762
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Mar 2024 07:59:06 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/tfa-tests: move n1sdp patch to platform directory
Date: Tue, 19 Mar 2024 10:59:05 -0400
Message-Id: <20240319145905.27609-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240319145905.27609-1-jon.mason@arm.com>
References: <20240319145905.27609-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Mar 2024 14:59:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5458

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../files/{ =3D> n1sdp}/0001-n1sdp-tftf-tests-to-skip.patch         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/{ =3D> n1sdp}/0=
001-n1sdp-tftf-tests-to-skip.patch (100%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-n1sdp=
-tftf-tests-to-skip.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/f=
iles/n1sdp/0001-n1sdp-tftf-tests-to-skip.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-n1sdp-=
tftf-tests-to-skip.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1=
sdp-tftf-tests-to-skip.patch
--=20
2.39.3 (Apple Git-146)


