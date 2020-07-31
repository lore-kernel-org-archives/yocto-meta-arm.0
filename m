Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.16299.1596194416494487980
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 04:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=VH6LLw8e;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id z18so24094376wrm.12
        for <meta-arm@lists.yoctoproject.org>; Fri, 31 Jul 2020 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XE7WzF367hBGP9K81mEniTmmjnvDveMiVQQy7dr7b1M=;
        b=VH6LLw8eK3b6o3EjlpKSh72msLrOWwfQzg/bE9EbZIEhNs7GkaQxjbLDW++PfaMQma
         PVOtvZXNVbrLPfGwkEtJaJfOnMOqRxME7DAp7tcQTBJKIEZr/NF5QtGk/gFU/4NqabQl
         tii0zC6omUAJvJ+gCKsiMa7jwgti1nOzf3fNfE2cVHFUpEKeW+7nomJikcohbwjiROY2
         NVXEymWVnj/OMyeRV1B68dudX3hp3dt0zsazelabY3ibUbL+xbCLSegjCtO6maORyUHs
         WE1bEZ/az9fFqbbc54Kk+8U0mrneS7M7b6A7+dKNXlm5mFZ0NmywkTgyQzp97+7m/arD
         TEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XE7WzF367hBGP9K81mEniTmmjnvDveMiVQQy7dr7b1M=;
        b=hFa7N61dppFh0tavqgOH21c2Y0136EdFOsoNh0z0Y6yQEI+H+493lRPqwVNzuyAnHw
         nm6DLtTDRb8hmcXm3nUF6eau+PlaUhW4PoBjEn3KDLi8UKpWe9qB0UtPM1nveReM+4P9
         +SYBl9UqmFb1qjDCLsWnWDBBYvannOK5ysnkq9/oPV9ohswgDitMUze12DWf0f2uLwx0
         0uwxXWf/3pRl4SXU2k63xBy1syzSeYj/d52PLrgpxKneXy49UvJlS4QY75c4bDOPiWdG
         ABHlda4uHj4Ro9sVTPFQ+mgU4Bd4pJ4/agXnRh6YA5dB86J7EGfp6g1rTfQq7mbVzMFc
         QuIA==
X-Gm-Message-State: AOAM532hE9iYaiPO4doWxgmGErzwvk79Ub/PMt4d2o1JyaJWfK0ud0VC
	PXeJnRe+xqqsKGEQwQeyTCgbnJDcOiU=
X-Google-Smtp-Source: ABdhPJy9LJBWeW1S3oMlDkjBeVdeJl6VEWr5JEexfqj7zv+VR+6QIC6ACJ6hCuK4JuoIROtGvRBHVg==
X-Received: by 2002:adf:f58c:: with SMTP id f12mr3086294wro.314.1596194414477;
        Fri, 31 Jul 2020 04:20:14 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id 8sm14326902wrl.7.2020.07.31.04.20.13
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 04:20:13 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] optee-os: fix build race
Date: Fri, 31 Jul 2020 12:20:11 +0100
Message-Id: <20200731112011.1862712-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

There's a rare build race where mk/conf.mk.tmp is written to before mk/
exists.  Add an explicit mkdir so that this directory is sure to exist.

Change-Id: I4e907f395679da9354d386301e7bf5da46afdbaf
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../optee/optee-os/missing-mkdir.patch        | 31 +++++++++++++++++++
 .../recipes-security/optee/optee-os_git.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch b/meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch
new file mode 100644
index 0000000..db1b47f
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/4000]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 79384a244d1972cdb02114f5cde6fcaf2e014c9b Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome@forissier.org>
+Date: Tue, 28 Jul 2020 17:28:43 +0200
+Subject: [PATCH] build: fix race when generating conf.mk
+
+This patch fixes the following error triggered by a heavily parallel build:
+
+ echo sm := ta_arm64 > .../export-ta_arm64/mk/conf.mk.tmp
+ /bin/bash: .../export-ta_arm64/mk/conf.mk.tmp: No such file or directory
+
+Fixes: https://github.com/OP-TEE/optee_os/issues/3999
+Signed-off-by: Jerome Forissier <jerome@forissier.org>
+---
+ ta/ta.mk | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ta/ta.mk b/ta/ta.mk
+index 59ed87f71d..ad97edaf08 100644
+--- a/ta/ta.mk
++++ b/ta/ta.mk
+@@ -190,6 +190,7 @@ define mk-file-export
+ .PHONY: $(conf-mk-file-export)
+ $(conf-mk-file-export):
+ 	@$$(cmd-echo-silent) '  CHK    ' $$@
++	$(q)mkdir -p $$(dir $$@)
+ 	$(q)echo sm := $$(sm-$(conf-mk-file-export)) > $$@.tmp
+ 	$(q)echo sm-$$(sm-$(conf-mk-file-export)) := y >> $$@.tmp
+ 	$(q)($$(foreach v, $$(ta-mk-file-export-vars-$$(sm-$(conf-mk-file-export))), \
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index 52c1155..deeb515 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch \
     file://0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://missing-mkdir.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.26.2

