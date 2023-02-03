Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5791C636D3
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 01:49:06 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.1183.1675388943542567274
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 17:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QdOiHTzM;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id s8so584326pgg.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 17:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fxackvy6y7Xz75EqwTq0AeME4H5s2nn9i4C+/Z2ti7Y=;
        b=QdOiHTzM6EJtEn2obJ1ICzgpRkautWvKch+XFW8pYk32imn4AHdwQVZVUPzyi+mDlC
         t3tbCrKDX45i//EX4qvDPtJYTFkQSTy1bbehv+N0+Mx6soyBFwYOZLoLTkUo2dxl/teg
         +DG8AWCwCzsJSskoha98PV4qrVLeKDRRIwh0pEFgHZzQZHy0wI4dDARHuUhg3rdNvdnJ
         W6YVkl7x6wCd+btjXHwjQK67NGLBexNillQ3hSf62xgF+vmlyFMU3HbqzFEYTkMX7/Rz
         BCgQG4YMOUq1xThwoLxwWUxpXxRhYPUcp7uki6zJ8eZCYID3RBLOsYwhKMbMXlTNyUyH
         tovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fxackvy6y7Xz75EqwTq0AeME4H5s2nn9i4C+/Z2ti7Y=;
        b=X87hLXhs+F22YfQg8dAh2a81gpOYZISK+fXgqaDE4ww/hqax1+Li/WwcoznmxAio/0
         47hrc9ycWwUpitqc6S+de37fknxzvkefnDgVYC+d8FcfxzqyTtlim9Myjmnrt+LI5OkT
         bUVQhdOyM7IVdHCXMjtRHM75vuwbvS/Img+kZJidHVx/UXRREDDudO/prk1T3bQ4ee/L
         bLHEAkwhj/n3CZiBIg77RI3bjleOdIJpf9gBpwpeGtn5i6Ib6w8wG3SSJ9Ft+h9A2hS1
         lhEGqQxlloulMcxWbbez7DKPyqhO3mtECwVspHvPG4drpxgWRgVE7RuhfhCR+5WG0fm+
         aZgg==
X-Gm-Message-State: AO0yUKXfT+xCaJlyxJ2EZG7fT1LWLn88mL6kOUc4lfrxA/d6GiQWXTfo
	95typLCJS4YtBXBkMaR6DcDn7X4sKx8imw==
X-Google-Smtp-Source: AK7set8lZrcyKpI5wWnT1JT2UHg4ZHa09svf8p20S5P+dVWlxn4D1fTXXr+Z3725H4V+nshFIc+u6A==
X-Received: by 2002:a62:5254:0:b0:594:1f1c:3d2f with SMTP id g81-20020a625254000000b005941f1c3d2fmr3245630pfb.4.1675388942501;
        Thu, 02 Feb 2023 17:49:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id z27-20020aa7959b000000b00581ad007a9fsm350327pfj.153.2023.02.02.17.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 17:49:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] sbsa: Fix build with gcc13
Date: Thu,  2 Feb 2023 17:48:59 -0800
Message-Id: <20230203014859.701575-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Feb 2023 01:49:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4356

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uefi/sbsa-acs/enum-int-mismatch.patch     | 32 +++++++++++++++++++
 meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/enum-int-mismatch.patch

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/enum-int-mismatch.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/enum-int-mismatch.patch
new file mode 100644
index 00000000..29b2e2f3
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/enum-int-mismatch.patch
@@ -0,0 +1,32 @@
+Fix function protype mismatches
+
+These are flagged by gcc13
+avs_gic.c:241:1: error: conflicting types for 'val_gic_get_info' due to enum/integer mismatch; have 'uint32_t(uint32_t)' {aka 'unsigned int(unsigned int)'} [-Werror=enum-int-mismatch]
+|   241 | val_gic_get_info(uint32_t type)
+|       | ^~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/ARM-software/sbsa-acs/pull/291]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/ShellPkg/Application/sbsa-acs/val/include/val_interface.h
++++ b/ShellPkg/Application/sbsa-acs/val/include/val_interface.h
+@@ -155,7 +155,7 @@ typedef enum {
+ void     val_wd_create_info_table(uint64_t *wd_info_table);
+ void     val_wd_free_info_table(void);
+ uint32_t val_wd_execute_tests(uint32_t level, uint32_t num_pe);
+-uint64_t val_wd_get_info(uint32_t index, uint32_t info_type);
++uint64_t val_wd_get_info(uint32_t index, WD_INFO_TYPE_e info_type);
+ uint32_t val_wd_set_ws0(uint32_t index, uint32_t timeout);
+ 
+ 
+--- a/ShellPkg/Application/sbsa-acs/val/src/avs_gic.c
++++ b/ShellPkg/Application/sbsa-acs/val/src/avs_gic.c
+@@ -238,7 +238,7 @@ val_get_cpuif_base(void)
+   @return  32-bit data
+ **/
+ uint32_t
+-val_gic_get_info(uint32_t type)
++val_gic_get_info(GIC_INFO_e type)
+ {
+   uint32_t rdbase_len;
+ 
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb b/meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb
index 95096e61..8c0473a7 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb
@@ -8,6 +8,7 @@ SRC_URI += "git://github.com/ARM-software/sbsa-acs;destsuffix=edk2/ShellPkg/Appl
             git://github.com/tianocore/edk2-libc;destsuffix=edk2/edk2-libc;protocol=https;branch=master;name=libc \
             file://shell.patch \
             file://use_bfd_linker.patch \
+            file://enum-int-mismatch.patch \
             file://0001-Revert-peripheral-test-3-updated-for-multiple-uarts.patch;patchdir=ShellPkg/Application/sbsa-acs \
             "
 
-- 
2.39.1


