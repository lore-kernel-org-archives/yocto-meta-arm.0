Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B093FCCFA13
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 13:30:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14436.1777642248633812328
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2026 06:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XAoDsBhJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0DAF176A;
	Fri,  1 May 2026 06:30:42 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F82B3FAF5;
	Fri,  1 May 2026 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777642248; bh=a9m0zkNnUqg1zNcP5YhKLgIq7RifPivoEJvcPoGS+qg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XAoDsBhJILGEdFNLuwF1wvqkhDgGKio2FQ7Oa8g3dzjjMXJPzgE35nhctFJdQEkR0
	 j6LgrohFEfKwOVohnBQgOAnSqzTJXRwYbh39E6wFZBSG2JDfoek+F08NztJCJUi/Bv
	 xZ05V7SjmlGXibRWhmbc605wfD0zd0RN9wR/YzVw=
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 1/2] arm-bsp/docs:corstone1000: Fix secure boot script path
Date: Fri,  1 May 2026 14:30:16 +0100
Message-ID: <20260501133017.2820317-2-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501133017.2820317-1-alex.chapman@arm.com>
References: <20260501133017.2820317-1-alex.chapman@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 May 2026 13:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7031

- Use the correct `${WORKSPACE}` script path without the stray `./` prefi=
x.

This avoids an invalid command path.
---
 meta-arm-bsp/documentation/corstone1000/user-guide.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index e38fd1e8..5bade38e 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1865,7 +1865,7 @@ Generate Keys, Signed Image and Unsigned Image
=20
     .. code-block:: console
=20
-        ./${WORKSPACE}/iot-platform-assets/corstone1000/secureboot/creat=
e_keys_and_sign.sh \
+        ${WORKSPACE}/iot-platform-assets/corstone1000/secureboot/create_=
keys_and_sign.sh \
         -d ${TARGET} \
         -v ${CERTIFICATE_VALIDITY_DURATION_IN_DAYS}
=20

