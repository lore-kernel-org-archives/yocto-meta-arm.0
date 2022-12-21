Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8FCC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 14:39:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20303.1671633589007926898
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 06:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDF712F4;
	Wed, 21 Dec 2022 06:40:28 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C9E23F71E;
	Wed, 21 Dec 2022 06:39:47 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/5] Add optee-os 3.19 recipe
Date: Wed, 21 Dec 2022 14:39:37 +0000
Message-Id: <20221221143942.15196-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 14:39:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4215

From: Emekcan Aras <emekcan.aras@arm.com>

This patchset adds optee 3.19 recipe and makes necessary configurations
to support optee-os 3.19 on n1sdp.

Emekcan Aras (3):
  arm/optee: support optee 3.19
  arm-bsp/optee-os: Adds 3.19 bbappend
  arm-bsp/optee-os: N1SDP support for optee-os 3.19

Emekcan Aras (2):
  arm/optee: Move optee-3.18 patches
  arm/qemuarm-secureboot: pin optee-os version

 ...d-external-device-tree-base-and-size.patch |  44 ++++
 .../recipes-security/optee/optee-os-n1sdp.inc |   7 +
 .../optee/optee-os_3.19.0.bbappend            |   6 +
 meta-arm/conf/machine/qemuarm-secureboot.conf |   3 +
 .../conf/machine/qemuarm64-secureboot.conf    |   3 +
 ...-Define-section-attributes-for-clang.patch |   0
 ...ow-setting-sysroot-for-libgcc-lookup.patch |   0
 ...0007-allow-setting-sysroot-for-clang.patch |   0
 .../0008-no-warn-rwx-segments.patch           |   0
 .../0009-add-z-execstack.patch                |   0
 .../0010-add-note-GNU-stack-section.patch     |   0
 ...-Define-section-attributes-for-clang.patch | 243 ++++++++++++++++++
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  35 +++
 ...0007-allow-setting-sysroot-for-clang.patch |  30 +++
 .../0008-no-warn-rwx-segments.patch           |  38 +++
 .../0009-add-z-execstack.patch                |  94 +++++++
 .../0010-add-note-GNU-stack-section.patch     | 128 +++++++++
 .../recipes-security/optee/optee-os-3_19.inc  |  82 ++++++
 ...-Define-section-attributes-for-clang.patch | 230 +++++++++++++++++
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  35 +++
 ...0007-allow-setting-sysroot-for-clang.patch |  30 +++
 .../0008-no-warn-rwx-segments.patch           |  65 +++++
 .../0009-add-z-execstack.patch                |  94 +++++++
 .../0010-add-note-GNU-stack-section.patch     | 128 +++++++++
 .../recipes-security/optee/optee-os_3.18.0.bb |   2 +
 .../recipes-security/optee/optee-os_3.19.0.bb |   9 +
 26 files changed, 1306 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0006-plat-n1sdp-add-external-device-tree-base-and-size.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.19.0.bbappend
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0001-core-Define-section-attributes-for-clang.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0006-allow-setting-sysroot-for-libgcc-lookup.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0007-allow-setting-sysroot-for-clang.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0008-no-warn-rwx-segments.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0009-add-z-execstack.patch (100%)
 rename meta-arm/recipes-security/optee/{optee-os => optee-os-3.18.0}/0010-add-note-GNU-stack-section.patch (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.19.0/0001-core-Define-section-attributes-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.19.0/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.19.0/0007-allow-setting-sysroot-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-segments.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.19.0/0009-add-z-execstack.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.19.0/0010-add-note-GNU-stack-section.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3_19.inc
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0001-core-Define-section-attributes-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0007-allow-setting-sysroot-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0008-no-warn-rwx-segments.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0009-add-z-execstack.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit-3.18.0/0010-add-note-GNU-stack-section.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os_3.19.0.bb

-- 
2.17.1


