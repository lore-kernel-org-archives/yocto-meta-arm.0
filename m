Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2862C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 00:51:30 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.461.1647046290091473616
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=3zWY/jJ6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id e22so8284990qvf.9
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ItW8Ln+e/iXfm4aFlpUoufaYQFwpyM3RpUJ/crbbVA=;
        b=3zWY/jJ6QbE1VpxzAam7BcmCaBS3ycga4X8Nyzf6p4aC4hNXfiSeytytjLLTFg4sqD
         94Nf3iY7/xVVhDZ17EzmlBtAWfOjyZbah6nM2FrKYhq/vxQ2zjq1fW2C4V8AMrhok5es
         pKUqu6+WXyATiuuapjqv4z+cdig+0nKx6fpbxhRsNgHKo6MGNAZ/PrbI8vFQqbTq6Xui
         w6xWsCS9YSaJulkQVkWbDmMPC8JExj2CboySl1hx1ZOawSnlW2IXNILHqeNVsfbDJRG8
         vawqddBeL2q70KQEg7UJ4uQLQz0tS9SkZORLreOfAvdIg/+ZaSjLe4jmPsxCoO+YR3qU
         9rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ItW8Ln+e/iXfm4aFlpUoufaYQFwpyM3RpUJ/crbbVA=;
        b=kShQk3PZXkveJJzBG3xDLI78wj6ylpSvBu4qHtcQJpsorrjHOye4C7lp1RpMK0vEOc
         MCkucGGfJYme1V6e7BrziPtAieaHOZJAWoRpRWJ6kXgYtiCR1Lt+pN8eq/D3+G1JehWG
         qLaot/KQCNOVmBNEEZUgJKoAosFuUKSvLmQlPbDdyzpvo71mG72XvG5gUf7pX5QW8Poc
         g4iHak0Mk+uWHxyTLgtdQCp/EqIxXbLdl2Uwwt8gciQ1UUYPAyNgjKFFHkR4tRbXoiP4
         dBjCp5bKGHVOm7GHFMTP8+IM+WSNdO+INkJq38PAYtIjPCi64QefZbgg41qDEk7NKppE
         c0+w==
X-Gm-Message-State: AOAM532TuCgHV1lQdbxDmRHu1VyrJzOXJjuDwI9w5jnnHE0mRYBK4vcc
	iykGmozbDamo9/zOSf6iyOVlNgKr8MWAhw==
X-Google-Smtp-Source: 
 ABdhPJwgdFNVEJByVSWvaEXUF5o6bZRDQMRJONwg+iCZiUDt0derwjzp6vCrGvj5UfnxIFMHO8kvvw==
X-Received: by 2002:a05:6214:5284:b0:42c:8d98:53ee with SMTP id
 kj4-20020a056214528400b0042c8d9853eemr10032343qvb.114.1647046288928;
        Fri, 11 Mar 2022 16:51:28 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:77d1:5990:d885:810c])
        by smtp.gmail.com with ESMTPSA id
 v5-20020a05622a144500b002e1c7d027b1sm519504qtx.66.2022.03.11.16.51.28
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 16:51:28 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH gatesgarth 1/2] arm-bsp: fix yylloc kernel build error
Date: Fri, 11 Mar 2022 19:51:27 -0500
Message-Id: <20220312005128.3864989-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 12 Mar 2022 00:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3162

Backport patch from upstream to address the following error:
scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ve-redundant-YYLOC-global-declaratio.patch | 54 +++++++++++++++++++
 .../recipes-kernel/linux/linux-yocto_5.3.bb   |  4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
new file mode 100644
index 000000000000..efd9803ac792
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Backport
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+From e33a814e772cdc36436c8c188d8c42d019fda639 Mon Sep 17 00:00:00 2001
+From: Dirk Mueller <dmueller@suse.com>
+Date: Tue, 14 Jan 2020 18:53:41 +0100
+Subject: [PATCH] scripts/dtc: Remove redundant YYLOC global declaration
+
+gcc 10 will default to -fno-common, which causes this error at link
+time:
+
+  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
+
+This is because both dtc-lexer as well as dtc-parser define the same
+global symbol yyloc. Before with -fcommon those were merged into one
+defintion. The proper solution would be to to mark this as "extern",
+however that leads to:
+
+  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
+   26 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+In file included from dtc-lexer.l:24:
+dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
+  127 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+cc1: all warnings being treated as errors
+
+which means the declaration is completely redundant and can just be
+dropped.
+
+Signed-off-by: Dirk Mueller <dmueller@suse.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+[robh: cherry-pick from upstream]
+Cc: stable@vger.kernel.org
+Signed-off-by: Rob Herring <robh@kernel.org>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index 5c6c3fd557d7..b3b7270300de 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -23,7 +23,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
index 9d5e9ce82acd..d81d3f4e6e46 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
@@ -6,7 +6,9 @@ SRCREV_machine = "d4f3318ed8fab6316cb7a269b8f42306632a3876"
 SRCREV_meta = "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA} \
+           file://0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch \
+          "
 
 LINUX_VERSION = "5.3.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-- 
2.30.2


