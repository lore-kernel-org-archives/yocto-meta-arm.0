Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4C1CFB440
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 03:35:50 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web11.45305.1728272140850237313
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 06 Oct 2024 20:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eTap36I7;
 spf=pass (domain: linaro.org, ip: 209.85.221.175, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-509bd2e944dso1209424e0c.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 06 Oct 2024 20:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728272139; x=1728876939; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMPeK0nne7E86NSk6PQg12mriD8E8w280GwHhm1V/c4=;
        b=eTap36I7iQev40CePLc47F6zCspxhpd/sJZ+q8j+Xsia1QJr2tE5/8zSe9Sz9fbGLO
         G8sw4+/uyos4idzafTX8sY/+hvAEM8xddZ6p34vW8FU+SuhHKDzVhbcXedzt5DK6Ip5m
         7Ch0BcOYK3eQeyX2L8dEKkNubnWMirIIA4tjjiKPqra5PF8L2+4pqtJqu3WinWlhXlk+
         ED+inlMBeqt/SI0CbLHnBFi2ehO82tKy2YxdBTvqWKwSpagH+AhTUGHB0LS0vuEkXX8W
         Nh07EK2fE5jGvpL1Gg9XULmfs1zaxZG34ZGueM6awkNJo+jQvLK0PJIfgX5E46wxmq9+
         ZfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728272139; x=1728876939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMPeK0nne7E86NSk6PQg12mriD8E8w280GwHhm1V/c4=;
        b=EC4Ud0mrLNSd4/tZuS12TjDf3w6VsEtD69NQMWaGNlSNXf4kO4c2e5upJ3AVnKcGGv
         6Hz/Mc1k77gc5rtszyt5SI5/+njQuysJu7EIIrr1Oo5ENUJDKLV7Fy9GxFcwVMENVpjb
         AGKpYwkp61dXzLNqeb7UjFi2v/Qdw7jpMEp9ZTTBjEp9WajzzCE30pF6GRSZTyNi8O9b
         HMufPbizg6VffHqbNfov41gmbd82rLLE66u4cEXaSsqIYPm+RseoEiXEEXCjuqVe93bq
         2gGX0pZHXyxZSVHXOwf6wfjfkkedJvUtq2H9EcOp33VlwxgWEgcSEZ1y5LORO1824Z3B
         5Rpg==
X-Gm-Message-State: AOJu0YyOlWaDkbtE6nWEOHE/xm2xG32l5STNsW5eWLNxMCxvyCEXcO7e
	QVB7I0WR6bBl8A0oKU0SgG4pCRld1ba9f/wnA93JSiqaqSlU3ZLLXv10M6jbiUhiER43BipM/mX
	r
X-Google-Smtp-Source: AGHT+IFTWYDu1s3osGgAsSXujAMUv8EOme4qTj0pp9eON+7kf9frsxJ9Locc0ycBP7zQmd6bIfI7Aw==
X-Received: by 2002:a05:6122:a09:b0:50a:b5a3:e00c with SMTP id 71dfb90a1353d-50c8544edb9mr5696622e0c.1.1728272139521;
        Sun, 06 Oct 2024 20:35:39 -0700 (PDT)
Received: from localhost.localdomain ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50c9ad9ba2dsm678476e0c.30.2024.10.06.20.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 20:35:38 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v0] arm/uefi-secureboot: Add uefi http boot support
Date: Sun,  6 Oct 2024 21:35:28 -0600
Message-ID: <20241007033528.784737-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 03:35:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6176

Enable network boot via HTTP protocol. Many embedded and server-class
systems use network boot for booting. Enabling network boot on devices
allows:

- Shipping devices without OS images. When we power up the device, the
  firmware can connect to the Internet and download and install suitable
  boot images for this specific device. Administrators can centrally
  manage the boot images and configuration files on a network server.
  This centralization streamlines the management of boot options and
  ensures consistency across all devices.

- This is particularly useful in enterprise environments. On mass
  deployments, there is a need to install the operating system on
  multiple devices simultaneously.

- Ability to maintain a completely diskless system if needed 

The plain HTTP protocol lacks encryption. It's intended to be used on
local networks. Secure http protocol support is under review. 

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/uefi-secureboot.yml                                 | 2 +-
 meta-arm/recipes-bsp/u-boot/u-boot-uefi-http-boot.inc  | 3 +++
 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc | 2 ++
 meta-arm/recipes-bsp/u-boot/u-boot/uefi-http-boot.cfg  | 6 ++++++
 4 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-http-boot.inc
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-http-boot.cfg

diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
index f647f4b1..4e9572cc 100644
--- a/ci/uefi-secureboot.yml
+++ b/ci/uefi-secureboot.yml
@@ -23,7 +23,7 @@ local_conf_header:
     WKS_FILE = "efi-disk.wks.in"
     KERNEL_IMAGETYPE = "Image"
 
-    MACHINE_FEATURES:append = " efi uefi-secureboot"
+    MACHINE_FEATURES:append = " efi uefi-secureboot uefi-http-boot"
 
     EFI_PROVIDER = "systemd-boot"
 
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-http-boot.inc b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-http-boot.inc
new file mode 100644
index 00000000..490a9684
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-http-boot.inc
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://uefi-http-boot.cfg"
\ No newline at end of file
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
index e58035a9..48c2de86 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
+++ b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
@@ -4,6 +4,8 @@ SRC_URI += "file://uefi-secureboot.cfg"
 
 inherit sbsign
 
+require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-http-boot', 'u-boot-uefi-http-boot.inc', '', d)}
+
 DEPENDS += 'python3-pyopenssl-native'
 
 do_compile:prepend() {
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/uefi-http-boot.cfg b/meta-arm/recipes-bsp/u-boot/u-boot/uefi-http-boot.cfg
new file mode 100644
index 00000000..a9edf2a2
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot/uefi-http-boot.cfg
@@ -0,0 +1,6 @@
+CONFIG_PROT_TCP=y
+CONFIG_PROT_TCP_SACK=y
+CONFIG_CMD_WGET=y
+CONFIG_CMD_DNS=y
+CONFIG_BLKMAP=y
+CONFIG_EFI_HTTP_BOOT=y
-- 
2.46.2


