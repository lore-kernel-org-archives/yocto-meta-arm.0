Return-Path: <csaba.szilagyi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4704DC87FCE
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:47:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29978.1753861653249210580
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 00:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: csaba.szilagyi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3AD31BC0;
	Wed, 30 Jul 2025 00:47:24 -0700 (PDT)
Received: from ubuntu-build.budapest.arm.com (GM0ZH93R.arm.com [10.45.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CC443F673;
	Wed, 30 Jul 2025 00:47:32 -0700 (PDT)
From: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
Subject: [PATCH 0/6] arm/hafnium: Enable build on non x86_64 hosts and include it to qemuarm64-secureboot build
Date: Wed, 30 Jul 2025 07:45:45 +0000
Message-ID: <20250730074551.1388-1-csaba.szilagyi@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 07:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6627

Check for x86_64 host is removed from hafnium recipe
and hafnium is added to qemuarm64-secureboot target.
Moreover minor fixes are applied on hafnium recipe in
order to make it buildable:
* Restore patch on gn visibility
* Remove deprecated patch for third_party/linux submodule
* Select valid platform for hafnium and properly pass to make
* Depend on clang-native

Csaba Szil=C3=A1gyi (6):
  Revert "arm/hafnium: refuse to build on non-x86-64 hosts"
  arm/hafnium: Depend on clang-native
  arm/hafnium: Select valid platform for hafnium and properly pass to
    make
  arm/hafnium: Remove deprecated patch for third_party/linux submodule
  arm/hafnium: Restore patch on gn visibility
  arm/hafnium: add hafnium to qemuarm64-secureboot target

 ci/qemuarm64-secureboot.yml                   |  1 +
 ...ig-native-to-find-the-libssl-headers.patch | 26 -----------------
 .../0001-work-around-visibility-issue.patch   | 29 +++++++++++++++++++
 .../recipes-bsp/hafnium/hafnium_2.12.0.bb     | 14 ++++-----
 4 files changed, 35 insertions(+), 35 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-con=
fig-native-to-find-the-libssl-headers.patch
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around=
-visibility-issue.patch


