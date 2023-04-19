Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DDEC77B78
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:54:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43632.1681923271476198154
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 09:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB3B9152B;
	Wed, 19 Apr 2023 09:55:14 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45BDB3F5A1;
	Wed, 19 Apr 2023 09:54:30 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/3] arm-bsp/trusted-firmware-m: Switch to TF-M BL1 and fix
Date: Wed, 19 Apr 2023 17:54:19 +0100
Message-Id: <20230419165422.15990-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:54:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4584

From: Emekcan Aras <emekcan.aras@arm.com>

Integrates TF-M BL1 into corstone1000 platform. This needs a large
changeset since it changes how TF-M builds and packs the bl1 image.
It also adds changes to make the new BL1 compatible with GPT parser
changes. And finally it bumps to SHA to include necessary changes and fixes
on TFM master and removes already upstreamed GPT patches. It also fixes few 
issues about applying out-of-tree patches for tfm external projects for 
Corstone1000.


Emekcan Aras (3):
  arm-bsp/trusted-firmware-m: apply patches correctly from external
    repos
  arm-bsp/trusted-firmware-m: Switch to TF-M BL1 in Corstone1000
  arm-bsp/corstone1000: add OTP config for fvp

 .../conf/machine/corstone1000-fvp.conf        |    1 +
 ...-corstone1000-Introduce-IO-framework.patch | 1354 -----------------
 ...-sure-to-write-fwu-metadata-to-repl.patch} |    2 +-
 ...ne1000-Add-IO-test-in-ci_regressions.patch |  646 --------
 ...1000-get-fwu-and-private-metadata-f.patch} |    2 +-
 ...stone1000-Add-soft-crc32-calculation.patch |  171 ---
 ...orstone1000-Add-watchdog_reset_timer.patch |   47 +
 ...one1000-Replace-MCUBOOT-BL1-by-TFM-s.patch | 1034 +++++++++++++
 ...orstone1000-calculate-metadata-crc32.patch |   89 --
 ...e1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch |  202 +++
 ...e1000-fwu-metadata_read-validate-crc.patch |   99 --
 ...stone1000-Add-common-platform-logger.patch |  125 --
 ...rm-corstone1000-Reorganize-bl2-files.patch |   61 +
 ...rstone1000-Fix-linker-script-comment.patch |   47 +
 ...rm-corstone1000-Introduce-GPT-parser.patch |  735 ---------
 ...e1000-BL1-changes-to-adapt-to-new-fl.patch |  337 ----
 ...e1000-Fix-linkerscripts-copyright-ye.patch |   39 +
 ...orm-corstone1000-BL2-uses-GPT-layout.patch |  411 -----
 ...e1000-fix-flash-reading-issue-for-fi.patch |   38 +
 ...e1000-Adds-compiler-flags-to-FWU-age.patch |  273 ++++
 ...tone1000-flash_layout-simplification.patch |  103 --
 ...ne1000-adjust-PS-asset-configuration.patch |   29 +
 .../files/corstone1000/rwx.patch              |   25 +
 .../trusted-firmware-m-1.7.0-corstone1000.inc |   55 +-
 24 files changed, 1838 insertions(+), 4087 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Introduce-IO-framework.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch => 0001-Platform-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch} (94%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch => 0002-Platform-corstone1000-get-fwu-and-private-metadata-f.patch} (99%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-soft-crc32-calculation.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-watchdog_reset_timer.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-calculate-metadata-crc32.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Add-common-platform-logger.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Reorganize-bl2-files.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Fix-linker-script-comment.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Introduce-GPT-parser.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-Fix-linkerscripts-copyright-ye.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-BL2-uses-GPT-layout.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-flash_layout-simplification.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-corstone1000-adjust-PS-asset-configuration.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/rwx.patch

-- 
2.17.1


