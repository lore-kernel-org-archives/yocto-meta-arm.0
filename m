Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D83C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 08:50:14 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.61342.1643791813477779985
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 00:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Af50ls5i;
 spf=pass (domain: linaro.org, ip: 209.85.214.181,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f181.google.com with SMTP id d18so17645635plg.2
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 00:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4s+F5waCXFYkiWEPiJZIwqJjA0oEqDOwoRHTpPZeT0=;
        b=Af50ls5iqpBiEjEylcD56G/l33kxtGjeAGF4oWgjP8QkIPd6oWPyjnrvk68Mctkm9R
         uKeKWgUJoeCEgxNjXYpWLHcFwkH38pOFkLEN2s4c1rsgKbATEGV7S8gEVDSZazxuyIML
         vNNJmk+nH+Lze6DmC/U2wp8uflGlXSH9LhRUuO9wnKKGF51cWryzTm+iYPa6EkBmZYQ4
         rEa12n7ZPbgSI6xpJv9/N8Q+yyplrTnX0QOvB0DpzOWc9WvIJ2jp7cMsX0Y1aHmIkRAT
         M+FSq31QEMCJI3y5GHDb2KOmY8GcY4lU10LLlspLoancjeoeHGXdv1WS6O12spglOOc0
         XIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4s+F5waCXFYkiWEPiJZIwqJjA0oEqDOwoRHTpPZeT0=;
        b=fXv8XBH4tkWjx4F/2dlgaO4QQZ5bW/klyR1qcnEIJM5b9zGWdtzAJDpGwuPy4hB118
         ye10vNKuZhyi0Fvuz07i2iBaQI5cVOm1oGw5rlcDZ9J/EH9ktWcpho/w06/xTa5XUju1
         KPyEFU0b7k2so7dAiZgzUG9uZ5Xg1USpt93eCHndkzG6wpxwAykApHl93kTli6ICa/oD
         zdORSYpYZcTEPu/Eaxxiu8uU21Uo6pDIH2rA59GzbhW0Q0OvpPKhOTMuJPuRWfIFO24L
         UYjionTRc0jsjqaivx51oudYZObijcQlTNWlE8F1QG5Ui+8v8qweJOhIZll0DPJzxo6j
         bldg==
X-Gm-Message-State: AOAM5307jd655/oEkPCwi2AdafK+ADFW8NZYZ3MMKFUZattjEd8rZXDn
	ANmeYh7LWUMkTJhMDcl1mB9YNLZLMIA1kOye
X-Google-Smtp-Source: 
 ABdhPJxL6CFDFTh2gPtC57F+2JUHXlb0Tu7AVQQZ2zyXa+36b6an9eFq2VbALPzJ/DDiAS6jrtcLuw==
X-Received: by 2002:a17:90a:eac1:: with SMTP id
 ev1mr6993066pjb.27.1643791812600;
        Wed, 02 Feb 2022 00:50:12 -0800 (PST)
Received: from localhost.localdomain ([223.178.210.209])
        by smtp.gmail.com with ESMTPSA id
 l8sm25026444pfc.187.2022.02.02.00.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 00:50:12 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	daniel.thompson@linaro.org,
	ralph.siemsen@linaro.org,
	nicolas.dechesne@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [dunfell][PATCH] arm-toolchain: gcc-arm-9.2: Fix mangled patch
Date: Wed,  2 Feb 2022 14:19:55 +0530
Message-Id: <20220202084955.1644906-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Feb 2022 08:50:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2937

Apply commit dce28d8ac7fb ("gcc: Fix mangled patch") to
meta-arm-toolchain as well as it fixes a build problem when trying to
build kernel with gcc-plugins support.

Reported-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 ...12-gcc-Fix-argument-list-too-long-error.patch | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0012-gcc-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0012-gcc-Fix-argument-list-too-long-error.patch
index 6053979..f0b79ee 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -1,7 +1,7 @@
-From 2cb227cd8069c73242286f64183fb203f8d2618a Mon Sep 17 00:00:00 2001
+From faa0f712a67005ef0260f95eebe7c7c57a6f8360 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:26:37 +0400
-Subject: [PATCH 12/36] gcc: Fix argument list too long error.
+Subject: [PATCH 12/39] gcc: Fix argument list too long error.
 
 There would be an "Argument list too long" error when the
 build directory is longer than 200, this is caused by:
@@ -17,24 +17,28 @@ $(sort list) doesn't need this.
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+RP: gcc then added *.h and *.def additions to this list, breaking the original
+fix. Add the sort to the original gcc code, leaving the tr+sort to fix the original
+issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
+
 Upstream-Status: Pending
 ---
  gcc/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 41f0f592ff4..0064a282488 100644
+index fef6c4c61e3..57cf7804f0a 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3537,7 +3537,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3538,7 +3538,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  # We keep the directory structure for files in config or c-family and .def
  # files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
 -	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
-+	headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \
++	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
  	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
  	for file in $$headers; do \
  	  if [ -f $$file ] ; then \
 -- 
-2.22.1
+2.25.1
 
-- 
2.25.1


