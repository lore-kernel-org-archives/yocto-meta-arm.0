Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2131C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 18:25:25 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.2653.1713896724916889294
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 11:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=gGafft/E;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78efd0fcec4so373021385a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713896723; x=1714501523; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3edpkO/qASg/DbogN5ikxABStdJaI8w6tDeAZ/wThg=;
        b=gGafft/EX6DyfandetWdZ5wGCRnCgjs8Xl8bv7a4rM5HBLKaZ0nisvJ0CSGkZf75ft
         ASySV9EIhY8jXPloElv7TD0FkzBCH1Qgtf5cklkJX7cCTSCGXXaCTt+/6gfpiJ0OVrdH
         PFlyMt+BWR31unIByh7IxFSypzVv15/0lolLivsp3MfyXiAbk3PUXwVc/ikwQwggAu5a
         gIgseZzYeaw6Ya8uF3WZrz0HJ4HYD+T0Hzhca7HPAdHVlIqPTlAmWWxiAsEmlKvLoSjE
         wDDFNCbXp96EE/f3dgfu7kt+jImlABa3767TFrxbfselocRkeoDOc+jGkI7zCP6lbHkJ
         iJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713896723; x=1714501523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3edpkO/qASg/DbogN5ikxABStdJaI8w6tDeAZ/wThg=;
        b=PYJcdSDUWGQbekcS9oIlbmmv8A/ekUmV0fG0NurmHgURoSya383Iv4Y25nLQlM2uln
         IPhgze9bxS4o2ttH8crcmQmZ2PC0lwXxRvcRBsl52mfeNSLacIK+2AnH7Co3INHHz7wh
         EJXSOewW3sZf+hTUxsvhzejS+3zuRLjc55qkhwVHnyJdnjskZ/AT51BkCI/pDORTXr49
         30ELQ5o5niTgONGg2h0tjzMHSXiB2KMAcUHWeD17cjWkkkwgndfuNIzQ0TyNFcePId/D
         J3y9tykx8w1V044vaKXstwfp0TWA98zUjzXdI5psVxUme3gW2enFTZgGWeM9NNeB85jr
         bspQ==
X-Gm-Message-State: AOJu0YwTgk/SwFAl/oo2TAjwLeOG99mzNMQLe4tyNmPgugvldRv9sDd2
	DB1PyG1zFckXg16R5tM1uKf+1X9vppkl91wLyx1snvnwWMeNPm8fQc1l0K1IZogjPhUzGQSyjqM
	=
X-Google-Smtp-Source: AGHT+IFj3/q2nIJE8msIJqrme4Ky007GL9RT4+cHXn4wYT+ECF1gDE8liAXV7f+L5DIHXtCplmklDA==
X-Received: by 2002:a05:620a:574c:b0:790:8c77:19b9 with SMTP id wj12-20020a05620a574c00b007908c7719b9mr19182qkn.45.1713896723312;
        Tue, 23 Apr 2024 11:25:23 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id e8-20020a05620a12c800b0078ec0e6188asm5473195qkl.89.2024.04.23.11.25.23
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 11:25:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] Revert "arm-bsp/documentation: corstone1000: update capsule generation steps"
Date: Tue, 23 Apr 2024 14:25:15 -0400
Message-Id: <20240423182517.2590896-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 18:25:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5598

This reverts commit 527475c354d8897d96eb7cb7248f4207cd8f44f8.
---
 .../documentation/corstone1000/user-guide.rst | 95 +++++++++++--------
 1 file changed, 58 insertions(+), 37 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
index 778e0113da2a..06353b5d3e8e 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -692,6 +692,24 @@ incorrect capsule (corrupted or outdated) which fails to boot to the host softwa
 Check the "Run SystemReady-IR ACS tests" section above to download and unpack the ACS image file
  - ``ir-acs-live-image-generic-arm64.wic.xz``
 
+
+Download u-boot under <_workspace> and install tools:
+
+::
+
+  git clone https://github.com/u-boot/u-boot.git
+  cd u-boot
+  git checkout 83aa0ed1e93e1ffac24888d98d37a5b04ed3fb07
+  make tools-only_defconfig
+  make tools-only
+
+**NOTE:** The following error could happen if the linux build system does not have "libgnutls28-dev".
+ **error: "tools/mkeficapsule.c:21:10: fatal error: gnutls/gnutls.h: No such file or directory"**. If that's the case please install libgnutls28-dev and its dependencies by using the following command.
+
+::
+
+  sudo apt-get install -y libgnutls28-dev
+
 Download systemready-patch repo under <_workspace>:
 ::
 
@@ -701,48 +719,51 @@ Download systemready-patch repo under <_workspace>:
 Generating Capsules
 *******************
 
-A no-partition image is created during the Yocto build. An update capsule is generated using this ``.nopt`` image.
-This can be found in ``build/tmp_corstone1000-<fvp/mps3>/deploy/images/corstone1000-<fvp/mps3>/corstone1000-<fvp/mps3>_image.nopt``.
-The capsule's default metadata (name, version, etc.) can be found in ``meta-arm/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb``
-and ``meta-arm/kas/corstone1000-image-configuration.yml``.
+Generating FPGA Capsules
+========================
 
-FPGA Capsules
-=============
+::
 
-The generated capsule can be found in ``build/tmp_corstone1000-mps3/deploy/images/corstone1000-mps3/corstone1000-mps3-v6.uefi.capsule``.
-If a new capsule has to be generated with different metadata, then it can be done by using the ``u-boot-tools`` and the previously
-created ``.nopt`` image.
+   cd <_workspace>/build/tmp/deploy/images/corstone1000-mps3/
+   sh <_workspace>/systemready-patch/embedded-a/corstone1000/capsule_gen/capsule_gen.sh -d mps3
+
+This will generate a file called "corstone1000_image.nopt" which will be used to
+generate a UEFI capsule.
 
-For example a capsule for the negative update test scenario, if the host's architecture is x86_64:
 ::
 
    cd <_workspace>
 
-   ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mkeficapsule --monotonic-count 1 \
-   --private-key build/tmp/deploy/images/corstone1000-mps3/corstone1000_capsule_key.key \
+   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/tmp/deploy/images/corstone1000-mps3/corstone1000_capsule_key.key \
    --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_capsule_cert.crt --index 1 --guid df1865d1-90fb-4d59-9c38-c9f2c1bba8cc \
-   --fw-version 5 build/tmp_corstone1000-mps3/deploy/images/corstone1000-mps3/corstone1000-mps3_image.nopt corstone1000-mps3-v5.uefi.capsule
+   --fw-version 6 build/tmp/deploy/images/corstone1000-mps3/corstone1000_image.nopt cs1k_cap_mps3_v6
 
-This command will put the newly generated capsule to the ``<_workspace>`` directory.
+   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/tmp/deploy/images/corstone1000-mps3/corstone1000_capsule_key.key \
+   --certificate build/tmp/deploy/images/corstone1000-mps3/corstone1000_capsule_cert.crt --index 1 --guid df1865d1-90fb-4d59-9c38-c9f2c1bba8cc \
+   --fw-version 5 build/tmp/deploy/images/corstone1000-mps3/corstone1000_image.nopt cs1k_cap_mps3_v5
 
 Generating FVP Capsules
 =======================
 
-The generated capsule can be found in ``build/tmp_corstone1000-fvp/deploy/images/corstone1000-fvp/corstone1000-fvp-v6.uefi.capsule``.
-If a new capsule has to be generated with different metadata, then it can be done by using the ``u-boot-tools`` and the previously
-created ``.nopt`` image.
+::
+
+   cd <_workspace>/build/tmp/deploy/images/corstone1000-fvp/
+   sh <_workspace>/systemready-patch/embedded-a/corstone1000/capsule_gen/capsule_gen.sh -d fvp
+
+This will generate a file called "corstone1000_image.nopt" which will be used to
+generate a UEFI capsule.
 
-For example a capsule for the negative update test scenario, if the host's architecture is x86_64:
 ::
 
    cd <_workspace>
+   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
+   --certificate build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
+   --fw-version 6 build/tmp/deploy/images/corstone1000-fvp/corstone1000_image.nopt cs1k_cap_fvp_v6
 
-   ./build/tmp/sysroots-components/x86_64/u-boot-tools-native/usr/bin/mkeficapsule --monotonic-count 1 \
-   --private-key build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
+   ./u-boot/tools/mkeficapsule --monotonic-count 1 --private-key build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
    --certificate build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt --index 1 --guid 989f3a4e-46e0-4cd0-9877-a25c70c01329 \
-   --fw-version 5 build/tmp_corstone1000-fvp/deploy/images/corstone1000-fvp/corstone1000-fvp_image.nopt corstone1000-fvp-v5.uefi.capsule
+   --fw-version 5 build/tmp/deploy/images/corstone1000-fvp/corstone1000_image.nopt cs1k_cap_fvp_v5
 
-This command will put the newly generated capsule to the ``<_workspace>`` directory.
 
 Common Notes for FVP and FPGA
 =============================
@@ -761,15 +782,15 @@ Copying the FPGA capsules
 =========================
 
 The user should prepare a USB stick as explained in ACS image section `FPGA instructions for ACS image`_.
-Place the generated ``corstone1000-mps3-v<5/6>.uefi.capsule`` files in the root directory of the boot partition
-in the USB stick. Note: As we are running the direct method, the ``corstone1000-mps3-v<5/6>.uefi.capsule`` files
+Place the generated ``cs1k_cap`` files in the root directory of the boot partition
+in the USB stick. Note: As we are running the direct method, the ``cs1k_cap`` file
 should not be under the EFI/UpdateCapsule directory as this may or may not trigger
 the on disk method.
 
 ::
 
-   sudo cp <capsule path>/corstone1000-mps3-v6.uefi.capsule <mounting path>/BOOT/
-   sudo cp <capsule path>/corstone1000-mps3-v5.uefi.capsule <mounting path>/BOOT/
+   sudo cp cs1k_cap_mps3_v6 <mounting path>/BOOT/
+   sudo cp cs1k_cap_mps3_v5 <mounting path>/BOOT/
    sync
 
 Copying the FVP capsules
@@ -786,8 +807,8 @@ Then, copy the capsules:
 
 ::
 
-   sudo cp <capsule path>/corstone1000-fvp-v6.uefi.capsule /mnt/test/
-   sudo cp <capsule path>/corstone1000-fvp-v5.uefi.capsule /mnt/test/
+   sudo cp cs1k_cap_fvp_v6 /mnt/test/
+   sudo cp cs1k_cap_fvp_v5 /mnt/test/
    sync
 
 Then, unmount the IR image:
@@ -802,13 +823,8 @@ Then, unmount the IR image:
 Performing the capsule update
 ******************************
 
-During this section we will be using the capsule with the higher version (``corstone1000-<fvp/mps3>-v6.uefi.capsule``) for the positive scenario
-and the capsule with the lower version (``corstone1000-<fvp/mps3>-v5.uefi.capsule``) for the negative scenario.
-
-Running the FPGA with the IR prebuilt image
-===========================================
-
-Insert the prepared USB stick then Power cycle the MPS3 board.
+During this section we will be using the capsule with the higher version (cs1k_cap_<fvp/mps3>_v6) for the positive scenario
+and the capsule with the lower version (cs1k_cap_<fvp/mps3>_v5) for the negative scenario.
 
 Running the FVP with the IR prebuilt image
 ==========================================
@@ -821,6 +837,11 @@ Run the FVP with the IR prebuilt image:
 
 **NOTE:** <path-to-img> must start from the root directory. make sure there are no spaces before or after of "=". board.msd_mmc.p_mmc_file=<path-to-img>/ir-acs-live-image-generic-arm64.wic.
 
+Running the FPGA with the IR prebuilt image
+===========================================
+
+Insert the prepared USB stick then Power cycle the MPS3 board.
+
 Executing capsule update for FVP and FPGA
 =========================================
 
@@ -840,7 +861,7 @@ In case of the positive scenario run the update with the higher version capsule
 
 ::
 
-  EFI/BOOT/app/CapsuleApp.efi corstone1000-<fvp/mps3>-v6.uefi.capsule
+  EFI/BOOT/app/CapsuleApp.efi cs1k_cap_<fvp/mps3>_v6
 
 After successfully updating the capsule the system will reset.
 
@@ -848,7 +869,7 @@ In case of the negative scenario run the update with the lower version capsule a
 
 ::
 
-  EFI/BOOT/app/CapsuleApp.efi corstone1000-<fvp/mps3>-v5.uefi.capsule
+  EFI/BOOT/app/CapsuleApp.efi cs1k_cap_<fvp/mps3>_v5
 
 The command above should fail and in the TF-M logs the following message should appear:
 
-- 
2.30.2


