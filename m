Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1147C3DA4D
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 14:57:32 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.9892.1720796246109712128
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jul 2024 07:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=upCxftt2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.182, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e03618fc78bso1927194276.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720796245; x=1721401045; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldcEiO5JNjZlr6tjfyeCPKtvpECwLVEabQEEEqFN/3E=;
        b=upCxftt2cRblmNaBNrK+WMrTKV3cS/DBZNFQvQtjE0KhsNS/Ekpa/WN2UeUHNdp4jV
         1whcK6Uyzk/pqqGs3DokdrAVE8EYmS+ET7zyg0G8AUJIHUHB9amGUKPJ3lTmuHgI7TGl
         6jJAsZ9A/1N589F67NNgo/Q+JBr6vyEHHU6oc16aJJjLi8S1OOCa2CwWP6/CJTIhhvbV
         L78jr3wOMzAx2HhaV+yhQBAj/z7SRy5DIgc43pYfk86e4QLt1EBEiYvZUq8d+7AeXz6R
         88m21URI2mtOEYRoUotL3WBzNkZWZWhrnIH9lQ0xkK2LHy605Gbf81O8k7XW9KQGBkmi
         shMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720796245; x=1721401045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldcEiO5JNjZlr6tjfyeCPKtvpECwLVEabQEEEqFN/3E=;
        b=s6XchpmHg8zicm04fb+PssdcpFUeN/tm90LwzEM6+SjsZ7cvxgXZVhGlGSHKWcAO7+
         XnGmsEGl1W5QerF6paAXJ8CrN5uz6YD0r8EMDtf+9m4N/bDBo45fIBL3tWIw5f2uZdOR
         swD/uypqo4AkWfki5+qBGdX0GMBOiW1ICZgt/6JV5f1Ceaq9cLTbj/slZWXJkG+CuouB
         kdD3ESxTGHqxaFjjZSDaWAlcli0vlgo9Db9WG9guN3BJdrGftFecpzVVsvZBCiGcPkJl
         NaW9XUMwI6H9z6FY4o/ja14PwcQwYpM27kwWpcf0uXWtGRydsLr4ncOCnFjzNDuZPtzj
         WZhA==
X-Gm-Message-State: AOJu0Yy1b2DYB0RD1r0lhYhRPALspwVHg8xGWmPiGxtNW6w8GZ66uLYQ
	9fC+8N98rEL/flkNJZ3keswYeyNg+21AvJb0oD8pIAA2vVp7TogixcpRQvJ+HIrdhJJoXy/Ww8c
	=
X-Google-Smtp-Source: AGHT+IFemV6mM9EVNhAfo8TaWXlINoxk0m2G2GenL6Dly9si8REHC5BH/9UEAr0fRRtSpqDXFo/9pg==
X-Received: by 2002:a25:bf91:0:b0:e03:9a95:bc78 with SMTP id 3f1490d57ef6-e041b0a90d5mr13782716276.36.1720796244755;
        Fri, 12 Jul 2024 07:57:24 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a902284sm1303958276.36.2024.07.12.07.57.24
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:57:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/boot-wrapper-aarch64: update with latest patch
Date: Fri, 12 Jul 2024 10:57:22 -0400
Message-Id: <20240712145723.3914014-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240712145723.3914014-1-jon.mason@arm.com>
References: <20240712145723.3914014-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 14:57:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5889

Update to the latest commit.  The previous top commit was from 27 July 2021.
The commits since that commit are:
    aarch64: Enable access to MDSELR_EL1 from EL2 and below
    aarch64: enable Permission Indirection Extension
    aarch64: enable access to TCR2_ELx
    model.lds.S: Quote file paths
    Makefile: Change COUNTER_FREQ to 100 MHz
    sme: Fix sign-extension bug in SMCR_EL3 write
    fix array boundary check in find_logical_id
    aarch64: enable access to HCRX_EL2
    aarch64: Enable use of SME by EL2 and below
    aarch64: Document what we're doing when setting ZCR_EL3.LEN
    aarch64: Recognize PAuth QARMA3
    Makefile: avoid dtc warnings on re-compiling DTB
    Unify start_el3 & start_no_el3
    Rework bootmethod initialization
    Announce locations of memory objects
    aarch32: move the bulk of Secure PL1 initialization to C
    aarch64: move the bulk of EL3 initialization to C
    Announce boot-wrapper mode / exception level
    Rework common init C code
    aarch64: initialize SCTLR_ELx for the boot-wrapper
    aarch64: add mov_64 macro
    aarch32: add coprocessor accessors
    aarch64: add system register accessors

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
index d0605dd7a5f2..d0f7893d8cc8 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bb63326febfb5fb909226c8e7ebcef5c"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git;branch=master;protocol=https"
-SRCREV = "d3b1a15d18542b2086e72bfdc3fc43f454772a3b"
+SRCREV = "5e3760073454c72f3458805a1b7a89ecf80353cb"
 
 # boot-wrapper doesn't make releases
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.30.2


