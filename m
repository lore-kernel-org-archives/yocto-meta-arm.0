Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A13FC001B0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 12:02:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mx.groups.io with SMTP id smtpd.web11.9205.1690372919820417487
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 05:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SvqMhtlj;
 spf=pass (domain: kernel.org, ip: 139.178.84.217, mailfrom: devnull+jon.mason.arm.com@kernel.org)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D11F61A46;
	Wed, 26 Jul 2023 12:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FDEBC433C8;
	Wed, 26 Jul 2023 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690372918;
	bh=wyTb6msx/7d1SdcADmRSgoQmLEzhosRbIJN8K0HBrBE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SvqMhtljT4iv4yEMbvWTdHnlp/UkSWOXqY5VsuZBLi31gOvIGN7O8krC5TNf5l7Jk
	 GRr1SGWwHgl5kJergM9qGp7f4N6vgdC7qFnvCF2sx9jp4A3QwrpU3ovDaibhEk3lX3
	 HzzBx5v50BLqMezNkTY4q6Sq+nDoxMqVMRloF+6ednAzBcQTNUXxQx2ZZSAcESm2Bs
	 MPIUd6iBqTT0T64qeDWf1wUh1Q7AdD49scemI2JVKt6O/mOcGCrHYE71QW/3D5MzQt
	 XocE3gcWk20H1f7xt9mQp6Igs+qnmL2usEQDhhHMUag+NKLyGCZitysnXJuZjsoY8G
	 XAcEVdmmE/jHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AB9C001B0;
	Wed, 26 Jul 2023 12:01:58 +0000 (UTC)
From: Jon Mason via B4 Relay <devnull+jon.mason.arm.com@kernel.org>
Date: Wed, 26 Jul 2023 08:01:34 -0400
Subject: [PATCH] arm-bsp/corstone1000: update u-boot preferred version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-master-next-v1-1-cd4758222729@arm.com>
X-B4-Tracking: v=1; b=H4sIAB0LwWQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDcyMz3dzE4pLUIt281IoSXbNUcyNTyyQjc1MTQyWgjoKi1LTMCrBp0bG
 1tQBV992uXQAAAA==
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=jon.mason@arm.com;
 h=from:subject:message-id; bh=sQE0DuhcCmT8Is/m+0RQlkke4os2pbu4QWdetsfVc2o=;
 b=owEBbQKS/ZANAwAKAW5mS6x6i9IjAcsmYgBkwQsszsrLxz+xD2/ZkpPM9DAWKmpTA9UidU9bD
 /svpvBpVgSJAjMEAAEKAB0WIQSgT1v1zdTYnFf3yapuZkuseovSIwUCZMELLAAKCRBuZkuseovS
 I+dxD/9EhgixHNEnlRSuBqqyLX2qVnDsxUJrUUZctSwrsR3Zr3jAk4wRpVzyhg63dVyKuxRmBxt
 UXthDDq+TkfoW6wvoj6sSeeuWIAYIfTc9FdvRLZbthDNkXnKKidXOKj1MYWGk8wB5ZM4s4k3tl/
 Z6Tf4sbVODDmYtZmPbIl9SGBQYxFMywYwowIrSifLIOKZVrqwSKF2jNQApfhYshVWNSM+8LhkO8
 98mnUPaUBYPcXdVFgtFBccRvSCwTlCPamc1fklfnmtTwbfvzZM+isBHURknRAjU+TPN7DZQONJG
 YFB7jb51/duwZvlRPoTzWTgATRFYDOLypsxYOpy7jCyx9+4RQ9JhGumNRdDYwjh2JlLS2rn9Upd
 shQTLAb8AYFj2dLx8cFmqBgaqjqt2vnGIQliY82B3KTJtoXTgkpaaGJuApjOcA6OH39khm3AwHE
 MM7tpFO1nZGr82aphY3qKViMWO9aK8eLQOEHYDPHNpzuohc2RSb8C+qSu18/OMTlWeYji44HZow
 m+Hx5EwHqFjyp+TqFPFgQVokVkdfv/faGZz+r2Tjt0IGnw8H0UpHfIi8kr+IVf/XvWWSBIpNy9p
 q8lXqxOMAEfW+P3FFSc2Z73iX7XtD7hTT+1GOp4/bb6DpwyM/WfZJ1/AqAL+kPEi5WHvh/9URyh
 neId8d7Jv3wAMrg==
X-Developer-Key: i=jon.mason@arm.com; a=openpgp;
 fpr=A04F5BF5CDD4D89C57F7C9AA6E664BAC7A8BD223
X-Endpoint-Received: by B4 Relay for jon.mason@arm.com/default with auth_id=58
X-Original-From: Jon Mason <jon.mason@arm.com>
Reply-To: <jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jul 2023 12:02:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4920

From: Jon Mason <jon.mason@arm.com>

The upstream u-boot recipe did a minor version update, which is causing
a "preferred version not available" warning.  Add a '%' to resolve this
issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index da668c95218d..aeb1411ab992 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -22,7 +22,7 @@ TFM_SIGN_PRIVATE_KEY = "${libdir}/tfm-scripts/root-RSA-3072_1.pem"
 RE_IMAGE_OFFSET = "0x1000"
 
 # u-boot
-PREFERRED_VERSION_u-boot ?= "2023.07"
+PREFERRED_VERSION_u-boot ?= "2023.07%"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 UBOOT_CONFIG ??= "EFI"

---
base-commit: cfcc8a4d13c26793ecab2d8da9274eb98b8cb4ce
change-id: 20230726-master-next-6e7259b27541

Best regards,
-- 
Jon Mason <jon.mason@arm.com>


