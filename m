Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7ECC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 17:25:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.15677.1676222743962548978
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 09:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qhbGQ3E4;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id bd35so1519412pfb.6
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOFbwbLw8VGeaHPVvqj9f5wMwYuRUkYej/eAYGwfFyY=;
        b=qhbGQ3E4Hkp/1/f2rUUO5nLgmF29h5qb6kVDuqtptj+6wWrmWJ4Zp504gwDRT/YTVT
         5DFh0jE3QWCGeC8xDGRXJWH1AhWpUHCqOt2R1TwslIAAS8FIhEmqvBCc8NKmAf6HOacg
         5Yub8Mx4yZ9RIfEOpHs/2u3Z5nFl3PJrWXZR9ZvkyRxNr3AnMFZZEp/3ovZYMY65kfok
         d15RQbuBZfwX9rRhewA5GUN8mG/1vW6iNA2LCxF43vDGSvUBNN89BK6pQn/m/YNS9eth
         mN4DG51lDQD8H2yWEB6UAF3moBmKSXfqN3C0ltkHG2557So575yAeg/uFLPXjQsiiGGR
         3pSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOFbwbLw8VGeaHPVvqj9f5wMwYuRUkYej/eAYGwfFyY=;
        b=4S4G/LqeWZNhvPWhDTEagVMLhGnK9Cmhyk3rVOJNnkdCpkLLswm4/8WeBX20goxvbk
         9GlbkahgRplbPFYsRZbn333cjFg26ZWmX1yxQx6Y1s3LUT03yUtPU97h+Iq5dMixN5H7
         zOBcZCx4g0YhImTpUUvM0KjYkJnWUze6CdAi1UTFdZwllb9X1FFhCDTJ3WsgN50xEG3Y
         UWvAt9KJ5vU9YsNKPcKNe4cHgCInlBxQHNcnh0NBhSNIbpSnUwBDg7/iKBHZKi078/FA
         2EHAsctnAcVinJ72UAqtvO2JBFyi5Wc37WY+/BWsxK2Ya+BkJ1QUC4rqTcdtUAlBedJ9
         2SiQ==
X-Gm-Message-State: AO0yUKWJEsZeREthL6w7Ty2gR9ZKaMVkoFLpiq5RnJ2eODCj74OmjkJ3
	eKlZufSysclmkFBxaWyhW3h5q6wfQe8=
X-Google-Smtp-Source: AK7set+zamQGjWmQGoq+oB0CVHdOh2VEViip2IqOG8ForQ9J8C4fWDwWLAESc+ElQIfcjX4b0ILxGA==
X-Received: by 2002:a62:7b83:0:b0:5a8:a8b5:d185 with SMTP id w125-20020a627b83000000b005a8a8b5d185mr3172984pfc.1.1676222743113;
        Sun, 12 Feb 2023 09:25:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::789d])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7848a000000b0058d8f23af26sm6335541pfn.157.2023.02.12.09.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 09:25:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee-os: Forward port 0008-no-warn-rwx-segments.patch to 3.19.0
Date: Sun, 12 Feb 2023 09:25:40 -0800
Message-Id: <20230212172540.2898451-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 17:25:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4380

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0008-no-warn-rwx-segments.patch           | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-segments.patch
index 2dc797b3..5a9bad6d 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-segments.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-segments.patch
@@ -1,38 +1,36 @@
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 0e96e606c..3fbcb6804 100644
 --- a/core/arch/arm/kernel/link.mk
 +++ b/core/arch/arm/kernel/link.mk
-@@ -37,6 +37,7 @@ link-ldflags += --sort-section=alignment
+@@ -25,6 +25,7 @@ link-ldflags += -T $(link-script-pp) -Ma
+ link-ldflags += --sort-section=alignment
  link-ldflags += --fatal-warnings
  link-ldflags += --gc-sections
- link-ldflags += $(link-ldflags-common)
 +link-ldflags += $(call ld-option,--no-warn-rwx-segments)
  
  link-ldadd  = $(LDADD)
  link-ldadd += $(ldflags-external)
-@@ -61,6 +62,7 @@ link-script-cppflags := \
+@@ -49,6 +50,7 @@ link-script-cppflags := \
  		$(cppflagscore))
  
  ldargs-all_objs := -T $(link-script-dummy) --no-check-sections \
 +		   $(call ld-option,--no-warn-rwx-segments) \
- 		   $(link-ldflags-common) \
  		   $(link-objs) $(link-ldadd) $(libgcccore)
  cleanfiles += $(link-out-dir)/all_objs.o
-@@ -75,7 +77,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/all_objs.o
+ $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
+@@ -61,7 +63,7 @@ $(link-out-dir)/unpaged_entries.txt: $(l
+ 	$(q)$(NMcore) $< | \
  		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
  
- unpaged-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
--		 $(link-ldflags-common)
-+		 $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
+-unpaged-ldargs = -T $(link-script-dummy) --no-check-sections --gc-sections
++unpaged-ldargs = -T $(link-script-dummy) --no-check-sections --gc-sections $(call ld-option,--no-warn-rwx-segments)
  unpaged-ldadd := $(objs) $(link-ldadd) $(libgcccore)
  cleanfiles += $(link-out-dir)/unpaged.o
  $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
-@@ -104,7 +106,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_objs.o
+@@ -89,7 +91,7 @@ $(link-out-dir)/init_entries.txt: $(link
+ 	$(q)$(NMcore) $< | \
  		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
  
- init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
--	       $(link-ldflags-common)
-+	       $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
+-init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections
++init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections $(call ld-option,--no-warn-rwx-segments)
  init-ldadd := $(link-objs-init) $(link-out-dir)/version.o  $(link-ldadd) \
  	      $(libgcccore)
  cleanfiles += $(link-out-dir)/init.o
-- 
2.39.1


