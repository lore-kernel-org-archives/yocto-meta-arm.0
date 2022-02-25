Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED44CC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:08:06 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.3520.1645765686363145863
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=tTC5KCsC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id f18so1530780qtb.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1AtxgvcYCt3AD0Wmeq6fhlbrS3zr9Jo2T7aopTysbqo=;
        b=tTC5KCsCEWGsDqcqydbIsQsh9Cprnfe7X1p+BZ1fFvH0sPnaxbhCI7h59i6Y3U/Hvu
         mZhq0GUuqIzU0h+rOM6sfKU1IaMJfUIB9pe6obM+5GtPWwf9IQN6AKCaVTfCKNoS+Wac
         BxF80Pyx/RY19tOt7F218g2RKqI+bVUM/dj/68GbgkUgjuT12LJcKLOxU8iaVshH5VEu
         GI4H6l/6J9xMqH4DwQcn8PBTP6roe6b+fFSpfp/wmnZcNDzc7iUhLgEWAoOOQGb9ylNF
         kZDZvb6HXU7Subyb7fYyW5j5RMqum+te5E2Vy6ybEwIb4gHaPlFbsGUN9ZeYOz0oTwyZ
         wj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1AtxgvcYCt3AD0Wmeq6fhlbrS3zr9Jo2T7aopTysbqo=;
        b=B+8sYhktwT4UIrniY0RoLa8rSZ6AIw6LcxVMlmj2S72zZLQd/so9nT3Ax1S35J3hTb
         mxaxwSlTI5C++yHngZ0tOLO+wN8yh876In+xxKJDSkWR+iT3CXlG5c6Gi5N+OzNIR7/R
         yi6VmQDpOxsbiVZg9rCGZ70nKxMt1M0/TJKCcSpiYJQUK0cVKZxvcE4ZrtFayCSF8XjE
         kUIbO9/tR0tgD2CY7/yfuYlKtrkXg++vBR16ahF5dV+qn1C4Phmy4sXolOfturX6G9D3
         cvhR2TbyCnNKFHzOj6WKwQbZ6Us4fsmHZh4X0RrTrxqzG3gPyoZ+RwwOEAHitPZJnYzu
         tUFA==
X-Gm-Message-State: AOAM5309JfgHbaiv69K0gfr4HKrmvLrnWOiqLVGn2/2aRF3fHIa1KnWY
	ALOKkXvca5Bf2KQiFi6b9cFttxyXeYhixw==
X-Google-Smtp-Source: 
 ABdhPJxgIl7Rz+EI9AasO/D1AC8UHsYbj/VXUyXwbzjOunZi1mTg2tsUuNg4ZCyMJysAdQ/PoF0agg==
X-Received: by 2002:ac8:7e85:0:b0:2dd:fe84:6bac with SMTP id
 w5-20020ac87e85000000b002ddfe846bacmr5546153qtj.128.1645765685349;
        Thu, 24 Feb 2022 21:08:05 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:97ee:8b84:aa35:fed0])
        by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b0064957b23a9csm778431qkc.118.2022.02.24.21.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:08:05 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 3/8] arm/edk2-firmware: unbreak builds with latest Clang
Date: Fri, 25 Feb 2022 00:07:58 -0500
Message-Id: <20220225050803.2517279-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225050803.2517279-1-jon.mason@arm.com>
References: <20220225050803.2517279-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 05:08:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3060

From: Ross Burton <ross.burton@arm.com>

The latest Clang produced unaligned access warnings, which EDK2 promotes
to errors with -Werror.

  edk2/MdeModulePkg/Include/Guid/ExtendedFirmwarePerformance.h:78:47:
  error: field Guid within 'FPDT_GUID_EVENT_RECORD' is less aligned than 'E=
FI_GUID'
  and is usually due to 'FPDT_GUID_EVENT_RECORD' being packed, which can le=
ad to
  unaligned accesses [-Werror,-Wunaligned-access]

This has been reported upstream so for now ignore this warning.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  1 +
 .../recipes-bsp/uefi/files/unaligned.patch    | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/uefi/files/unaligned.patch

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes=
-bsp/uefi/edk2-firmware.inc
index b1595e858b25..dc561eeff971 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -17,6 +17,7 @@ SRC_URI =3D "\
     ${EDK2_SRC_URI};name=3Dedk2;destsuffix=3Dedk2;nobranch=3D1 \
     ${EDK2_PLATFORMS_SRC_URI};name=3Dedk2-platforms;destsuffix=3Dedk2/edk2=
-platforms;nobranch=3D1 \
     file://0001-Fix-VLA-parameter-warning.patch \
+    file://unaligned.patch \
 "
=20
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
diff --git a/meta-arm/recipes-bsp/uefi/files/unaligned.patch b/meta-arm/rec=
ipes-bsp/uefi/files/unaligned.patch
new file mode 100644
index 000000000000..1930f4c741f9
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/unaligned.patch
@@ -0,0 +1,27 @@
+Latest clang is causing build failures because -Werror is used:=0D
+=0D
+  edk2/MdeModulePkg/Include/Guid/ExtendedFirmwarePerformance.h:78:47:=0D
+  error: field Guid within 'FPDT_GUID_EVENT_RECORD' is less aligned than '=
EFI_GUID'=0D
+  and is usually due to 'FPDT_GUID_EVENT_RECORD' being packed, which can l=
ead to=0D
+  unaligned accesses [-Werror,-Wunaligned-access]=0D
+=0D
+This has been reported upstream[1] so until this is resolved, ignore the w=
arnings.=0D
+=0D
+[1] https://edk2.groups.io/g/devel/message/86838=0D
+=0D
+Upstream-Status: Pending=0D
+Signed-off-by: Ross Burton <ross.burton@arm.com>=0D
+=0D
+diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template=0D
+index 2e6b382ab6..75bfbc5ae6 100755=0D
+--- a/BaseTools/Conf/tools_def.template=0D
++++ b/BaseTools/Conf/tools_def.template=0D
+@@ -2566,7 +2566,7 @@ DEFINE CLANG38_X64_PREFIX           =3D ENV(CLANG38_=
BIN)=0D
+ DEFINE CLANG38_IA32_TARGET          =3D -target i686-pc-linux-gnu=0D=0D
+ DEFINE CLANG38_X64_TARGET           =3D -target x86_64-pc-linux-gnu=0D=0D
+ =0D=0D
+-DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wno-ta=
utological-compare -Wno-tautological-constant-out-of-range-compare -Wno-emp=
ty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option=
=0D=0D
++DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wno-ta=
utological-compare -Wno-tautological-constant-out-of-range-compare -Wno-emp=
ty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option=
 -Wno-error=3Dunaligned-access=0D=0D
+ DEFINE CLANG38_ALL_CC_FLAGS         =3D DEF(GCC48_ALL_CC_FLAGS) DEF(CLANG=
38_WARNING_OVERRIDES) -fno-stack-protector -mms-bitfields -Wno-address -Wno=
-shift-negative-value -Wno-unknown-pragmas -Wno-incompatible-library-redecl=
aration -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -msoft-float -mno=
-implicit-float  -ftrap-function=3Dundefined_behavior_has_been_optimized_aw=
ay_by_clang -funsigned-char -fno-ms-extensions -Wno-null-dereference=0D=0D
+ =0D=0D
+ ###########################=0D=0D
--=20
2.30.2


