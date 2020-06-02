Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.8064.1591095936586596798
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 04:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lgHsfKKg;
 spf=pass (domain: linaro.org, ip: 209.85.216.68, mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f68.google.com with SMTP id s88so1275201pjb.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 04:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WC1oGhgKnB3rYGmQVkHiphkh68PjV3TeGpNPMJIiXdQ=;
        b=lgHsfKKgelhVm5IMJckUduGf+aBh7eD99VC3Zf4O/EBmFTmvy6jtljH0n/wjfXgHqg
         HywgeMCpi2Ft5CtRcvGpjHB5rmw/WMZUtfapHdwzxR/0DmjpGOu82B7Vpz5r/9Vc+GFR
         9/0YaaINtc+eeeaa+U3hQZyLdtegUxJbk7aCpuKatiLNp9jup+PY/GbqKkZcYBucRxak
         RQ9Uq+YRjkZQVBdQNt1rOIHXACdsbk1/IQkwoxfCWJK3pAP53TammEz4/8vIyTmzF3Bj
         Id6wyxYLHbbIhGMApYddUtRc5Rp3dV/riD+IMbbu1Rjtw8uBeM2RL1RnpB8sBDOzhq04
         Hv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WC1oGhgKnB3rYGmQVkHiphkh68PjV3TeGpNPMJIiXdQ=;
        b=HoAGS922+qhAuHkBE3ZFGqZHdjADBzbRYskHXK/GMAunt0X8FtJGNJ/8GCqonKp8WE
         AOGFzmscwp0mkk5Xm3l8O1OhCg7Qf91+ZUxh8MmpKQIlqInpdBMeCk+hgqEJ5IYXiEiv
         O7rWOiJwg+Bh+D78Cp/BpfjvwSKDr0wNOkWNGamitglxB2tio8pJ31jQh7W8Kr9Zqkl+
         2W5nUUmoR7v1GbB2n/UF8a7qS2AA/IcMiXW+vYt2Cw40Is58wchYyjalBBqpAzW2UeGQ
         SixDWESXQVktriRC4gX4fEzySauw5MKapvWwk3dXAjiNDMv97v9LXTAOdeDbcQQ2w9g0
         gOGw==
X-Gm-Message-State: AOAM532+cQUUZOTt1UzGEhUoRIsQ+9qYaxzpw6encWGi//00y0T/BjxZ
	U6MNnZfxzaNoeBKOFxzPtYMsdWWp6OU=
X-Google-Smtp-Source: ABdhPJwGoCXbD22CWixQ3ZPTLJNgtLBfFSBATqD3te7mOwL/o8VRoWCtL23Yr3E08tSt5z2Ymb0jcg==
X-Received: by 2002:a17:90a:1704:: with SMTP id z4mr4793375pjd.181.1591095935494;
        Tue, 02 Jun 2020 04:05:35 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.66.248])
        by smtp.gmail.com with ESMTPSA id w12sm2277895pjb.11.2020.06.02.04.05.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 04:05:34 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 3/4] external-arm-toolchain: Add README
Date: Tue,  2 Jun 2020 16:34:53 +0530
Message-Id: <1591095894-15178-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>

Document usage details for pre-built Arm toolchains.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../external-arm-toolchain/README.md               | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
new file mode 100644
index 0000000..65d1a42
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
@@ -0,0 +1,50 @@
+Pre-built Arm toolchain recipes
+===============================
+
+Introduction
+------------
+This layer contains recipes for pre-built Arm toolchain recipes as follows:
+
+external-arm-toolchain.bb
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This recipe provides support for pre-built GNU toolchains targeting processors
+from the Arm Cortex-A family and implementing the Arm A-profile architecture.
+
+Usage
+^^^^^
+
+In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
+on), a user needs to download and untar tool-set on host machine at a particular
+installation path eg: ``/opt/toolchain/``. Then user needs to specify following
+in ``conf/local.conf`` in order to replace OE toolcahin with pre-built GNU-A
+toolchain:
+
+TCMODE = "external-arm"
+EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
+
+-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
+   EXTERNAL_TOOLCHAIN = "\
+     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
+   "
+
+-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
+   EXTERNAL_TOOLCHAIN = "\
+     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
+   "
+
+Supported distros and machines
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
+meant to be distro and machine agnostic as long as one is cross-compiling for
+Arm A-profile architecture.
+
+gcc-arm-none-eabi_<version>.bb
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This recipe provides support for pre-built GNU Arm Embedded toolchain for
+bare-metal software development on devices based on 32-bit Arm Cortex-A,
+Cortex-R and Cortex-M processors.
+
+Supported version: 9-2019-q4-major
-- 
2.7.4

