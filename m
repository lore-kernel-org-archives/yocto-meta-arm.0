Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364EDC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 10:56:59 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.7426.1676545008325700645
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 02:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSbwS-009BT5-4B; Thu, 16 Feb 2023 12:56:44 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSbwR-000cXm-Qy; Thu, 16 Feb 2023 12:56:43 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/4] switch from :append to +=
Date: Thu, 16 Feb 2023 12:56:36 +0200
Message-Id: <20230216105640.147967-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230216105640.147967-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 10:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4400

When using meta-arm with product specific layers, it is hard to
update optee-os recipe to newer version while still using the main
recipe and include files from meta-arm. This is because meta-arm
recipe uses :append to apply changes to recipe variables and those can
not be easily overwritten in other layers via bbappends. Anything
added with :append can only be removed via explicit :remove for the same
string, e.g. patch file name which is not possible to know in advance.

If += is used in meta-arm side recipes, then bbappends in other layers
can overwrite the variables when they know better, for example when
updating optee-os recipe from version 3.19 to 3.20. This is done
in an optee-os_%.bbappend file by overwriting the SRC_URI,
PV and SRCREV variables.

This same pattern is used with a lot of variables so try to find and fix
all of them. Hopefully there are no regressions due to :append and +=
being applied in different order to the result variable.

Mikko Rapeli (4):
  meta-arm-bsp/conf: switch from :append to +=
  generic-arm64.conf: switch from :append to +=
  meta-arm: switch from :append to +=
  meta-arm-bsp: switch from :append to +=

 meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
 .../conf/machine/fvp-baser-aemv8r64.conf      |  4 +-
 .../conf/machine/include/corstone1000.inc     |  2 +-
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 meta-arm-bsp/conf/machine/sgi575.conf         |  2 +-
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |  4 +-
 .../recipes-bsp/hafnium/hafnium-tc.inc        |  4 +-
 .../scp-firmware/scp-firmware-juno.inc        |  2 +-
 .../scp-firmware/scp-firmware-n1sdp.inc       |  2 +-
 .../trusted-firmware-a-corstone1000.inc       | 34 +++++------
 .../trusted-firmware-a-corstone500.inc        | 16 ++---
 .../trusted-firmware-a-fvp-arm32.inc          |  5 +-
 .../trusted-firmware-a-juno.inc               |  2 +-
 .../trusted-firmware-a-n1sdp.inc              | 18 +++---
 .../trusted-firmware-a-tc.inc                 |  4 +-
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |  2 +-
 .../linux/linux-arm64-ack-clang.inc           |  2 +-
 .../recipes-kernel/linux/linux-yocto_5.19.bb  |  8 +--
 .../optee/optee-os-corstone1000-common.inc    |  6 +-
 .../recipes-security/optee/optee-os-n1sdp.inc |  4 +-
 meta-arm/conf/machine/generic-arm64.conf      |  2 +-
 .../trusted-firmware-a/trusted-firmware-a.inc |  8 +--
 .../recipes-kernel/linux/arm-ffa-5.15.inc     |  4 +-
 .../linux/arm-ffa-transport.inc               |  4 +-
 .../optee-ftpm/optee-os_%.bbappend            | 11 ++--
 .../recipes-security/optee/optee-os-3_19.inc  |  7 +--
 .../recipes-security/optee/optee-os-ts.inc    | 58 +++++++++----------
 meta-arm/recipes-security/optee/optee-os.inc  |  7 +--
 .../recipes-security/optee/optee-os_3.18.0.bb |  4 +-
 .../recipes-security/optee/optee-os_3.19.0.bb |  6 +-
 .../optee/optee-test_3.18.0.bb                |  4 +-
 .../trusted-services/trusted-services.inc     |  2 +-
 32 files changed, 118 insertions(+), 124 deletions(-)

-- 
2.34.1


