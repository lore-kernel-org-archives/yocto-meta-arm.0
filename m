Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BF8CE7A98
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 15:52:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.64858.1695657124911440881
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Sep 2023 08:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32332DA7;
	Mon, 25 Sep 2023 08:52:42 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BAF63F59C;
	Mon, 25 Sep 2023 08:52:03 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-a: Fix BL32 path if usrmerge enabled
Date: Mon, 25 Sep 2023 16:51:39 +0100
Message-Id: <20230925155140.133001-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Sep 2023 15:52:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5073

From: Adam Johnston <adam.johnston@arm.com>

The optee recipe installs the tee image using `${nonarch_base_libdir}`
If usrmerge is enabled this is `/usr/lib`, otherwise it is `/lib`

Several platforms (corstone1000, n1sdp, tc) look for tee-pager_v2.bin in
the hard-coded `/lib/firmware`, hence if usrmerge is enabled it won't be
found.

Fix these platforms by using `${nonarch_base_libdir}` instead of `/lib`
as per the qemu platform code in the generic recipe.

Adam Johnston (1):
  arm-bsp/trusted-firmware-a: Fix BL32 binary path if `usrmerge` enabled

 .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc      | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

--=20
2.25.1


